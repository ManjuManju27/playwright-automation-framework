const fs = require('fs');
const path = require('path');

/**
 * Take screenshot and attach to Cucumber report
 * @param {object} page - Playwright page object
 * @param {object} world - Cucumber World object (contains scenario info)
 * @param {string} stepName - Step name (optional, used in filename)
 */
async function attachScreenshot(page, world, stepName = "") {
  try {
    if (!world?.attach || !world?.pickle) return;

    const scenarioName = world.pickle.name; // Get scenario name automatically

    // Folder for screenshots
    const dir = "./reports/screenshots";
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });

    // Safe filename
    const safeScenario = scenarioName.replace(/[^a-zA-Z0-9-_]/g, "_");
    const safeStep = stepName ? stepName.replace(/[^a-zA-Z0-9-_]/g, "_") : "";
    const fileName = safeStep ? `${safeScenario}__${safeStep}.png` : `${safeScenario}.png`;

    const screenshotPath = path.join(dir, fileName);

    // Take screenshot
    await page.screenshot({ path: screenshotPath, fullPage: true });

    // Attach to Cucumber report
    const image = fs.readFileSync(screenshotPath);
    await world.attach(image, "image/png");

    console.log(`Screenshot attached: ${screenshotPath}`);
  } catch (error) {
    console.error(`Error taking screenshot: ${error.message}`);
  }
}

module.exports = { attachScreenshot };
