const { Given, When, Then, defineStep } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test'); // ✅ REQUIRED
const SmokeTestLocators  = require('../locators/SmokeTestLocators.json');
const path = require('path');
const fs = require('fs');
const os = require('os');



defineStep('I click on the {string} menu bar', async function (sectionName) {
  await this.SmokeTestPage.navigateToSection(sectionName);
  this.attach(`Clicked On '${sectionName}'`);
});

When('I click on {string}', async function (string) {
  const chartSettings = this.page.locator(`//div[contains(@class,'index-module_popup')]//div[text()='${string}']`);

  await eyes.check(chartSettings).toBeVisible({ timeout: 30000 });
  await chartSettings.click();
  this.attach(`Clicked On '${string}'`);
});

Then('Verify page loaded {string}', async function (popupName) {
  const page = this.page;
  const context = page.context();

  const popupLocators = {
    "Video tutorials": "//div[@class='movable-modal--body-wrapper']",
    "Search help": "//div[@class='modal-content sphere-modal__content']",
    "CEIC mnemonic codes": "//div[@class='movable-modal--body-wrapper']",
    "Footnotes" : "//div[@class='movable-modal--window ui-resizable ui-draggable']",
    "Keyboard shortcuts": "//div[@class='shortcuts-modal']",
    "Excel Addin": "//div[@class='installation']",
    "WPS Addin": "//div[@class='installation']",
    "API": "//div[contains(@class,'help-sdk installation')]",
    "R": "//div[@class='installation']",
    "PyCEIC": "//div[@class='installation']",
    "EViews": "//div[@class='installation']",
    "Online tours": "//div[@class='help-bubble']",
    "Email us" : "//div[@class='modal-header sphere-modal__header']",
    "Report a problem" : "//div[@class='report-problem-s--modal-content']"
  };

  const locator = popupLocators[popupName];

  if (!locator) {
    throw new Error(`❌ No locator defined for popup: ${popupName}`);
  }

  // 🧠 Store current pages count
  const pagesBefore = context.pages().length;

  // ⏳ Small wait (in case new tab opens)
  await page.waitForTimeout(2000);

  const pagesAfter = context.pages().length;

  // 🔀 CASE 1: New tab opened
  if (pagesAfter > pagesBefore) {
    const newPage = context.pages()[pagesAfter - 1];

    await newPage.waitForLoadState();
    console.log(`🆕 Switched to new tab for ${popupName}`);

    // ✅ Do your validation here if needed
    // Example:
    // await expect(newPage).toHaveTitle(/something/);

    // ❌ Close new tab
    await newPage.close();

    // 🔙 Back to main page
    await page.bringToFront();
    console.log(`🔙 Returned to main page`);
  } else {
    // 📌 CASE 2: Popup inside same page
    const popup = page.locator(locator);

    await popup.waitFor({ state: 'attached', timeout: 10000 });
    await page.mouse.wheel(0, 300);
    await eyes.check(popup).toBeVisible({ timeout: 10000 });

    console.log(`✅ ${popupName} popup is displayed`);
  }
});

Then(
  'the Help popup should be displayed with the options : {string} , {string} , {string} , {string} , {string} .',
  async function (opt1, opt2, opt3, opt4, opt5) {

    const helpPopup = this.page.locator('//div[@class="help-popup"]');

    // ✅ Playwright expect (NOT Chai)
    await expect(helpPopup).toBeVisible({ timeout: 30000 });

    const options = [opt1, opt2, opt3, opt4, opt5];

    for (const option of options) {
      const optionLocator = this.page.locator(
        `//div[contains(@class,"help-popup")]//*[normalize-space(text())='${option}']`
      );

      await eyes.check(optionLocator).toBeVisible({ timeout: 10000 });
      console.log(`✅ Option visible: ${option}`);
    }
  }
);

When('I click on the CEIC logo', async function () {
  const ceicLogo = this.page.locator("//div[@class='application-logo']");

  await expect(ceicLogo).toBeVisible({ timeout: 30000 });
  await ceicLogo.click();

  console.log('Clicked on CEIC logo');
});

Then(
  'the default insight {string} should be loaded in the right panel',
  async function (expectedInsight) {

    const insightTitle = this.page.locator(
      "//div[@class='insight-breadcrumb--title-block text-dots']"
    );

    await expect(insightTitle).toBeVisible({ timeout: 30000 });
    await expect(insightTitle).toHaveText(expectedInsight);

    console.log(`✅ Default insight loaded: ${expectedInsight}`);
  }
);

When('I click on the {string} button', async function (buttonName) {
  const importButton = this.page.locator(SmokeTestLocators.ImportButton);

  await expect(importButton).toBeVisible({ timeout: 30000 });
  await importButton.click();

  console.log(`Clicked on ${buttonName} button`);
});

Then('the Import series popup should be displayed', async function () {
  const popup = this.page.locator(
    "//div[contains(@class,'movable-modal--window')]"
  );

  await expect(popup).toBeVisible({ timeout: 30000 });

  console.log('✅ The Import series popup is displayed');

  // Optional: close popup
  // await this.page.locator("//div[@title='Close']").click();
});

Given(
  'Create a visual with {string} series {string}',
  async function (seriesCount, seriesName) {

    const count = parseInt(seriesCount, 10);
    const page = this.page;
    this.list1 = this.list1 || [];

    // Click on Series tab
    await page.locator("//span[contains(text(),'Series')]").click();

    // Focus and clear search input
    const searchInput = page.locator("//input[@class='search-input-text']");
    await searchInput.waitFor({ state: 'visible', timeout: 8000 });
    await searchInput.click();
    await searchInput.fill(''); // clear
    await searchInput.type(seriesName);
    await searchInput.press('Enter');

    // Select series checkboxes
    for (let i = 1; i <= count; i++) {
      const checkbox = page.locator(
        `(//*[@class='series-list-item--checkbox svg-checkbox'])[${i}]`
      );
      await checkbox.waitFor({ state: 'visible', timeout: 8000 });
      await checkbox.click();
    }

    // Collect series names
    const seriesNames = page.locator("//*[@class='series-item--name']");
    const total = await seriesNames.count();

    for (let i = 0; i < total; i++) {
      const title = await seriesNames.nth(i).innerText();
      this.list1.push(title);
    }

    console.log('✅ Series added:', this.list1);
  }
);

defineStep('Right click on series', async function () {
  const page = this.page;

  // Locate first series name
  const seriesName = page.locator("(//*[@class='series-item--name'])[1]");

  // Wait until visible
  await seriesName.waitFor({ state: 'visible', timeout: 4000 });

  // Right-click (context click)
  await seriesName.click({ button: 'right' });

  console.log('✅ Right-clicked on first series');
});

defineStep('click on Add chart', async function () {
  const page = this.page;

  const addChartButton = page.locator(
    "(//*[contains(text(),'Add chart')])[2]"
  );

  await addChartButton.waitFor({ state: 'visible', timeout: 10000 });
  await addChartButton.click();

  console.log('✅ Clicked on Add chart');
});

defineStep('Select {string} visual', async function (visualName) {
  const page = this.page;

  // Locator for the visual option inside context menu
  const visualOption = page.locator(
    `//*[@class='dropdown-menu context-menu ']//*[text()='${visualName}']/preceding-sibling::*`
  );

  await visualOption.waitFor({ state: 'visible', timeout: 10000 });
  await visualOption.click();

  console.log(`✅ Selected visual: ${visualName}`);
});

Then('{string} visual should be created', async function (expectedVisual) {
  const page = this.page;

  const visualName = page.locator(
    "//div[@class='chart-type-switcher-context-menu--text']"
  );

  await visualName.waitFor({ state: 'visible', timeout: 10000 });

  const actualVisual = (await visualName.innerText()).trim();

  expect(actualVisual).toBe(expectedVisual);

  console.log(`✅ ${expectedVisual} chart visual is created`);
});

/* ---------------- Click CEIC defined template ---------------- */
defineStep('I click on the CEIC defined Template hyperlink', async function () {
  await this.page.locator(
    "//a[@download='CEIC defined template.xlsx']"
  ).click();
});

/* ---------------- Verify template download ---------------- */
Then('the template should be downloaded', async function () {
  const download = await this.page.waitForEvent('download', { timeout: 30000 });
  expect(download.suggestedFilename()).toContain('CEIC defined template');

  await download.saveAs(
    path.join(process.cwd(), 'downloads', download.suggestedFilename())
  );
});

/* ---------------- Select two series ---------------- */
Given('I have selected two series under the Data tab', async function () {
  await this.page.locator("//span[contains(text(),'Series')]").click();

  for (let i = 1; i <= 2; i++) {
    await this.page.locator(
      `(//span[@class='series-list-item--checkbox svg-checkbox'])[${i}]`
    ).click();
  }

  await this.page
    .locator("(//div[@class='series-item--name'])[1]")
    .click({ button: 'right' });
});

/* ---------------- Click Download button ---------------- */
When('I click on the Download button', async function () {
  await this.page.locator("//span[@class='input-control--indicator']").click();
  await this.page.locator(
    "//div[contains(@class,'download-button__header')]"
  ).click();
});

/* ---------------- Verify Download popup ---------------- */
Then(
  'the Download popup should be displayed with the header {string}',
  async function (headerText) {

    const header = this.page.locator("//div[@class='download-modal-title']");
    await expect(header).toBeVisible();

    const text = (await header.innerText()).replace(/\s+/g, ' ').trim();
    expect(text).toContain(headerText);
  }
);

/* ---------------- Add series to My Series tab ---------------- */
Given('I have added some series in the My Series tab', async function () {
  await this.page.locator("//span[contains(text(),'Series')]").click();

  for (let i = 1; i <= 2; i++) {
    await this.page.locator(
      `(//span[@class='series-list-item--checkbox svg-checkbox'])[${i}]`
    ).click();
  }

  await this.page
    .locator("(//span[@class='series-list-item--checkbox svg-checkbox'])[1]")
    .hover();

  await this.page.locator(
    "(//div[@class='add-to-data-selection--icon'])[1]"
  ).click();
});

defineStep('I click on the {string}', async function (sectionName) {
  await this.SmokeTestPage.navigateToSection(sectionName);
  await this.attach(`Clicked On '${sectionName}'`);
});

Then(
  'the Theme popup should be displayed with the header {string}',
  async function (expectedHeader) {

    const themePopupHeader = this.page.locator(
      "//div[contains(@class,'movable-modal--header')]"
    );

    await expect(themePopupHeader).toBeVisible({ timeout: 30000 });

    const actualText = (await themePopupHeader.innerText())
      .replace(/\s+/g, ' ')
      .trim();

    expect(actualText).toContain(expectedHeader);

    console.log(
      `✅ Theme popup is displayed with the header "${expectedHeader}"`
    );
  }
);
Then('the Notification popup should be displayed', async function () {
  const notificationPopup = this.page.locator(
    "//div[contains(@class,'user-notifications--body') and contains(@class,'dropdown--body__open')]"
  );

  await expect(notificationPopup).toBeVisible({ timeout: 30000 });

  console.log('✅ The Notification popup is displayed');
});

Then('the Profile popup should be displayed', async function () {
  const profilePopup = this.page.locator(
    "//div[@class='account-popup']"
  );

  await expect(profilePopup).toBeVisible({ timeout: 30000 });

  console.log('✅ The Profile popup is displayed');
});

Then('a list of databases should be available', async function () {
  const page = this.page;

  // ✅ Robust locator (no strict class match)
  const databases = page.locator(
    "//div[contains(@class,'database-node')]//span[contains(@class,'name-text')]"
  );

  // ✅ WAIT until databases load
  await page.waitForFunction(
    () => document.querySelectorAll(
      "div[class*='database-node'] span[class*='name-text']"
    ).length > 0,
    { timeout: 30000 }
  );

  const count = await databases.count();
  expect(count).toBeGreaterThan(0);

  console.log(`✅ Databases loaded: ${count}`);
  console.log('----------------------');

  for (let i = 0; i < count; i++) {
    console.log((await databases.nth(i).innerText()).trim());
  }
});

When(
  'I select any DB by clicking on the {string} icon',
  async function (dbName) {

    // Example assumes WORLD is the DB node
    const expandIcon = this.page.locator(
      "//div[contains(@style,'padding-left: 0px')]//div[@data-node-model-id='WORLD']"
    );

    await expect(expandIcon).toBeVisible({ timeout: 30000 });
    await expandIcon.click();

    console.log(`✅ Clicked expand icon for DB: ${dbName}`);
  }
);
Then(
  'the result should be loaded only for the selected database',
  async function () {

    const expandedContainer = this.page.locator(
      "//div[@data-node-model-id='WORLD']//div[contains(@class,'child-container')]"
    );

    await expect(expandedContainer).toBeVisible({ timeout: 30000 });

    console.log(
      '✅ The result is loaded only for the selected database'
    );

    // Optional: collapse back
    const collapseIcon = this.page.locator(
      "//div[@data-node-model-id='WORLD']/div"
    );
    await collapseIcon.click();
  }
);
Given('Rename the title for visual as {string}', async function (titleText) {
  const page = this.page;

  const title = page.locator("//xpath_of_visual_title"); // replace locator

  await title.waitFor({ state: 'visible', timeout: 10000 });
  await title.click();
  await title.fill(titleText);
  await title.press('Enter');

  console.log(`✅ Visual title renamed to: ${titleText}`);
});
Given('Download visual as {string}', async function (format) {
  const page = this.page;

  const downloadDir = path.join(os.homedir(), 'Downloads');
  const fileName = `Title 1.${format}`;
  const filePath = path.join(downloadDir, fileName);

  // 🧹 Delete existing file if present
  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
    console.log('🧹 Existing file deleted');
  }

  // ⏳ Open download dropdown
  const downloadMenu = page.locator(
    "(//*[@class='download-button--icon drop-down-button--icon'])[2]"
  );
  await downloadMenu.waitFor({ state: 'visible', timeout: 10000 });
  await downloadMenu.click();

  // ⏳ Select export format
  const exportIcon = page.locator(
    `//*[@class='icon--export icon--export__${format}']`
  );
  await exportIcon.waitFor({ state: 'visible', timeout: 10000 });
  await exportIcon.click();

  // ⬇️ Capture download
  const [download] = await Promise.all([
    page.waitForEvent('download', { timeout: 30000 }),
    page.locator(
      "(//*[@class='sphere-modal-control button insight-download__modal-button button button__download-btn'])"
    ).click()
  ]);

  await download.saveAs(filePath);

  console.log(`✅ Visual downloaded as ${fileName}`);
});
Then('visual should be downloaded in {string}', async function (format) {
  const filePath = path.join(
    os.homedir(),
    'Downloads',
    `Title 1.${format}`
  );

  // ⏳ Wait up to 20 seconds for file
  let fileExists = false;
  for (let i = 0; i < 20; i++) {
    if (fs.existsSync(filePath)) {
      fileExists = true;
      break;
    }
    await new Promise(res => setTimeout(res, 1000));
  }

  expect(fileExists).toBeTruthy();
  console.log(`✅ File exists: Title 1.${format}`);
});
Then(
  'a growl popup should be displayed with the description {string}',
  async function (expectedText) {
    const page = this.page;

    // Growl / notification popup locator
    const growlPopup = page.locator(
      "//div[contains(@class,'index-module_notification_message')]"
    );

    // Wait until popup is visible
    await growlPopup.waitFor({ state: 'visible', timeout: 10000 });

    const actualText = (await growlPopup.innerText()).trim();

    // Validate text
    expect(actualText).toBe(expectedText);

    console.log(
      `✅ Growl popup displayed with description: ${actualText}`
    );
  }
);
Then('the Imported tab should be loaded and displayed with the series', async function () {
  const page = this.page;

  const firstSeries = page.locator("(//div[@class='series-item--name'])[1]");

  // Wait until the series is visible
  await firstSeries.waitFor({ state: 'visible', timeout: 10000 });

  // Assert it is visible
  await expect(firstSeries).toBeVisible();

  const seriesName = (await firstSeries.innerText()).trim();
  console.log(`✅ Series is displayed: ${seriesName}`);
});

 Then('{string} window should be displayed', async function (popupName)  {
  const page = this.page;

  const popup = page.locator("//div[@class='insights-view']");

  // Wait for popup to appear
  await popup.waitFor({ state: 'visible', timeout: 10000 });

  // Assert visibility
  await expect(popup).toBeVisible();

  console.log(`✅ ${popupName} popup is displayed`);
});
Then('{string} popup should be displayed', async function (popupName) {
  const page = this.page;

  // 🔁 Map popup names to locators
  const popupLocators = {
    'My Searches': "//div[@class='select-search']",
    'File menu': "//ul[@role='menu']",
    'My Insights': "//div[@class='insights-groups--tabs-context']",
    'Share': "//div[@class='insight-share']",
    'View': "//a[@class='insight-page-view-tab--link insight-page-view-tab--link__active']",
    'Text Visual': "//div[@class='visual-item-template visual-select-area text-template']",
    'Image Visual': "//div[@class='visual-item-template visual-select-area text-template image-template']",
    'Attachment': "//div[@class='view-components']",
    'Filter': "//div[@class='visual-item-template visual-select-area filter-template']",
    'Visual dropdown': "//div[@class='visuals-panel']",
    "Edit series": "//*[contains(@class,'visual-series-panel--content')]",
    "Download": "//*[contains(@class,'modal-body sphere-modal__body')]",
    "Growl": "//*[contains(@class,'index-module_notification_content')]",
    "Embed": "//*[contains(@class,'movable-modal--window ui-resizable ui-draggable')]",
    "LinkedIn": "//*[contains(@class,'movable-modal--window ui-draggable')]",
    "Confirmation": "//*[contains(@class,'modal-header sphere-modal__header')]",
    "Chart Settings": "//*[contains(@class,'movable-modal--window ui-resizable ui-draggable')]",
    "Date": "//*[contains(@class,'dropdown--body__open')]",
    "Series info": "//*[contains(@class,'tooltip tooltip__visible')]",
    "SSP Window": "//*[@class='movable-modal--body']",
    "Trending Data": "(//div[contains(@class,'index-module_tab_menu_content')])[1]",
    "Data Stories" : "(//div[contains(@class,'index-module_tab_menu_content')])[1]",
    "Watchlist" : "(//div[contains(@class,'index-module_tab_menu_content')])[1]",
    "Filter Popup" : "//div[@class='dropdown--body dropdown--body__open']",
    "Database" : "//div[@class='database-representation']//div[@class='database-representation--tree']",
    "Series" : "//div[@class='series-representation']//div[@class='series-representation--container']",
    "Datasets" : "//div[contains(@class,'nodes-list data-sets')]//div[@class='nodes-list--tree']",
    "Imported" : "//div[contains(@class,'user-series-representation')]//div[@class='series-representation--container']",
    "Data" : "//div[contains(@class,'data-representation data-representation__has-user-data')]",
    "Analysis" : "//div[contains(@class,'insights-group--main-wrapper')]",
    "Comparables" : "//div[contains(@class,'comparables')]",
    "Release" : "//div[contains(@class,'nodes-list release-schedule release-schedul')]",
    "Search Suggestions" : "//div[text()='⇱ Hide CEIC suggestions']",
    "Pin" : "//div[@role='combobox']",
    "Expand" : "(//div[@class='panel-expander--icon panel-expander--icon__left'])[4]"
  };

  const locator = popupLocators[popupName];

  if (!locator) {
    throw new Error(`❌ No locator defined for popup: ${popupName}`);
  }

  const popup = page.locator(locator);

  // 1️⃣ Wait for DOM attach (safe for lazy popups)
  await popup.waitFor({ state: 'attached', timeout: 10000 });

  // 2️⃣ Scroll if needed (virtual / dropdown popups)
  await page.mouse.wheel(0, 300);

  // 3️⃣ Assert visibility
  await expect(popup).toBeVisible({ timeout: 10000 });

  console.log(`✅ ${popupName} popup is displayed`);
});



Then(
  "User should see the following sub visuals displayed:",
  async function (dataTable) {

    const page = this.page;
    const subVisuals = dataTable.raw().flat();

    console.log("\n====== VERIFYING SUB VISUALS DISPLAYED ======\n");

    for (const visual of subVisuals) {

      console.log(`🔍 Checking: ${visual}`);

      // ✅ Dynamic updated XPath
      const subVisualXpath = `
        //div[contains(@style,'overflow: hidden;')]/../..//div[text()='${visual}']
      `;

      const element = page.locator(subVisualXpath);

      await element.waitFor({ state: "visible", timeout: 15000 });

      console.log(`✅ Displayed: ${visual}`);
    }

    console.log("\n====== ALL SUB VISUALS VERIFIED SUCCESSFULLY ======\n");
  }
);



When('I hover on the first insight and click on the share button', async function () {
  const page = this.page;

  const insightPreview = page.locator(
    "(//div[@class='insight-grid-item--preview'])[1]"
  );

  const shareButton = insightPreview.locator(
    "(.//div[contains(@class,'insight-share-button--wrapper')])[1]"
  );

  // 1️⃣ Wait for insight
  await insightPreview.waitFor({ state: 'visible', timeout: 10000 });

  // 2️⃣ Hover (this reveals the share button)
  await insightPreview.hover();

  // 3️⃣ Wait until share button exists in DOM
  await shareButton.waitFor({ state: 'attached', timeout: 10000 });

  // 4️⃣ Get exact position of share button
  const box = await shareButton.boundingBox();
  if (!box) {
    throw new Error('❌ Share button bounding box not found');
  }

  // 5️⃣ Click via mouse (real user behaviour)
  await page.mouse.click(
    box.x + box.width / 2,
    box.y + box.height / 2
  );

  console.log('✅ Hovered on insight and clicked Share button');
});
Then('Mouse houring on {string}', async function (label) {
  const page = this.page;

  const element = page.locator(
    `//*[normalize-space(text())='${label}']`
  );

  await element.waitFor({ state: 'visible', timeout: 10000 });
  await element.hover();

  console.log(`✅ Mouse hovered on ${label}`);
});

Given('User enters keyword {string}', async function (keyword) {
  const page = this.page;
  this.currentKeyword = keyword;

  console.log(`🔍 Searching with keyword: ${keyword}`);

  // 🔹 Locate search input
  const searchInput = page.locator("//input[contains(@class,'search-input')]");

  // 🔹 Wait for search box
  await searchInput.waitFor({ state: 'visible', timeout: 10000 });

  // 🔹 Clear existing text (Ctrl + A + Backspace)
  await searchInput.click();
  await page.keyboard.down('Control');
  await page.keyboard.press('A');
  await page.keyboard.up('Control');
  await page.keyboard.press('Backspace');

  // 🔹 Enter keyword and press Enter
  await searchInput.type(keyword);
  await searchInput.press('Enter');

  // 🔹 Handle suggestion if present
  const suggestion = page.locator(
    `//div[@class='search-presentation--insights']/div/span[normalize-space(text())='${keyword}']`
  );

  try {
    await suggestion.waitFor({ state: 'visible', timeout: 5000 });
    await suggestion.click();
    console.log('✅ Suggestion clicked');
  } catch {
    console.log('ℹ️ No suggestions available');
  }
});

Then(
  "Result should be displayed by {string} or {string}",
  async function (keyword1, keyword2) {

    const page = this.page;
    const k1 = keyword1.toLowerCase();
    const k2 = keyword2.toLowerCase();

    const rows = page.locator(
      "//*[contains(@class,'series-list-item--container')]"
    );

    const nameXpath = ".//*[contains(@class,'series-item--name')]";
    const countryXpath = ".//*[contains(@class,'series-item--country')]";
    const valueXpath =
      ".//*[@class='series-item-information--additional-info-field__value series-item-information--additional-info-field__highlighted']//*[@class='series-item-information--additional-text']";

    // ✅ SSP Modal Xpaths
    const sspWindowXpath =
      "//div[@class='movable-modal--window ui-resizable ui-draggable']";

    const sspCloseXpath =
      "//span[@class='series-preview-modal-header--copy']/../../following-sibling::div/div[3]";

    // ✅ Action Dropdown inside SSP
    const actionBtnXpath =
      "//div[@class='preview-series-data-actions--button preview-series-data-actions--button__action']";

    const seeInDbXpath =
      "//span[text()='See in Database']";

    const dropdownMenuXpath =
      "//span[text()='See in Database']/../..//ul[@class='dropdown-menu']";

    // ✅ Footnotes Validation Xpaths
    const footnotesBtnXpath =
      "//div[contains(text(),'Footnotes')]/button";

    const footnotesHeaderXpath =
      "//div[@class='footnotes--breadcrumbs']";

    const footnotesCloseXpath =
      "//span[@class='footnotes-modal--title-icon']/../../../../following-sibling::div/div[3]";

    // ✅ Wait until results appear
    await rows.first().waitFor({ timeout: 20000 });

    const collected = new Map();

    // ✅ Collect 10 Unique Series (NO SCROLL)
    const count = await rows.count();
    console.log(`\n🔍 Total Rows Visible: ${count}`);

    for (let i = 0; i < count && collected.size < 9; i++) {

      try {
        const row = rows.nth(i);

        const country = (
          await row.locator(`xpath=${countryXpath}`).innerText()
        ).trim();

        const name = (
          await row.locator(`xpath=${nameXpath}`).innerText()
        ).trim();

        const value = (
          await row.locator(`xpath=${valueXpath}`).innerText()
        ).trim();

        const key = `${country}|${name}|${value}`;

        if (!collected.has(key)) {
          collected.set(key, { country, name, value });
        }

      } catch {}
    }

    console.log(`\n✅ Unique Series Collected: ${collected.size}`);

    const matched = [];
    const unmatched = [];

    // =====================================================
    // ✅ STEP 0: Initial Text Validation
    // =====================================================
    for (const s of collected.values()) {

      const baseText = `${s.country} ${s.name} ${s.value}`.toLowerCase();

      if (baseText.includes(k1) || baseText.includes(k2)) {
        matched.push(s);
      } else {
        unmatched.push(s);
      }
    }

    console.log(`\n❌ Initial Unmatched Count: ${unmatched.length}`);

    const finalUnmatched = [];

    // =====================================================
    // ✅ Tooltip + SSP + Dropdown + Footnotes Validation
    // =====================================================
    for (const s of unmatched) {

      let resolved = false;

      try {
        console.log(`\n🟡 Validating unmatched series: ${s.name}`);

        const freshNameElement = page.locator(
          `//*[contains(@class,'series-item--name') and normalize-space()="${s.name}"]`
        );

        await freshNameElement.first().waitFor({ timeout: 5000 });

        // =====================================================
        // ✅ STEP 1: Tooltip Validation
        // =====================================================
        await freshNameElement.hover();
        await page.waitForTimeout(1000);

        const tooltip = page.locator("//div[contains(@class,'tooltip')]");

        if (await tooltip.first().isVisible()) {

          const tooltipText = (
            await tooltip.first().innerText()
          ).toLowerCase();

          if (tooltipText.includes(k1) || tooltipText.includes(k2)) {
            console.log(`✅ Tooltip matched: ${s.name}`);
            matched.push(s);
            resolved = true;
          }
        }

        // =====================================================
        // ✅ STEP 2: Open SSP Window
        // =====================================================
        if (!resolved) {

          await freshNameElement.click();

          const sspWindow = page.locator(sspWindowXpath);
          await sspWindow.waitFor({ timeout: 8000 });

          const sspText = (await sspWindow.innerText()).toLowerCase();

          if (sspText.includes(k1) || sspText.includes(k2)) {
            console.log(`✅ SSP matched keyword: ${s.name}`);
            matched.push(s);
            resolved = true;
          }

          // =====================================================
          // ✅ STEP 3: Dropdown Validation
          // =====================================================
          if (!resolved) {

            const actionBtn = page.locator(actionBtnXpath);
            await actionBtn.click();

            const seeInDb = page.locator(seeInDbXpath);
            await seeInDb.hover();

            const dropdownMenu = page.locator(dropdownMenuXpath);
            await page.waitForTimeout(1000);

            if (await dropdownMenu.isVisible()) {

              const dropdownText = (
                await dropdownMenu.innerText()
              ).toLowerCase();

              if (dropdownText.includes(k1) || dropdownText.includes(k2)) {
                console.log(`✅ Keyword matched in dropdown: ${s.name}`);
                matched.push(s);
                resolved = true;
              }
            }
          }

          // =====================================================
          // ✅ STEP 4: Footnotes Validation (If still not found)
          // =====================================================
          if (!resolved) {

            console.log(`➡ Keyword not found. Opening Footnotes...`);

            // Click Footnotes button
            const footnotesBtn = page.locator(footnotesBtnXpath);
            await footnotesBtn.click();
            // Wait for Footnotes modal open
            const footnotesModal = page.locator(footnotesHeaderXpath);
            await footnotesModal.waitFor({ timeout: 8000 });

            // Validate Footnotes Header
            const footnotesHeader = page.locator(footnotesHeaderXpath);

            if (await footnotesHeader.isVisible()) {

              const headerText = (
                await footnotesHeader.innerText()
              ).toLowerCase();

              console.log(`📌 Footnotes Header: ${headerText}`);

              if (headerText.includes(k1) || headerText.includes(k2)) {
                console.log(`✅ Keyword matched in Footnote: ${s.name}`);
                matched.push(s);
                resolved = true;
              }
            }
                  // Close Footnotes Modal
             console.log(`➡ Closing Footnotes modal...`);
             await page.locator(footnotesCloseXpath).click();

          }

          // =====================================================
          // ✅ Close SSP Window Always
          // =====================================================
          console.log(`➡ Closing SSP window...`);
          await page.locator(sspCloseXpath).click();
        }

      } catch (e) {
        console.log(`❌ Validation failed for: ${s.name}`);
      }

      if (!resolved) {
        finalUnmatched.push(s);
      }
    }

    // =====================================================
    // 📊 FINAL OUTPUT
    // =====================================================
    console.log(`\n✅ MATCHED SERIES`);
    console.table(
      matched.map((s, i) => ({
        Index: i + 1,
        Country: s.country,
        Series: s.name,
        Value: s.value,
      }))
    );

    if (finalUnmatched.length > 0) {

      console.log(`\n❌ FINAL UNMATCHED SERIES`);
      console.table(
        finalUnmatched.map((s, i) => ({
          Index: i + 1,
          Country: s.country,
          Series: s.name,
          Value: s.value,
        }))
      );

      throw new Error(
        `Search validation failed. ${finalUnmatched.length} series did not match even after Tooltip + SSP + Dropdown + Footnotes validation.`
      );
    }

    console.log(`\n🎉 ALL 10 SERIES VALIDATED SUCCESSFULLY`);
  }
);

  When('I click on the Checkbox',async function () {
    const chartSettings = this.page.locator(`(//div[@style='margin-left: 0px;'])[1]`);

  await expect(chartSettings).toBeVisible({ timeout: 30000 });
  await chartSettings.click();

  });

  Then('{string} Should be displayed', async function (popupName) {
    const page = this.page;
  
    // 🔁 Map popup names to locators
    const popupLocators = {
        "Cancel" : "//div[contains(text(),'Cancel')]",
        "Recommended tables" : "//span[text()='Recommended tables']",
        "Series" : "(//*[@class='series-item--name'])[1]",
        "Title" : "(//*[@class='title'])[1]",
        "ImportSeries" : "(//div[@class='series-representation user-series-representation']//*[@class='series-list-item--content'])[1]",
        "Analysis" : "(//*[@class='insight-grid-item--thumbnail-box'])[1]",
        "Comparables" : "(//*[@class='tree-node'])[1]",
        "Releases" : "(//*[@class='release-scheduler-tree-node--title'])[1]",
        "Pin" : "//div[text()='Pin to the left side']",
        "Insights" : "//div[contains(@class,'insights-view--table')]/div[1]",
        "Grid" : "//*[@class='insights-view--grid']/div[1]",
        "Table" : "//*[@class='insights-view--table']/div[1]",
        "Source: CEIC Data" : "(//*[text()='Source: CEIC Data'])[1]",
        "Image" : "(//div[text()='Previews']/../div/div//img)[1]",
        "Sources: CEIC" : "(//*[text()='Sources: CEIC'])[1]",
        "Sources: CEIC, General Administration of Customs, NBS" : "//*[contains(text(),'Sources: CEIC')]",
        "image" : "//div[@class='visual-item-wrapper--credits-image']",
        "SSP" : "(//div[@class='single-series-preview--body'])[1]"
        
  
  
    };
  
    const locator = popupLocators[popupName];
  
    if (!locator) {
      throw new Error(`❌ No locator defined for popup: ${popupName}`);
    }
  
    const popup = page.locator(locator);
  
    // 1️⃣ Wait for DOM attach (safe for lazy popups)
    await popup.waitFor({ state: 'attached', timeout: 10000 });
  
    // 2️⃣ Scroll if needed (virtual / dropdown popups)
    await page.mouse.wheel(0, 300);
  
    // 3️⃣ Assert visibility
    await expect(popup).toBeVisible({ timeout: 10000 });
  
    console.log(`✅ ${popupName} is displayed`);
  });

  Then('{string} Should be Displayed', async function (string) {

    const page = this.page;
  
    // 🔁 Map popup names to locators
    const popupLocators = {
      "Unselect": "//*[text()='Unselect']",
       "Tooltip" : "//div[@class='tooltip tooltip__visible']",
       "Dataset" : "//*[text()='Dataset']",
       "Watchlist" : "//*[@class='dropdown-menu context-menu ']",
       "Chart" : "//*[@class='chart-type-switcher-context-menu']",
       "Footnote" : "//*[@class='movable-modal--window ui-resizable ui-draggable']",
       "Menu" : "//*[@class='dropdown-menu context-menu ']",
       "seriesName" : "//*[@class='series-name-field--text']",
       "groupName" : "//*[@class='group-name']",
       "GrowlMessage" : "(//div[contains(@class,'index-module_notification')])[1]",
       "Visual" : "//*[@class='visuals-panel']",
       "Download" : "//*[@class='modal-body sphere-modal__body']",
       "SSP" : "//*[@class='movable-modal--window ui-resizable ui-draggable']",
       "Insights" : "//div[@class='insights-view--grid']/div[1]"

    };
  
    const locator = popupLocators[string];
  
    if (!locator) {
      throw new Error(`❌ No locator defined for popup: ${string}`);
    }
  
    const popup = page.locator(locator);
  
    // 1️⃣ Wait until popup is visible
    await popup.waitFor({ state: 'visible', timeout: 10000 });
  
    // 2️⃣ Scroll into view if needed
    await popup.scrollIntoViewIfNeeded();
  
    // 3️⃣ Assert visibility
    await expect(popup).toBeVisible({ timeout: 10000 });
  
    console.log(`✅ ${string} popup is displayed`);
  });
  

  Then('Mouse over on the {string}', async function (string){
    const page = this.page;

  const hoverLocators = {
    "Series Name": "//div[@class='series-item--name']",
    "Country" : "//div[@class='series-item--country country-information']",
    "Add" : "//*[@data-action='add']",
    "AddToExitingInsight" : "//*[text()='Add to existing insights']",
    "addChart" : "//*[text()='Add chart']",
    "Set watchlist alert" : "//*[text()='Set watchlist alert']",
    "Realated Data" : "//*[text()='Related data']"
   
  };

  const locator = hoverLocators[string];

  if (!locator) {
    throw new Error(`❌ No locator defined for hover: ${string}`);
  }

  const element = page.locator(locator);

  await element.waitFor({ state: "visible", timeout: 10000 });

  await element.hover();

  // ⏳ Wait for tooltip after hover
  await page.waitForTimeout(2000);

  console.log(`✅ Tooltip should be displayed after hovering on: ${string}`);
  });

  When('Choose the {string} {string} {string}', async function (type, text, value) {
    const page = this.page;
  
    const hoverLocators = {
      "Apply": "//*[text()='Apply']",
      "Italic": `(//*[text()='${text}']//parent::*//following-sibling::*//child::*[text()='Size']//parent::*//following-sibling::div//button)[2]`,
      "Bold": `(//*[text()='${text}']//parent::*//following-sibling::*//child::*[text()='Size']//parent::*//following-sibling::div//button)[1]`,
      "Underline": `(//*[text()='${text}']//parent::*//following-sibling::*//child::*[text()='Size']//parent::*//following-sibling::div//button)[3]`,
      "Alignment": `//*[text()='${text}']/../..//div[contains(@class, 'icon--align-x-${value}')]`
    };
  
    const selector = hoverLocators[type];
  
    if (!selector) {
      console.warn(`⚠ No selector defined for type: "${type}", skipping`);
      return;
    }
  
    try {
      const element = page.locator(selector).first();
  
      const isVisible = await element.isVisible().catch(() => false);
  
      if (isVisible) {
        await element.click();
        console.log(`✅ "${type}" clicked successfully`);
      } else {
        console.warn(`⚠ "${type}" element not found or not visible, skipping`);
      }
  
    } catch (error) {
      console.warn(`⚠ "${type}" action failed, skipping: ${error.message}`);
    }
  });
  
  
  

  Then(
    'Choose the {string} and validate {string} as {string}',
    async function (text, styleType, expectedValue) {
  
      const page = this.page;
  
      // Use contains() XPath for partial text match
      const element = page.locator(`//*[contains(text(),'${text}')]`).first();
      await element.waitFor({ state: 'visible', timeout: 10000 });
  
      switch (styleType.toLowerCase()) {
  
        // ✅ COLOR
        case "color": {
          const color = await element.evaluate(el =>
            window.getComputedStyle(el).color
          );
          expect(color).toBe(expectedValue);
          break;
        }
  
        // ✅ FONT SIZE
        case "size":
        case "font-size": {
          const fontSize = await element.evaluate(el =>
            window.getComputedStyle(el).fontSize
          );
          expect(fontSize).toBe(expectedValue);
          break;
        }
  
        // ✅ BOLD
        case "bold": {
          const isBold = await element.evaluate(el => {
            const computed = window.getComputedStyle(el);
            const weight = computed.fontWeight;
            if (weight === "bold" || parseInt(weight) >= 700) return true;
  
            const styleAttr = (el.getAttribute("style") || "").toLowerCase();
            if (styleAttr.includes("font-weight") && styleAttr.includes("bold")) return true;
  
            return false;
          });
          expect(isBold).toBe(true);
          break;
        }
  
        // ✅ ITALIC
        case "italic": {
          const fontStyle = await element.evaluate(el =>
            window.getComputedStyle(el).fontStyle
          );
          expect(fontStyle).toBe("italic");
          break;
        }
  
        // ✅ UNDERLINE (robust)
        case "underline": {
          const isUnderline = await element.evaluate(el => {
            const computed = window.getComputedStyle(el);
            const styleAttr = el.getAttribute("style") || "";
            // check computed and inline style
            return computed.textDecorationLine.includes("underline") ||
                   /text-decoration\s*:\s*underline/i.test(styleAttr);
          });
          expect(isUnderline).toBe(true);
          break;
        }
  
        // ✅ ALIGNMENT (visual)
        case "alignment": {
          const box = await element.boundingBox();
          const parentBox = await element.evaluate(el => el.parentElement.getBoundingClientRect());
  
          if (!box || !parentBox) throw new Error("Unable to get bounding boxes for alignment check");
  
          const tolerance = 3;
          const elementLeft = box.x;
          const elementRight = box.x + box.width;
          const elementCenter = box.x + box.width / 2;
          const parentLeft = parentBox.x;
          const parentRight = parentBox.x + parentBox.width;
          const parentCenter = parentBox.x + parentBox.width / 2;
  
          let isAligned = false;
          switch (expectedValue.toLowerCase()) {
            case "left":
              isAligned = Math.abs(elementLeft - parentLeft) <= tolerance;
              break;
            case "center":
              isAligned = Math.abs(elementCenter - parentCenter) <= tolerance;
              break;
            case "right":
              isAligned = Math.abs(elementRight - parentRight) <= tolerance;
              break;
            default:
              throw new Error(`Unknown alignment: ${expectedValue}`);
          }
  
          console.log(`🔎 Alignment result: ${isAligned}`);
          expect(isAligned).toBe(true);
          break;
        }
  
        default:
          throw new Error(`❌ Unknown style type: ${styleType}`);
      }
  
      console.log(`✅ ${styleType} validation passed for "${text}"`);
    }
  );
  
  When('click on {string}', async function (buttonName) {
    const page = this.page;
  
    // Only handle "Source" button for now
    if (buttonName === "Source") {
      const button = page.locator("//*[@title='Source']").first();
      await button.click();
      console.log(`✅ Clicked on '${buttonName}'`);
    } else {
      console.warn(`⚠ No locator defined for '${buttonName}'`);
    }
  });
  

// ---------------------------
// TC_Analysistab_01 - Verify Sub tabs under Analysis
// ---------------------------
Given('Verify Sub tabs under Analysis', async function () {
  const page = this.page;

  await page.locator(`//span[@title='View expert insights']/span[contains(text(),'Analysis')]`).first().click();
  await page.waitForTimeout(2000);

  const panelVisible = await page.locator(`//div[@class='tree-root']/div`).first().isVisible();
  expect(panelVisible).toBe(true);
  console.log("Verified sub-tabs under Analysis");

  await page.locator(`//div[@class='search-presentation-tabs--container']//span[contains(text(),'Data')]`).first().click();
});

// ---------------------------
// TC_Analysistab_02 - Verify search for Analysis
// ---------------------------
Given('Verify search for Analysis', async function () {
  const page = this.page;

  await page.locator(`//span[@title='View expert insights']/span[contains(text(),'Analysis')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//input[@class='search-input-text']`).fill('GDP');
  await page.keyboard.press('Enter');
  await page.waitForTimeout(5000);

  await page.locator(`//div[@title='View as a table']`).first().click();
  await page.waitForTimeout(2000);

  const searchResult = await page.locator(`(//a[@class='link insight-table-item--title-link text-dots'])[4]`).textContent();
  if (searchResult.includes("GDP")) {
    console.log("Verified search contains GDP");
  } else {
    throw new Error("Search verification failed");
  }

  await page.locator(`//div[@class='search-presentation-tabs--container']//span[contains(text(),'Data')]`).first().click();
  await page.locator(`//span[contains(text(),'Reset')]`).first().click();
});

// ---------------------------
// TC_Analysistab_04 - Verify Sort by dropdown
// ---------------------------
Given('Verify Sort by dropdown', async function () {
  const page = this.page;

  await page.locator(`//span[@title='View expert insights']/span[contains(text(),'Analysis')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//div[@title='View as a table']`).first().click();
  await page.locator(`//span[@class='text-dots' and contains(text(),'Recently published')]`).first().click();
  await page.waitForTimeout(2000);

  const dropdownVisible = await page.locator(`//div[@class='custom-select--body custom-select--sorting-filter-dropdown']`).first().isVisible();
  expect(dropdownVisible).toBe(true);
  console.log("Verified Sort by dropdown");

  await page.locator(`//div[@class='search-presentation-tabs--container']//span[contains(text(),'Data')]`).first().click();
});

// ---------------------------
// TC_Analysistab_05 - Verify Sort by=Title
// ---------------------------
Given('Verify Sort by=Title', async function () {
  const page = this.page;

  await page.locator(`//span[@title='View expert insights']/span[contains(text(),'Analysis')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//div[@title='View as a table']`).first().click();
  await page.locator(`//span[@class='name' and contains(text(),' EMIS Insights')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`(//span[text()='Recently published']//following::span[@class='dropdown--icon icon--filter-arrow'])[1]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//div[@class='custom-select--body custom-select--sorting-filter-dropdown']/div[1]`).first().click();
  await page.waitForTimeout(2000);

  const titles = await page.locator(`//a[@class='link insight-table-item--title-link text-dots']`).allTextContents();
  const sorted = titles.every((v, i, a) => !i || a[i-1] <= v); // Check ascending order
  if (!sorted) throw new Error("Titles not sorted ascending");
  console.log("Verified ascending order by Title");

  await page.locator(`//div[@class='search-presentation-tabs--container']//span[contains(text(),'Data')]`).first().click();
});

// ---------------------------
// TC_Analysistab_06 - Verify Sort by=Recently published
// ---------------------------
Given('Verify Sort by=Recently published', async function () {
  const page = this.page;

  await page.locator(`//span[@title='View expert insights']/span[contains(text(),'Analysis')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//div[@title='View as a table']`).first().click();
  await page.locator(`//span[@class='name' and contains(text(),' EMIS Insights')]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`(//span[text()='Title']//following::span[@class='dropdown--icon icon--filter-arrow'])[1]`).first().click();
  await page.waitForTimeout(2000);

  await page.locator(`//div[@class='custom-select--body custom-select--sorting-filter-dropdown']/div[2]`).first().click();
  await page.waitForTimeout(2000);

  const titles = await page.locator(`//a[@class='link insight-table-item--title-link text-dots']`).allTextContents();
  const sorted = titles.every((v, i, a) => !i || a[i-1] <= v); // ascending
  if (!sorted) throw new Error("Titles not sorted ascending");
  console.log("Verified ascending order by Recently published");

  await page.locator(`//div[@class='search-presentation-tabs--container']//span[contains(text(),'Data')]`).first().click();
});

When(/^Enter All of these words as "([^"]*)"$/, async function (Keyword) {

  await this.page.locator('[name="all_words"]').fill(Keyword);
  await this.page.keyboard.press('Enter');

});