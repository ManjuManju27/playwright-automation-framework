
// setup/hooks.js

// 🔥 ENSURE API KEY
if (!process.env.APPLITOOLS_API_KEY) {
  process.env.APPLITOOLS_API_KEY = 'RoQf4TUaOtZ39ZswMFXpHnLw2B6SY0rQyPjDxFMi7A4110'; // replace
}

const config = require('../utils/envConfig');
const { chromium, firefox } = require('@playwright/test');
const homepagelocators = require('../locators/HomePageLocators.json');
const SmokeTestLocators = require('../locators/SmokeTestLocators.json');

const {
  BeforeAll,
  AfterAll,
  Before,
  After,
  AfterStep,
  setDefaultTimeout,
  Status
} = require('@cucumber/cucumber');

const fs = require('fs');
const users = require('../Users/users.json');

const { LoginPage } = require('../pages/loginPage');
const { CountryProfile } = require('../pages/country_Profile');
const { SmokeTest } = require('../pages/smoke_test_page');

// 🔥 Applitools
const { Eyes, Target } = require('@applitools/eyes-playwright');

setDefaultTimeout(60 * 1000);

/* ---------------- GLOBALS ---------------- */
let browser;
let context;
let page;
let user;
let eyes;

/* ---------------- BEFORE ALL ---------------- */
BeforeAll(async function () {

  const browserType = config.browser === 'firefox' ? firefox : chromium;

  browser = await browserType.launch({
    headless: config.headless,
    args: ['--start-maximized']
  });

  context = await browser.newContext({ viewport: null });
  page = await context.newPage();

  if (!users || users.length === 0) {
    throw new Error("❌ users.json is empty");
  }

  user = users[0];

  await page.goto(config.baseUrl);
  await page.fill(homepagelocators.usernameField, user.username);
  await page.fill(homepagelocators.passwordField, user.password);
  await page.click(homepagelocators.loginButton);

  await page.waitForSelector(SmokeTestLocators.Help, { timeout: 60000 });

  console.log('✅ Logged in successfully');
});

/* ---------------- BEFORE EACH SCENARIO ---------------- */
Before(async function (scenario) {

  console.log("🔥 BEFORE HOOK STARTED");

  this.page = page;

  const scenarioName = scenario?.pickle?.name || 'Default Scenario';

  // 🔥 Applitools init
  eyes = new Eyes();
  console.log("🔥 Eyes instance created");

  try {
    await eyes.open(page, 'CDMNext App', scenarioName);
    console.log("🔥 Eyes OPENED successfully");
  } catch (err) {
    console.log('❌ Eyes open failed:', err.message);
  }

  // 🔥 FORCE CHECK (temporary debug)
  try {
    await eyes.check('Initial Page', Target.window().layout());
    console.log("🔥 Initial check executed");
  } catch (e) {
    console.log("❌ Initial check failed:", e.message);
  }

  // ===== YOUR ORIGINAL CODE (UNCHANGED) =====

  await page.goto(config.baseUrl);

  const resetButton = page.locator("(//span[contains(text(),'Reset')])[1]");
  if (await resetButton.isVisible().catch(() => false)) {
    await resetButton.click();
  }

  const closeIcon = page.locator("//*[@class='movable-modal--close']");
  if (await closeIcon.isVisible().catch(() => false)) {
    await closeIcon.click();
  }

  await page.locator("//a[.='My insights']").click();
  await page.locator("//*[@title='View as a table']").waitFor({ state: 'visible' });
  await page.locator("//*[@title='View as a table']").click();

  const firstCheckbox = page.locator("(//*[@class='insight-table-item--checkbox'])[1]");
  if (await firstCheckbox.isVisible().catch(() => false)) {
    await firstCheckbox.click();
    await page.locator("//button[@title='Delete']").click();
    await page.locator("//*[@class='sphere-modal-control button button__primary']").click();
    await page.locator("//div[contains(@class,'index-module_notification_actions')]/button").click();
  }

  await page.locator("//button[@title='Create new insight']").click();
  await page.locator("//button[@class='sphere-modal-control button button__primary']").click();

  const resetButton1 = page.locator("(//span[contains(text(),'Reset')])[1]");
  if (await resetButton1.isVisible().catch(() => false)) {
    await resetButton1.click();
  }

  this.loginPage = new LoginPage(page);
  this.countryProfilePage = new CountryProfile(page);
  this.SmokeTestPage = new SmokeTest(page);

  console.log(`🚀 Scenario Started: ${scenarioName}`);
});

/* ---------------- AFTER STEP ---------------- */
AfterStep(async function ({ result, pickle }) {

  const dir = './reports/screenshots';
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });

  const statusLabel =
    result.status === Status.FAILED ? 'FAILED' :
    result.status === Status.PASSED ? 'PASSED' :
    result.status;

  const safeName = pickle.name.replace(/[^a-zA-Z0-9]/g, '_');

  const screenshotPath = `${dir}/${safeName}_${statusLabel}.png`;

  await page.screenshot({ path: screenshotPath, fullPage: true });

  const image = fs.readFileSync(screenshotPath);
  await this.attach(image, 'image/png');
});

/* ---------------- AFTER EACH SCENARIO ---------------- */
After(async function () {

  console.log("🔥 AFTER HOOK STARTED");

  try {
    if (eyes) {
      console.log("🔥 Running final Applitools check");

      await eyes.check('Final Page', Target.window().layout());

      console.log("🔥 Closing Eyes");

      await eyes.close();
    }
  } catch (err) {
    console.log('❌ Applitools error:', err.message);
  } finally {
    if (eyes) {
      await eyes.abortIfNotClosed();
    }
  }
});

/* ---------------- AFTER ALL ---------------- */
AfterAll(async function () {

  if (browser) {
    await browser.close();
    console.log('🧹 Browser closed');
  }
});
