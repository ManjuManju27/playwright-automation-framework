const config = require('../utils/envConfig');
const SmokeTestLocators = require('../locators/SmokeTestLocators.json');
const { clickElement } = require('../pages/commonFunction.js');
const { expect } = require('../setup/assertions.js');
const { Status } = require('@cucumber/cucumber');

class SmokeTest {
  constructor(page) {
    this.page = page;
  }

  async navigateToSection(sectionName) {
    console.log(`Navigating to section: ${sectionName}`);

    const mainMenu = this.page.locator(SmokeTestLocators.Help).first();
    

    const section = this.page.locator(
      `//*[ 
          @data-installation-type='${sectionName}' 
          or @title='${sectionName}' 
          or normalize-space(text())='${sectionName}'
          or contains(@class,'${sectionName}')
          or @placeholder='${sectionName}'
          or @text()='${sectionName}'
       ]`
    );

    for (let attempt = 1; attempt <= 3; attempt++) {
      console.log(`Attempt ${attempt}`);

      try {
        // Open Help menu only if element not visible
        if (!(await section.first().isVisible())) {
          await mainMenu.waitFor({ state: 'visible', timeout: 60000 });
        }

        await section.first().waitFor({ state: 'visible', timeout: 5000 });
        await section.first().click();

        console.log(`✅ Successfully clicked section: ${sectionName}`);
        return;
      } catch (error) {
        console.log(`❌ Attempt ${attempt} failed`);

        if (attempt === 3) {
          throw new Error(
            `Failed to navigate to section: ${sectionName} after 3 attempts`
          );
        }

        await this.page.waitForTimeout(500);
      }
    }
  }
}

module.exports = { SmokeTest };


