const config = require('../utils/envConfig');
const countryprofilrlocators = require('../locators/CountryProfileLocators.json');
const { clickElement } = require('../pages/commonFunction.js');
const { expect  } = require('../setup/assertions.js');
const { Status } = require('@cucumber/cucumber');




class CountryProfile {
  constructor(page) {
    this.page = page; 
  }

async navigateToSection(sectionName) {
    console.log(`Navigating to section: ${sectionName}`);    
    const mainMenuLocator = this.page.locator(countryprofilrlocators.mainmenu).first();
    const sectionLocator = this.page.locator(`//span[normalize-space(text())='${sectionName}']`);
    for (let attempt = 0; attempt < 3; attempt++) {
        await mainMenuLocator.waitFor({ state: 'visible', timeout: 5000 });
        await mainMenuLocator.click();

        try {
            await sectionLocator.waitFor({ state: 'visible', timeout: 5000 });
            await sectionLocator.click({ trial: false }); 
            console.log(`Clicked on section: ${sectionName}`);
            return;
        } catch (err) {
            console.log(`Attempt ${attempt + 1} failed, retrying main menu click...`);
            
            await this.page.waitForTimeout(500);
        }
    }

    throw new Error(`Failed to navigate to section: ${sectionName} after 3 attempts`);
}

async Verify_recently_viewed_section() {
  
  const container = this.page.locator(countryprofilrlocators.Recently_viewed_Field);
  await container.waitFor({ state: 'visible', timeout: 50000 });
  const isVisible = await container.isVisible();
  const text = (await container.textContent())?.trim();
  const recentItems = [];
  const items = this.page.locator(countryprofilrlocators.Recently_viewed_items);
  await items.first().waitFor({ state: 'visible', timeout: 60000 }); 
  for (let i = 0; i < 3 ; i++) {
    const itemLocator = items.nth(i);
    await itemLocator.waitFor({ state: 'visible', timeout: 60000 });
    let itemText = '';
    for (let retry = 0; retry < 10; retry++) {
      itemText = (await itemLocator.textContent())?.trim() || '';
      if (itemText) break;
      await this.page.waitForTimeout(500);
    }
    recentItems.push(itemText);
    console.log(itemText);
  }
  const reportText = `Recently Viewed Items are:\n${recentItems.join('\n')}`;
  return { text, isVisible, reportText };
}

async clickFirstRecentlyViewedItemAndVerify(firstItem) {
  try {

await firstItem.waitFor({ state: 'visible', timeout: 60000 });
await firstItem.scrollIntoViewIfNeeded(); // scrolls it into view
const firstItemText = (await firstItem.textContent())?.trim();
console.log(`Clicking on : ${firstItemText}`);
const [newPage] = await Promise.all([
    this.page.context().waitForEvent('page'), 
    firstItem.click()
  ]);
await newPage.waitForLoadState('domcontentloaded');

const screenshotBuffer = await newPage.screenshot({ fullPage: true });

console.log(`New tab URL: ${newPage.url()}`);
    await newPage.waitForLoadState('domcontentloaded');
    
    const newTabUrl = newPage.url();
    await newPage.waitForFunction(
     () => document.title && document.title !== 'REDD',
      null,
      { timeout: 10000 }
     );
    const newTabTitle = await newPage.title();
    console.log(`New tab opened successfully!`);
    console.log(`URL: ${newTabUrl}`);
    await newPage.waitForLoadState('domcontentloaded');
    console.log(`Title: ${newTabTitle}`);
    if (!newTabUrl || newTabUrl === 'about:blank') {
      throw new Error('New tab did not load properly!');
    }
    // await newPage.close();

    await this.page.waitForTimeout(500);
    console.log(`Closed new tab and returned to main page`);
    return { firstItemText, newTabUrl, newTabTitle, screenshotBuffer,newPage };
  } catch (error) {
    console.error(`Error-verifying new tab: ${error.message}`);
   
    throw error; 
  }
}

async Verify_defaultOption_dropdown_CountryOfRisk(defaultOpt) {
    await this.page.reload();


    await clickElement(this.page,countryprofilrlocators.CountryOfRisk_Button);
    await this.page.waitForTimeout(3000);
    const DefaultOpt = await this.page.locator(countryprofilrlocators.CountryOfRisk_Default);
    const Selected = await DefaultOpt.textContent();
    expect(Selected.trim()).to.equal(defaultOpt);
    console.log(`Default selected option: ${Selected}`);
    await this.page.reload();
    return { Selected };
}

async verifyTabsInNewPage(newPage, expectedTabs, world) {
  try {
    let presentTabs = []; 
    let missingTabs = []; 
    for (let i = 0; i < expectedTabs.length; i++) {
      const tab = expectedTabs[i];
      const tabLocator = newPage.locator(`button[role="tab"] p[aria-label="${tab}"]`).first();
      const isVisible = await tabLocator.isVisible().catch(() => false);
      if (isVisible) {
        presentTabs.push(tab);
      } else {
        missingTabs.push(tab);
      }
    }
    if (missingTabs.length > 0) {
      const failMessage =
        `The following required tabs are NOT present:\n` +
        missingTabs.map(t => `- ${t}`).join('\n');
        console.error(failMessage);
        if (world?.attach) await world.attach(failMessage, "text/plain");
      throw new Error(failMessage);
    }
    const successMessage =
      `The following tabs are present:\n` +
      presentTabs.map((t, index) => `${index + 1}. ${t}`).join('\n');
    console.log(successMessage);
    if (world?.attach) await world.attach(successMessage, "text/plain");

  } catch (error) {
    const failMsg = `Tabs verification failed.\n${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}

async verifyTab(newPage, tab, world) {
  try {
    const tabLocator = newPage.locator(`button[role="tab"]:has(p[aria-label="${tab}"])`).first();
    const isVisible = await tabLocator.isVisible().catch(() => false);
    if (!isVisible) {
      const failMsg = `Tab "${tab}" is NOT present on the page.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }
    if (tab === "Overview") {
      const isSelected = await tabLocator.evaluate((el) => {
        return (
          el.getAttribute("aria-selected") === "true"
        );
      });
      if (!isSelected) {
        const errMsg = `"Overview" tab is NOT selected by default!`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, "text/plain");
        throw new Error(errMsg);
      }
      const successMsg =
        `Tab "${tab}" is present.\n` +
        `Default selected tab: Overview`;
      console.log(successMsg);
      if (world?.attach) await world.attach(successMsg, "text/plain");
      return;
    }  
    const successMsg = `Tab "${tab}" is present on the page.`;
    console.log(successMsg);
    if (world?.attach) await world.attach(successMsg, "text/plain");

  } catch (error) {
    const failMsg = `Tab verification failed: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}

async verify(page, tab, world) {
  const getTab = (label) =>
   
      page.locator(countryprofilrlocators.overviewTab).first();
  const log = async (msg) => {
    console.log(msg);
    if (world?.attach) await world.attach(msg, "text/plain");
  };
  const mustBeVisible = async (locator, errorMsg) => {
    const visible = await locator.isVisible().catch(() => false);
    if (!visible) {
      await log(errorMsg);
      throw new Error(errorMsg);
    }
  };
  const openInNewTab = async (clickable) => {
    const [newTab] = await Promise.all([
      page.context().waitForEvent("page"),
      clickable.click({ button: 'middle' })
    ]);
    await newTab.waitForLoadState("domcontentloaded");
    return newTab;
  };

  switch (tab) {

//Overview
    case "Overview": {
      const tabLocator = getTab("Overview");
      await mustBeVisible(tabLocator, `Tab "Overview" is NOT present on page.`);
      const isSelected = await tabLocator.getAttribute("aria-selected") === "true";
      if (!isSelected) {
        throw new Error(`"Overview" tab is NOT selected by default!`);
      }
      await log(`Tab "Overview" is present and selected.`);
      return;
    }
    // 2) Overview → News → open first news in new tab
    case "Overview-News": {
       const overviewTab = getTab("Overview");
       await mustBeVisible(overviewTab, `Tab "Overview" is NOT present.`);
       const overviewSelected = await overviewTab.getAttribute("aria-selected") === "true";
    if (!overviewSelected) {
    await overviewTab.click();
    await log(`Clicked Overview tab (was not selected).`);
    }
 
// Wait for news links to appear
     const newsLink = page.locator("//div[p[text()='News']]//following::p[@role='button'][1]").first();
     const title = await newsLink.textContent();
     await this.page.waitForTimeout(5000);
     await newsLink.click();
     await mustBeVisible(newsLink, "No news links found.");
// Open in new tab
     const newTab = await openInNewTab(newsLink);
     const url = newTab.url();
    await log(`Clicked News: ${title}`);

     await log(`News opened successfully in new tab: ${url}`);
     if (!url) throw new Error("News did NOT open in new tab.");
     await log(`News article opened in new tab: ${url}`);
     return;
}
    case "Overview-Research": {
       const overviewTab = getTab("Overview");
       await mustBeVisible(overviewTab, `Tab "Overview" is NOT present.`);
       const overviewSelected = await overviewTab.getAttribute("aria-selected") === "true";
       if (!overviewSelected) {
       await overviewTab.click();
       await log(`Clicked Overview tab (was not selected).`);
    }

// Wait for news links to appear
     const newsLink = page.locator(countryprofilrlocators.researchFirstLink).last();
     const title = await newsLink.textContent();
     await this.page.waitForTimeout(5000);
     await newsLink.click();


  

     await mustBeVisible(newsLink, "No Research links found.");
// Open in new tab
     const newTab = await openInNewTab(newsLink);
     const url = newTab.url();
    await log(`Clicked Research Link: ${title}`);

     await log(`Research opened successfully in new tab: ${url}`);
     if (!url) throw new Error("Research did NOT open in new tab.");
     await log(`Research Link opened in new tab: ${url}`);
     return;
}

 case "Overview-Filings and other company documents": {
       const overviewTab = getTab("Overview");
       await mustBeVisible(overviewTab, `Tab "Overview" is NOT present.`);
       const overviewSelected = await overviewTab.getAttribute("aria-selected") === "true";
    if (!overviewSelected) {
    await overviewTab.click();
    await log(`Clicked Overview tab (was not selected).`);
    }
// Wait for news links to appear
     const newsLink = page.locator(countryprofilrlocators.documentsFirstLink).first();
     const title = await newsLink.textContent();
     await this.page.waitForTimeout(5000);
     await newsLink.click();
     await mustBeVisible(newsLink, "No documents links found.");
// Open in new tab
     const newTab = await openInNewTab(newsLink);
     const url = newTab.url();
    await log(`Clicked Document Link: ${title}`);

     await log(`Documents opened successfully in new tab: ${url}`);
     if (!url) throw new Error("Documents did NOT open in new tab.");
     await log(`Documents Link opened in new tab: ${url}`);
     return;
}
 // 3) Overview → Debt Structure → verify charts + table
    case "Overview-Debt structure": {
      const tabLocator = getTab("Overview");
      await mustBeVisible(tabLocator, `Tab "Overview" is NOT present on page.`);
      // const newsBtn = page.locator(countryprofilrlocators.Debt_structureBtn);
      // await this.page.waitForTimeout(10000);
      // await newsBtn.click();
      await this.page.waitForTimeout(10000);
      const table = page.locator("table.MuiTable-root tbody");
      await mustBeVisible(table, `Bond table NOT present under Debt Structure.`);
      const charts = page.locator("//div[p[text()='Debt structure']]//following::div[@class='highcharts-container '][1]");
      const count = await charts.count();
      if (count === 0) {
        throw new Error(`No charts found under Debt Structure.`);
      }
      // Verify all charts exist
      for (let i = 0; i < count; i++) {
        const chart = charts.nth(i);
        await mustBeVisible(chart, `Chart #${i + 1} NOT visible.`);
      }
      await log(`${count} charts and bond table are visible under Debt Structure.`);
      return;
    }
    // 4) Overview → Research → open report link in new tab
    case "Overview-Researchh": {
      const tabLocator = getTab("Overview");
      await mustBeVisible(tabLocator, `Tab "Overview is NOT present on page.`);
      // const newsBtn = page.locator('[role="button"]', {hasText: 'Research'});
      // await newsBtn.click()
      // const newsLink = page.locator('(//span[@aria-label]/p[@role="button"])[1]').first();
      // // await this.page.waitForTimeout(10000);
      // await newsLink.click();
      // const newsLin = page.locator('//p[text()="Ask Document"]');
      // await this.page.waitForTimeout(10000);
      // await newsLin.click();
      await mustBeVisible(newsLink, "No news links found.");
      const newTab = await openInNewTab(newsLink);
      const url = newTab.url();
      if (!url) throw new Error("Research did not open in new tab.");
      await log(`Research report opened successfully in new tab: ${url}`);
      return;
    }
    // Default
    default:
      throw new Error(`Unknown tab: ${tab}`);
  }
}


async pause() {
    await this.page.waitForTimeout(3000);
  }
async searchInput(input) {
     await clickElement(this.page,countryprofilrlocators.Search_Box);
     this.page.locator(countryprofilrlocators.Search_Box).fill("");
     this.page.locator(countryprofilrlocators.Search_Box).fill(input);
     await this.page.waitForTimeout(5000);

}
async selectCountryDropdown(optionText) {
    await clickElement(this.page,countryprofilrlocators.CountryOfRisk_Button);
    await this.page.waitForTimeout(3000);

    const option = this.page.locator(countryprofilrlocators.CountryOfRisk_options, { hasText: optionText });
    await option.waitFor({ state: 'visible' });
    await option.click();
    const selectedOpt= await option.textContent();
    console.log(`Selected "${selectedOpt}" from the dropdown.`);
    return {selectedOpt};
}


async  verifyCountryOfRiskColumn(expectedValue) {
    const tableBody = this.page.locator('table.MuiTable-root tbody');
    await tableBody.waitFor({ state: 'visible' });
    
    const countryCells = this.page.locator("table.MuiTable-root tbody tr td:nth-child(6)");
    

    const rowCount = await countryCells.count();
    if (rowCount === 0) {
        throw new Error('No rows found in the table.');
    }

    let text1;
    for (let i = 0; i < rowCount; i++) {
        const text = (await countryCells.nth(i).textContent()).trim();
        if (text === expectedValue) {
             text1 = text;

        }
        if (text !== expectedValue) {
            throw new Error(
                `Row ${i + 1} has "${text}" instead of "${expectedValue}"`
            );
        }
    }
    console.log(`All ${rowCount} rows have "${expectedValue}" in the Country of risk column.`);
    return {text1}
}

async verifySearchSuggestionThreshold(world,str) { 
const inputs = [];
str.split('&').forEach(item => inputs.push(item.trim()));
  for (const input of inputs) {
    try {
      const searchBox = this.page.locator(countryprofilrlocators.Search_Box);
      await searchBox.fill('');
      await searchBox.fill(input);
      await this.page.waitForTimeout(2000);

      const suggestions = this.page.locator(countryprofilrlocators.searchSuggestions);
      const isVisible = await suggestions.first().isVisible().catch(() => false);
      const firstSuggestionText = isVisible
        ? (await suggestions.first().textContent())?.trim()
        : null;

      const logMessages = [];

      if (isVisible && firstSuggestionText === "Issuers") {
        logMessages.push(`Following suggestions are displayed for "${input}":`);
        for (let i = 1; i < 4; i++) {
          const text = (await suggestions.nth(i).textContent())?.trim();
          if (text) logMessages.push(`   ${i}. ${text}`);
        }

        
        if (input.length < 2) {
          throw new Error(`Suggestions are displayed for input "${input}" .`);
        }
      } else {
        logMessages.push(`No suggestions displayed for "${input}"`);
        
        if (input.length >= 2) {
          throw new Error(`No suggestions displayed for input "${input}" .`);
        }
      } 
      for (const msg of logMessages) {
        console.log(msg);
        if (world?.attach) await world.attach(msg, 'text/plain');
      }
    } catch (err) {
      const errorMsg = `Verification failed for input "${input}": ${err.message}`;
      console.error(errorMsg);
      if (world?.attach) await world.attach(errorMsg, 'text/plain');
      throw err; 
    }
  }
}
async verifySearchBoxClose(world) {
  try {
    await this.page.click(countryprofilrlocators.searchBox_closeBtn);
    await this.page.waitForTimeout(1000);
    const suggestionLocator = this.page.locator(countryprofilrlocators.searchSuggestions).first();
    const isVisible = await suggestionLocator.first().isVisible().catch(() => false);
    expect(isVisible, "Search suggestions should be closed after clicking '(X)'").to.be.false;
    const successMsg = "Search text box closed successfully — no suggestions displayed.";
    console.log(successMsg);
    if (world?.attach) await world.attach(successMsg, "text/plain");
  } 
  catch (error) {
    const failMsg = `Search text box not closed properly — suggestions still displayed.\nError: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error; 
  }
}

async verifyCount(world) {
  try {
   
    const elementLocator = this.page.locator(countryprofilrlocators.count).first();
    await elementLocator.waitFor({ state: 'visible' });

    const elementCount = await elementLocator.count();
    const isPresent = elementCount > 0;
    expect(isPresent, `Count Element not found`).to.be.true;

    const textContent = (await elementLocator.textContent())?.trim() || "";

  
    const toggleLocator = this.page.locator("[type='checkbox']").first();
    const toggleCount = await toggleLocator.count();
    let toggleStatus = "UNKNOWN";

    if (toggleCount > 0) {
      const isChecked = await toggleLocator.isChecked();
      toggleStatus = isChecked ? "ON" : "OFF";
    } else {
      toggleStatus = "NOT FOUND";
    }

    
    const successMsg = `Count Element found with text: "${textContent}" when 'Issuers on the spotlight' is ${toggleStatus}.`;
    console.log(successMsg);
    if (world?.attach) await world.attach(successMsg, "text/plain");

    return textContent;
  } 
  catch (error) {
    const failMsg = `Failed to verify Count element presence.\nError: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}


async verifyToggleState(world, toggleName) {
  try {
    const shouldTurnOn = toggleName.endsWith("-ON");
    const baseName = toggleName.replace("-ON", "").trim(); 
    const toggleLocator = this.page.locator(countryprofilrlocators.toggle).first();
    await toggleLocator.waitFor({ state: 'visible' });
    const count = await toggleLocator.count();
    expect(count, `Toggle checkbox for "${baseName}" not found`).to.be.greaterThan(0);
    if (!shouldTurnOn) {    
      const successMsg = `"${baseName}" toggle is present.`;
      console.log(successMsg);
      if (world?.attach) await world.attach(successMsg, "text/plain");
      return;
    }
    if (shouldTurnOn) { 
    const isChecked = await toggleLocator.isChecked();
    if (isChecked) {
      const msg = `"${baseName}" toggle is already ON.`;
      console.log(msg);
      if (world?.attach) await world.attach(msg, "text/plain");
    } else {
      const offMsg = `"${baseName}" toggle is OFF by default.`;
      console.log(offMsg);
      if (world?.attach) await world.attach(offMsg, "text/plain");
      await toggleLocator.check(); 
      await this.page.waitForTimeout(500); 
      const verifyOn = await toggleLocator.isChecked();
      expect(verifyOn, `"${baseName}" toggle should be ON after action`).to.be.true;
      const onMsg = `"${baseName}" toggle turned ON successfully.`;
      console.log(onMsg);
      if (world?.attach) await world.attach(onMsg, "text/plain");
    }
  }
  } catch (error) {
    const failMsg = `Failed to verify or toggle "${toggleName}".\nError: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}
async verifyIssuerName(world) {
  try {
    const cells = this.page.locator(countryprofilrlocators.toggleONText);
    const Firstcells = this.page.locator(countryprofilrlocators.toggleONText).first();
    await Firstcells.waitFor({state: 'visible'});
    
    const count = await cells.count();
    expect(count, `No cells found for "Issuer name"`).to.be.greaterThan(0);
    let allValid = true;
    let failedCells = [];
    for (let i = 0; i < count; i++) {
      const cell = cells.nth(i);
      await cell.waitFor({state: 'visible'});
      const text = (await cell.textContent())?.trim() || "";
      if (!text.endsWith('*')) {
        allValid = false;
        failedCells.push(`Issuer name for Row ${i + 1}: "${text}"`);
      }
    }
    if (allValid) {
      const successMsg = `Only the issuers which are on the spotlight is displayed.`;
      console.log(successMsg);
      if (world?.attach) await world.attach(successMsg, "text/plain");
    } else {
      const failMsg = `The following Issuer name do not end with '*':\n${failedCells.join("\n")}`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg); 
    }
  } 
  catch (error) {
    const errMsg = `Error verifying the issuers which are on the spotlight .\n${error.message}`;
    console.error(errMsg);
    if (world?.attach) await world.attach(errMsg, "text/plain");
    throw error;
  }
}
async navigateToTab(page, label, subLabel, world) {
  const log = async (msg) => {
    console.log(msg); 
    if (world?.attach) await world.attach(msg, "text/plain");  
  };
  const mustBeVisible = async (locator, errMsg) => {
    if (!(await locator.isVisible())) {
      throw new Error(errMsg);
    }
  };
  const getTab = (tabLabel) =>
    page
      .locator(`button[role="tab"]`)
      .filter({ has: page.locator(`p[aria-label="${tabLabel}"]`) })
      .first();
  try {
    const tabLocator = getTab(label);
    await mustBeVisible(tabLocator, `Tab "${label}" is NOT present on page.`);

    const mainTabSelected =
      (await tabLocator.getAttribute("aria-selected")) === "true";

    if (!mainTabSelected) {
      throw new Error(`"${label}" tab is NOT selected by default!`);
    }
    await log(`Tab "${label}" is present and selected.`);
      
    
    const subTab = page.locator('[role="button"]', { hasText: subLabel });
    await mustBeVisible(
      subTab,
      `"${subLabel}" button NOT found under "${label}" Tab.`
    );
    await subTab.click();
    await log(`Clicked on "${subLabel}" .`);
    await page.waitForTimeout(1000);
    let subTabSelectedLocator;
    if(subLabel == "Filings and other company documents"){
        subTabSelectedLocator = getTab("Documents");
    } else if(subLabel == "Debt structure"){
           subTabSelectedLocator = getTab("Debt Structure");   
    }else if(subLabel == "Economic indicators"){
           subTabSelectedLocator = getTab("Economic Indicators");   
    }else if(subLabel == "Yield/Prices"){
           subTabSelectedLocator = getTab("Yields/Prices");   
    }else {
       subTabSelectedLocator = getTab(subLabel);
    }
    await mustBeVisible(
      subTabSelectedLocator,
      `Tab "${subLabel}" is NOT present after clicking.`
    );
    const isSelected =
      (await subTabSelectedLocator.getAttribute("aria-selected")) === "true";
    if (!isSelected) {
      throw new Error(`"${subLabel}" tab is NOT selected after clicking!`);
    }
    await log(`Navigated to "${subLabel}" tab successfully.`);
  }
  catch (error) {
    await log(` ERROR in navigatin To Tab: ${error.message}`);
    throw error;
  }
}


async shareData(page,str, EmailID, Message, ClickOn, world) {

  try {
    let shareIcon;
    if(str == "Research"){
     shareIcon = page.locator('[aria-label="Share"]').nth(1);
    } else if(str == "Economic indicators"){
      shareIcon = page.locator('[aria-label="Share"]').nth(2);
    } else if(str == "Flows & Allocations"){
      shareIcon = page.locator('[aria-label="Share"]').nth(3);
    }else if(str == "Yield/Prices"){
      shareIcon = page.locator('[aria-label="Share"]').nth(4);
    }else if(str == "News"){
      shareIcon = page.locator('[aria-label="Share"]').first();
    }else if(str == "NewsShare"){
        const ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(20);;
        await ellipsis.waitFor({ state: "visible", timeout: 15000 });
        await ellipsis.click();
        shareIcon = page.locator('//li[normalize-space(text())="Share"]').first();
    }else if(str == "SelectAll"){
        await this.clickSelectAll(page, world);
        shareIcon = page.locator('//*[normalize-space(text())="Share"]').first();
    }

    const iconVisible = await shareIcon.isVisible().catch(() => false);
    if (!iconVisible) {
      const failMsg = `"Share" icon is NOT visible on the page.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }

    await shareIcon.click();
    if (world?.attach) await world.attach(`Clicked on "Share".\n`, "text/plain");

   
    const dialog = page.locator('[role="dialog"]');
    const dialogVisible = await dialog.isVisible().catch(() => false);

    if (!dialogVisible) {
      const failMsg = `Share window did NOT appear after clicking the share icon.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }

    const dialogMsg = `Share Window appeared.\n`;
    console.log(dialogMsg);
    if (world?.attach) await world.attach(dialogMsg, "text/plain");


    const emailBox = dialog.locator('[placeholder="Enter email address"]');
    await emailBox.fill(EmailID);

    const msgBox = dialog.locator('[placeholder="Write a message"]');
    await msgBox.fill(Message);

  
    if (ClickOn.toLowerCase() === "share") {
      // Click Share button
      const shareBtn = dialog.locator('//button[@type="button" and text()="Share"]').last();
      await shareBtn.click();

      // Verify success message
      const successMsgWindow = page.locator('//*[text()="The data has been successfully shared"]');
      await successMsgWindow.waitFor({ state: "visible", timeout: 10000 });

      const msgText = (await successMsgWindow.textContent())?.trim();

      // Log success using your finalMsg format
      if(str === "NewsShare"){
      const finalMsg = `News Shared Successfully.\nEmail: ${EmailID}\nMessage: ${Message}\nSuccessMessage: ${msgText}\n`;
      console.log(finalMsg);
      if (world?.attach) await world.attach(finalMsg, "text/plain");
      }
      if(str !== "NewsShare"){
      const finalMsg = `Data Shared Successfully.\nEmail: ${EmailID}\nMessage: ${Message}\nSuccessMessage: ${msgText}\n`;
      console.log(finalMsg);
      if (world?.attach) await world.attach(finalMsg, "text/plain");
      }

    } else if (ClickOn.toLowerCase() === "cancel") {
      // Click Cancel button
      const cancelBtn = dialog.locator('//button[contains(text(),"Cancel")]');
      await cancelBtn.click();

      // Verify dialog disappears
      await dialog.waitFor({ state: "detached", timeout: 5000 });

      // Log cancel using similar finalMsg format
      const finalMsg = `Share Cancelled Successfully.\nEmail: ${EmailID}\nMessage: ${Message}\n`;
      console.log(finalMsg);
      if (world?.attach) await world.attach(finalMsg, "text/plain");

     } else if (ClickOn.toLowerCase() === "close") {
      // Click Cancel button
      const cancelBtn = dialog.locator('button:has(svg[viewBox="0 0 20 20"])');
      await cancelBtn.click();

      // Verify dialog disappears
      await dialog.waitFor({ state: "detached", timeout: 5000 });

      // Log cancel using similar finalMsg format
      const finalMsg = `Share Popup Successfully Closed.`;
      console.log(finalMsg);
      if (world?.attach) await world.attach(finalMsg, "text/plain");

    } else {
      throw new Error(`Invalid value for "Click on": ${ClickOn}. Expected "Share" or "cancel".`);
    }

  } catch (error) {
    const failMsg = `Share operation failed: ${error.message}\n`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}


async verifyChartOption(page,world, optionName,str) {
  try {
    let ellipsis,chartContainer;
     if(str == "Economic indicators"){
        ellipsis = page.locator('[viewBox="0 0 20 21"]').first();
        chartContainer = page.locator('.highcharts-container').nth(1);
    } else if(str == "Flows & Allocations"){
       ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(1);
       chartContainer = page.locator('.highcharts-container').nth(2);
    } else if(str == "Yield/Prices"){
      ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(2);
      chartContainer = page.locator('.highcharts-container').nth(3);
    }
    
   //  const iconVisible = await ellipsis.isVisible().catch(() => false);
    // Click ellipsis
  //  const ellipsis = page.locator('[viewBox="0 0 20 21"]').first();
    await ellipsis.waitFor({ state: 'visible' });
    await ellipsis.click();

    const optionLocator = page.locator(`//li[normalize-space(text())='${optionName}']`);
    await optionLocator.waitFor({ state: 'visible' });

    if (world?.attach) await world.attach(`Option found: ${optionName}`, "text/plain");

    // --------------------- SWITCH CASE LOGIC ------------------------
    switch (optionName) {
      
    
      case "View in full screen": {
     //   const chartContainer = page.locator('.highcharts-container').nth(1);

        // BEFORE size
        const sizeBefore = await chartContainer.evaluate(el => ({
          width: el.offsetWidth,
          height: el.offsetHeight
        }));

        if (world?.attach) await world.attach(`Before fullscreen: ${JSON.stringify(sizeBefore)}`, "text/plain");

        // Click option
        await optionLocator.click();
       // await page.waitForTimeout(1000); // allow chart to resize

        // AFTER size
        const sizeAfter = await chartContainer.evaluate(el => ({
          width: el.offsetWidth,
          height: el.offsetHeight
        }));

        if (world?.attach) await world.attach(`After fullscreen: ${JSON.stringify(sizeAfter)}`, "text/plain");

        // Validate size increased
        expect(sizeAfter.width).to.be.greaterThan(sizeBefore.width);
        // expect(sizeAfter.height).to.be.greaterThan(sizeBefore.height);

        const msg = `"${optionName}" verified successfully — chart is in full-screen mode.`;
        console.log(msg);
        if (world?.attach) await world.attach(msg, "text/plain");
        await page.evaluate(() => {
  if (document.fullscreenElement) {
    document.exitFullscreen();
  }
});
await page.waitForTimeout(10000);
          
      
      
        break;
      }


    case "Print Chat": {

    // Disable real print dialog
    await page.addInitScript(() => {
        window.print = () => {
            console.log("Print dialog simulated");
        };
    });

    // Small delay for MUI animation
    await page.waitForTimeout(300);

    // Force click the unstable MUI element
    await optionLocator.click({ force: true });

    // Wait for simulated print console message
    const consoleMsg = await page.waitForEvent("console", {
        timeout: 5000
    }).catch(() => null);

    expect(
        consoleMsg && consoleMsg.text().includes("Print dialog simulated"),
        `"${optionName}" print did not trigger window.print()`
    ).to.be.true;

    const msg = `"${optionName}" option clicked successfully (print simulated).`;
    console.log(msg);
    if (world?.attach) await world.attach(msg, "text/plain");

    // OPTIONAL: wait briefly
    await page.waitForTimeout(500);

    break;
}
case "Print Chart": {

    // Click the option (force because MUI menu is unstable)
    await optionLocator.click({ force: true });

    // Wait briefly to allow UI to react
    await page.waitForTimeout(500);

    // Confirm menu has closed
    const menuClosed = await page.waitForFunction(() => {
        const menu = document.querySelector('ul[role="menu"]');
        return !menu || menu.offsetParent === null || menu.style.display === "none";
    }, { timeout: 5000 }).catch(() => null);

    expect(
        menuClosed,
        `"${optionName}" menu did not close after clicking (print likely not triggered)`
    ).to.not.be.null;

    const msg = `"${optionName}" clicked — menu closed (print dialog simulated).`;
    console.log(msg);
    if (world?.attach) await world.attach(msg, "text/plain");

    // Optional: small wait to simulate print dialog appearing
    await page.waitForTimeout(500);

    break;
}
      // **************************************************************
      case "Download PNG image":
      case "Download JPEG image":
      case "Download PDF document":
      case "Download SVG vector image": {

        const expectedExt = {
          "Download PNG image": ".png",
          "Download JPEG image": ".jpeg",
          "Download PDF document": ".pdf",
          "Download SVG vector image": ".svg"
        }[optionName];

        // Trigger download
        const [download] = await Promise.all([
          page.waitForEvent('download'),
          optionLocator.click()
        ]);

        const fileName = download.suggestedFilename();

        expect(fileName.toLowerCase())
          .to.contain(expectedExt);

        const msg = `"${optionName}" verified successfully — downloaded: ${fileName}`;
        console.log(msg);
        if (world?.attach) await world.attach(msg, "text/plain");

        break;
      }

    
      default: {
        throw new Error(`Unknown option: ${optionName}`);
      }
    }

  } catch (error) {
    const failMsg = `Failed to verify chart option "${optionName}".\nError: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}

async AddtoBookmark(page, folder,str,world) {
  try { 
    // Click Bookmarks Icon
    let bookmarksIcon;
    await page.waitForTimeout(10000);
    if(str === "AnyNews"){
        const ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(20);;
        await ellipsis.waitFor({ state: "visible", timeout: 15000 });
        await ellipsis.click();
        const step2Msg = `Clicked on ellipsis.\n`;
       console.log(step2Msg);
        bookmarksIcon = page.locator('//li[normalize-space(text())="Add to Bookmarks"]').first();

    }else if(str === "SelectAll"){
      await this.clickSelectAll(page, world);
      bookmarksIcon = page.locator('//*[normalize-space(text())="Add to Bookmarks"]').first();
    }else{
      // const bookmarksIcon = page.locator(countryprofilrlocators.BookmarksIcon).first();
         bookmarksIcon = page.locator("[id='bookmark']").nth(1);
    }
    
    // Wait up to 60 seconds for the bookmarks icon to appear
    await bookmarksIcon.waitFor({ state: 'visible', timeout: 60000 });

// console.log('Bookmarks icon is visible!');


    const iconVisible = await bookmarksIcon.isVisible().catch(() => false);
    if (!iconVisible) {
      const failMsg = `"Bookmarks" icon is NOT visible on the page.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }
      await bookmarksIcon.waitFor({ state: "attached", timeout: 5000 });
      await bookmarksIcon.waitFor({ state: "visible", timeout: 5000 });
      await page.waitForLoadState('networkidle'); 
      await page.waitForTimeout(500);
      await bookmarksIcon.click({ force: true });
      
    const step1Msg = `Clicked on Add to Bookmarks icon.\n`;
    console.log(step1Msg);
    if (world?.attach) await world.attach(step1Msg, "text/plain");
    // Click New Folder
    await page.waitForTimeout(3000);
    const newFolderBtn = await page.locator(countryprofilrlocators.newfolderBtn);
    const newFolderVisible = await newFolderBtn.isVisible().catch(() => false);
    if (!newFolderVisible) {
      const failMsg = `"New Folder" button is NOT visible.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }
    await newFolderBtn.click();
    const step2Msg = `Clicked on "New Folder".\n`;
    console.log(step2Msg);
    if (world?.attach) await world.attach(step2Msg, "text/plain");
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, "0");
    const minutes = String(now.getMinutes()).padStart(2, "0");
    const currenttime = `${hours}${minutes}`;
    const folderName = `${folder}_${currenttime}`;
    //Enter folder name
    const folderField = page.locator(countryprofilrlocators.foldernameField);
    await folderField.fill(folderName);
    const step3Msg = `Entered folder name: ${folderName}\n`;
    console.log(step3Msg);
    if (world?.attach) await world.attach(step3Msg, "text/plain");
    // Click Save
     const saveBtn = page.locator(countryprofilrlocators.bookmarkFloderSave_btn);
     const saveVisible = await saveBtn.isVisible().catch(() => false);

if (!saveVisible) {
    const failMsg = `"Save" button NOT visible after entering folder name.\n`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw new Error(failMsg);
    }
     await saveBtn.click();
    // 4. Select folder from list
    await page.waitForTimeout(2000);
    const folderToSelect = page.locator(`//div[text()='${folderName}']`);
    const folderVisible = await folderToSelect.isVisible().catch(() => false);
    if (!folderVisible) {
      const failMsg = `Folder "${folderName}" is NOT visible in the list.\n`;
      console.error(failMsg);
      if (world?.attach) await world.attach(failMsg, "text/plain");
      throw new Error(failMsg);
    }
    await folderToSelect.click();
    const step4Msg = `Selected folder: ${folderName}\n`;
    console.log(step4Msg);
    if (world?.attach) await world.attach(step4Msg, "text/plain");
   
    // 5. Click Confirm
    const confirmBtn = page.locator(countryprofilrlocators.BookmarksConfirmBtn);
    await confirmBtn.click();
    const step5Msg = `Clicked Confirm.\n`;
    console.log(step5Msg);
    if (world?.attach) await world.attach(step5Msg, "text/plain");
    // Verify Success Message
 
     const successMsg = page.locator("//p[contains(text(), 'item') and contains(text(), 'added to My Bookmarks')]");
     await successMsg.waitFor({ state: "visible", timeout: 7000 });
     const msgText = (await successMsg.textContent())?.trim();
     const finalMsg =
      `Bookmark Folder Created Successfully.\n` +
      `Folder Name: ${folderName}\n` +
      `Success Message: ${msgText}\n`;
   console.log(finalMsg);
   if (world?.attach) await world.attach(finalMsg, "text/plain");

  } catch (error) {
    const failMsg = `Bookmark folder creation failed: ${error.message}\n`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}

async verifyFiltersOpenByDefault(page, world) {
    try {
        
        const filtersDiv = page.locator(countryprofilrlocators.FilterSection);
        const isVisible = await filtersDiv.isVisible().catch(() => false);
        if (isVisible) {
            const successMsg = 'Filters section is opened by default';
            console.log(successMsg);
            if (world?.attach) await world.attach(successMsg, 'text/plain');
        } else {
            const failMsg = 'Filters section is NOT visible (NOT opened) by default ';
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }
    } catch (error) {
        const errMsg = `Failed to verify Filters section visibility: ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, 'text/plain');
        throw error;
    }
}

async Contact_our_expert(page, opt, tab, world) {
    try {
      
        let Contact_our_expertIcon;
        await page.waitForTimeout(3000);

        if (tab === "AnyNews") {
            const ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(20);
            await ellipsis.waitFor({ state: "visible", timeout: 15000 });
            await ellipsis.click();

            const msg = "Clicked on ellipsis.";
            console.log(msg);
            if (world?.attach) await world.attach(msg, "text/plain");

            Contact_our_expertIcon = page.locator(`//li[normalize-space(text())="${opt}"]`).first();
        }

        await Contact_our_expertIcon.waitFor({ state: "visible" });

        // -------------------------------
        // LISTEN FOR MAILTO REQUEST
        // -------------------------------
        let mailtoDetected = false;

        const handler = (request) => {
            const url = request.url();
            if (url.startsWith("mailto:")) {
                mailtoDetected = true;
                if (world?.attach) world.attach(`Detected mailto request: ${url}`, "text/plain");
            }
        };

        page.on("request", handler);

        // Click the item
        await Contact_our_expertIcon.click({ force: true });
        await page.waitForTimeout(2000); // Give time for mailto trigger

        page.off("request", handler);

  
        // ASSERTION
     
        expect(mailtoDetected, "Expected mailto request, but none was detected").to.be.true;

        const successMsg = "Mailto email launch detected successfully!";
        console.log(successMsg);
        if (world?.attach) await world.attach(successMsg, "text/plain");
       for (const p of page.context().pages()) {
    try { 
        await p.bringToFront(); 
        break; 
    }
    catch {}
}
    } catch (error) {
        for (const p of page.context().pages()) {
    try { 
        await p.bringToFront(); 
        break; 
    }
    catch {}
}
        const errMsg = `Failed to verify Contact our expert redirection: ${error.message}`;
        console.error(errMsg);

        if (world?.attach) await world.attach(errMsg, "text/plain");
        throw error;
    }
}
async verifyFilterOptions(newPage, expectedoptions, world) {
  try {
    let presentTabs = []; 
    let missingTabs = []; 
    for (let i = 0; i < expectedoptions.length; i++) {
      const option = expectedoptions[i];
      const optionLocator = newPage.locator(`//*[text()='${option}']`).first();
      const isVisible = await optionLocator.isVisible().catch(() => false);
      if (isVisible) {
        presentTabs.push(option);
      } else {
        missingTabs.push(option);
      }
    }
    if (missingTabs.length > 0) {
      const failMessage =
        `The following required options are NOT present:\n` +
        missingTabs.map(t => `- ${t}`).join('\n');
        console.error(failMessage);
        if (world?.attach) await world.attach(failMessage, "text/plain");
      throw new Error(failMessage);
    }
    const successMessage =
      `The following options are present:\n` +
      presentTabs.map((t, index) => `${index + 1}. ${t}`).join('\n');
    console.log(successMessage);
    if (world?.attach) await world.attach(successMessage, "text/plain");

  } catch (error) {
    const failMsg = `Options verification failed.\n${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}

async verifyAddKeywordFilter(page,keyword,world) {
    try {

        
        const addKeywordAccordion = page.locator(countryprofilrlocators.Add_keyword).first();
        let isExpanded = await addKeywordAccordion.getAttribute("aria-expanded");
        if (isExpanded !== "true") {
            const msg = `'Add keyword' section is collapsed — expanding it now.`;
            console.log(msg);
           
            await addKeywordAccordion.click();
            await page.waitForTimeout(300);
        } else {
            const msg = `'Add keyword' section is already expanded.`;
            console.log(msg);
            // if (world?.attach) await world.attach(msg, 'text/plain');
        }
        // Input field for adding keyword
        const keywordInput = page.locator(countryprofilrlocators.Adding_keywordField);
        await keywordInput.fill(keyword);
        await keywordInput.press('Enter');
        await page.waitForTimeout(2000);
        const addedMsg = `Keyword '${keyword}' has been entered in adding keyword field.`;
        console.log(addedMsg);
        if (world?.attach) await world.attach(addedMsg, 'text/plain');

        const chip = page.locator(`//p[@aria-label='${keyword}']`);

        const isChipVisible = await chip.isVisible().catch(() => false);
        if (!isChipVisible) {
            const failMsg = `Keyword '${keyword}' was NOT added under applied section.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }

        const successMsg = `Keyword '${keyword}' is visible — Added under applied section..`;
        console.log(successMsg);
        if (world?.attach) await world.attach(successMsg, 'text/plain');

    } catch (error) {
        const errMsg = `Failed to adding keyword '${keyword}': ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, 'text/plain');
        throw error;
    }
}

async verifyDateRangeFilter(page,world) {
    try {
   
        const addKeywordAccordion = page.locator(countryprofilrlocators.Date_Range).first();
        let isExpanded = await addKeywordAccordion.getAttribute("aria-expanded");
        if (isExpanded !== "true") {
            const msg = `'Date Range' section is collapsed — expanding it now.`;
            console.log(msg);
           
            await addKeywordAccordion.click();
            await page.waitForTimeout(500);
            const Successmsg = `'Date Range' section is expanded and  date ranges are displayed.`;
            console.log(Successmsg);
             if (world?.attach) await world.attach(Successmsg, 'text/plain');

        } else {
            const msg = `'Date Range' section is already expanded and  date ranges are displayed.`;
            console.log(msg);
             if (world?.attach) await world.attach(msg, 'text/plain');
        }         

    } catch (error) {
        const errMsg = `Failed to verifying 'Date Range'dropdown : ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, 'text/plain');
        throw error;
    }
}

async verifyDateRangeSelection(page,date,world) {
    try {
        await this.verifyDateRangeFilter(page,world);
        // Select the date range 
        const keywordInput = page.locator(`//p[text()='${date}']`).first();
        await keywordInput.click();
        await page.waitForTimeout(2000);
        const addedMsg = `Date Range: '${date}' has been Selected in Date Range Dropdown.`;
        console.log(addedMsg);
        if (world?.attach) await world.attach(addedMsg, 'text/plain');

        const chip = page.locator(`//p[@aria-label='${date}']`);

        const isChipVisible = await chip.isVisible().catch(() => false);
        if (!isChipVisible) {
            const failMsg = `Keyword '${date}' was NOT added under applied section.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }

        const successMsg = `Date Range: '${date}' is visible — Added under applied section..`;
        console.log(successMsg);
        if (world?.attach) await world.attach(successMsg, 'text/plain');

    } catch (error) {
        const errMsg = `Failed to adding  Date Range: '${date}': ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, 'text/plain');
        throw error;
    }
}
async verifyFilteropt(page, opt,Validkeyword,InValidkeyword,world) {
    try {
        const filterOpt = page.locator(`//div[p[text()='${opt}']]`).first();
        await filterOpt.click();
        const clickMsg = `Clicked on filter option '${opt}'.`;
        console.log(clickMsg);
        if (world?.attach) await world.attach(clickMsg, 'text/plain');
        const tooltip = page.locator(countryprofilrlocators.tooltip);
        const isTooltipVisible = await tooltip.isVisible().catch(() => false);
        if (!isTooltipVisible) {
            const failMsg = `Window for '${opt}' filter did NOT open.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }
        const tooltipMsg = `Window for '${opt}' filter is opened.`;
        console.log(tooltipMsg);
        if (world?.attach) await world.attach(tooltipMsg, 'text/plain');
        // SEARCH VALID TOPIC AND VERIFY RESULT EXISTS 
        const searchInput = tooltip.locator(countryprofilrlocators.tooltip_search);
        await searchInput.fill(Validkeyword);
        await page.waitForTimeout(300); // small UI wait
        const validItem = tooltip.locator(`//p[@aria-label='${Validkeyword}']`);
        const isValidItemVisible = await validItem.isVisible().catch(() => false);
        if (!isValidItemVisible) {
            const failMsg = `'${Validkeyword}' was NOT found in the topic list after searching.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }
        const validMsg = `'${Validkeyword}' topic is visible in the search results.`;
        console.log(validMsg);
        if (world?.attach) await world.attach(validMsg, 'text/plain');
        // SEARCH INVALID TOPIC AND VERIFY LIST IS EMPTY
        await searchInput.fill(InValidkeyword);
        await page.waitForTimeout(300);
        // This list contains all topic rows
        const topicRows = tooltip.locator(countryprofilrlocators.topicRows);
        const count = await topicRows.count();
        if (count !== 0) {
            const failMsg = `Invalid search " ${InValidkeyword} " returned ${count} in the Topics search results — expected 0.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }
        const emptyMsg = `Invalid search " ${InValidkeyword} " returned empty list (in the Topics search results.).`;
        console.log(emptyMsg);
        if (world?.attach) await world.attach(emptyMsg, 'text/plain');
        const cancelBtn = tooltip.locator(countryprofilrlocators.tooltip_cancel);
        const isCancelVisible = await cancelBtn.isVisible().catch(() => false);
        if (!isCancelVisible) {
            const failMsg = `Cancel button is NOT visible in '${opt}' window.`;
            console.error(failMsg);
            // if (world?.attach) await world.attach(failMsg, 'text/plain');
            throw new Error(failMsg);
        }
        await cancelBtn.click();
    } catch (error) {
        const errMsg = `Failed to verify '${opt}' filter section: ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, 'text/plain');
        throw error;
    }
}

async  verifyTopicSection(page, type, world) {
    try {
       let filterOpt;
        if (type.toLowerCase() === "sources - topics") { 
           filterOpt = page.locator(countryprofilrlocators.sources_topics).first();
        }else {
        filterOpt = page.locator(countryprofilrlocators.Topics).first();
        }
        await filterOpt.click();
        if (world?.attach) await world.attach(`Clicked ${type} filter`, "text/plain");
        const tooltip = page.locator(countryprofilrlocators.filterOptTooltip);
        await tooltip.waitFor({ state: 'visible', timeout: 5000 });
        if (world?.attach) await world.attach(`${type} filter popup opened`, "text/plain");
        let locatorToUse;
        let label;  
        switch (type.toLowerCase()) {

            case "topics":
                locatorToUse = tooltip.locator("div:has(p)");
                label = "topics";
                break;

            case "sub topics":
                locatorToUse = tooltip.locator(countryprofilrlocators.subtopicsList);
                label = "sub topics";
                break;

            case "sources - topics":
                locatorToUse = tooltip.locator("div:has(p)");
                label = "topics";
                break;
    

            default:
                throw new Error(`Invalid type '${type}' provided. Use "topics" or "subtopics".`);
        }
        const count = await locatorToUse.count();
        const results = [];

        for (let i = 0; i < count; i++) {
            const p = locatorToUse.nth(i).locator("p").first();
            if (type.toLowerCase() === "topics") {
                const aria = await p.getAttribute("aria-label");
                if (!aria) {
                    const text = (await p.innerText()).trim();
                    if (text.length > 0) results.push(text);
                }
            } else {
                const aria = await p.getAttribute("aria-label");
                if (aria) results.push(aria.trim());
            }
        }

        //Remove duplicates but preserve order
        const uniqueList = [...new Set(results)];


        let finalOutput = `There are ${uniqueList.length} ${label}:\n`;
        uniqueList.forEach((t, i) => {
            finalOutput += `${i + 1}. ${t}\n`;
        });

        console.log(finalOutput.trim());
        if (world?.attach) await world.attach(finalOutput.trim(), "text/plain");
        //Close popup
        await page.locator(countryprofilrlocators.topicsPopup_Cancel).click();
    } catch (err) {
        const msg = `Error verifying ${type}: ${err.message}`;
        console.error(msg);
        if (world?.attach) await world.attach(msg, "text/plain");
        throw err;
    }
}
async verifyselectAll(page,type, world) {
    try {
       //Click "Topics"
       let filterOpt;
       if(type.toLowerCase()==="sources - topics"){
           filterOpt = page.locator(countryprofilrlocators.sources_topics).first();
       }else{
        filterOpt = page.locator(countryprofilrlocators.Topics).first();
       }
        await filterOpt.click();
        if (world?.attach) await world.attach(`Clicked ${type} filter`, "text/plain");
        // Wait for tooltip
        const tooltip = page.locator(countryprofilrlocators.tooltip);
        await tooltip.waitFor({ state: "visible", timeout: 5000 });
        if (world?.attach) await world.attach(`${type} filter popup opened`, "text/plain");

        // CLICK TOPIC "All"
        if(type.toLowerCase()=== "topics"){
        const allTopic = tooltip.locator("//p[normalize-space()='All']").first();
        await allTopic.click();
        if (world?.attach) await world.attach(`Clicked topic: All`, "text/plain");
        }
        // CLICK SELECT ALL BUTTON
        const selectAllBtn = tooltip.locator(countryprofilrlocators.tooltip_SelectAll);
        await selectAllBtn.click();
        if (world?.attach) await world.attach(`Clicked Select all button`, "text/plain");
        // GET ALL SUBTOPICS INSIDE TOOLTIP
        const subTopicDivs = tooltip.locator(countryprofilrlocators.tooltip_subtopicsLabel);
        const subCount = await subTopicDivs.count();
        if (subCount === 0) {
            throw new Error("No subtopics found after selecting topic.");
        }
        let subTopics = [];
        for (let i = 0; i < subCount; i++) {
            const p = subTopicDivs.nth(i).locator("p");
            const label = await p.getAttribute("aria-label");
            if (label) subTopics.push(label.trim()); // <-- trim spaces here
        }

        // Remove duplicates
        const uniqueSubTopics = [...new Set(subTopics)];

        // Log list
        let listOutput
        if(type.toLowerCase()=== "topics"){
        listOutput = `Subtopics selected (${uniqueSubTopics.length}):\n`;
        }
        if(type.toLowerCase()=== "sources - topics"){
         listOutput = `Topics selected (${uniqueSubTopics.length}):\n`;
        }
        uniqueSubTopics.forEach((t, i) => {
            listOutput += `${i + 1}. ${t}\n`;
        });
        console.log(listOutput.trim());
        if (world?.attach) await world.attach(listOutput.trim(), "text/plain");

        // 6. VERIFY EACH SUBTOPIC APPEARS UNDER APPLIED FILTER CHIPS
        for (let sub of uniqueSubTopics) {
            // Use normalize-space() to ignore leading/trailing spaces in chip text
            const chip = page.locator(`//div[@role='button']//span[normalize-space(text())="${sub}"]`);

            const isChipVisible = await chip.isVisible().catch(() => false);

            if (!isChipVisible) {
                const fail = `'${sub}' NOT Selected (chip not found).`;
                console.error(fail);
                if (world?.attach) await world.attach(fail, "text/plain");
                throw new Error(fail);
            }
        }

        const success = `All ${uniqueSubTopics.length} ${type} are successfully Selected`;
        console.log(success);
        if (world?.attach) await world.attach(success, "text/plain");

        //  Close the popup
        await page.locator(countryprofilrlocators.tooltip_cancel).click();

    } catch (error) {
        const msg = `Failed in verifyselectAll: ${error.message}`;
        console.error(msg);
        if (world?.attach) await world.attach(msg, "text/plain");
        throw error;
    }
}
async  verifyUnselectAll(page,type,world) {
    try {
        //Click "Topics"
       let filterOpt;
       if(type.toLowerCase()==="sources - topics"){
           filterOpt = page.locator(countryprofilrlocators.sources_topics).first();
       }else{
        filterOpt = page.locator(countryprofilrlocators.Topics).first();
       }
        await filterOpt.click();
        if (world?.attach) await world.attach(`Clicked ${type} filter`, "text/plain");
        // Wait for tooltip
        const tooltip = page.locator(countryprofilrlocators.tooltip);
        await tooltip.waitFor({ state: "visible", timeout: 5000 });
        if (world?.attach) await world.attach(`${type} filter popup opened`, "text/plain");

        // // 2. Wait for tooltip
        // const tooltip = page.locator('[role="tooltip"]');
        // await tooltip.waitFor({ state: "visible", timeout: 5000 });
        // if (world?.attach) await world.attach(`Topics filter popup opened`, "text/plain");

        // CLICK TOPIC "All"
        if(type.toLowerCase()=== "topics"){
        const allTopic = tooltip.locator("//p[normalize-space()='All']").first();
        await allTopic.click();
        if (world?.attach) await world.attach(`Clicked topic: All`, "text/plain");
        }
        // CLICK SELECT ALL BUTTON
        const selectAllBtn = tooltip.locator(countryprofilrlocators.tooltip_SelectAll);
        await selectAllBtn.click();
        if (world?.attach) await world.attach(`Clicked Select all button`, "text/plain");
        // GET ALL SUBTOPICS INSIDE TOOLTIP
        const subTopicDivs = tooltip.locator(countryprofilrlocators.tooltip_subtopicsLabel);
        const subCount = await subTopicDivs.count();
        if (subCount === 0) {
            throw new Error("No subtopics found after selecting topic.");
        }
        let subTopics = [];
        for (let i = 0; i < subCount; i++) {
            const p = subTopicDivs.nth(i).locator("p");
            const label = await p.getAttribute("aria-label");
            if (label) subTopics.push(label.trim()); // <-- trim spaces here
        }
       
        const uniqueSubTopics = [...new Set(subTopics)];

        // 6. Verify all subtopics appear under applied chips
        for (let sub of uniqueSubTopics) {
            const chip = page.locator(`//div[@role='button']//span[normalize-space(text())="${sub}"]`);
            const isChipVisible = await chip.isVisible().catch(() => false);

            if (!isChipVisible) {
                const fail = `Subtopic '${sub}' NOT applied after Select all.`;
                console.error(fail);
                if (world?.attach) await world.attach(fail, "text/plain");
                throw new Error(fail);
            }
        }
        if (world?.attach) await world.attach(`All ${uniqueSubTopics.length} subtopics applied `, "text/plain");

        // 7. Click "Unselect all"
        const unselectAllBtn = tooltip.locator(countryprofilrlocators.tooltip_UnSelectAll);
        await unselectAllBtn.click();
        if (world?.attach) await world.attach(`Clicked Unselect all button`, "text/plain");

        // 8. Verify all chips are removed
        for (let sub of uniqueSubTopics) {
            const chip = page.locator(`//div[@role='button']//span[normalize-space(text())='${sub}']`);
            const isChipVisible = await chip.isVisible().catch(() => false);

            if (isChipVisible) {
                const fail = `Topic '${sub}' STILL under applied after Unselect all.`;
                console.error(fail);
                if (world?.attach) await world.attach(fail, "text/plain");
                throw new Error(fail);
            }
        }

        const success = `All ${uniqueSubTopics.length} ${type} successfully deselected!`;
        console.log(success);
        if (world?.attach) await world.attach(success, "text/plain");

        // 9. Close tooltip
        const cancelBtn = page.locator(countryprofilrlocators.tooltip_cancel);
        await cancelBtn.click();

        // 10. Verify tooltip is closed
        const isTooltipVisible = await tooltip.isVisible().catch(() => false);
        if (isTooltipVisible) {
            const fail = ` ${type} filter popup  still visible after clicking Cancel.`;
            console.error(fail);
            if (world?.attach) await world.attach(fail, "text/plain");
            throw new Error(fail);
        } else {
            if (world?.attach) await world.attach(` ${type} filter popup successfully closed after clicking Cancel`, "text/plain");
        }

    } catch (error) {
        const msg = `Failed in verifyUnselectAll: ${error.message}`;
        console.error(msg);
        if (world?.attach) await world.attach(msg, "text/plain");
        throw error;
    }
}

async verifyAppliedFilters(topic,Filter,page, world) {
    try {
      //Click "Topics"
       let filterOpt;
       if(Filter.toLowerCase()==="sources"){
           filterOpt = page.locator(countryprofilrlocators.sources_topics).first();
       }else{
        filterOpt = page.locator(countryprofilrlocators.Topics).first();
       }
        await filterOpt.click();
        if (world?.attach) await world.attach(`Clicked Topics filter`, "text/plain");

        //Wait for tooltip:
        const tooltip = page.locator('[role="tooltip"]');
        await tooltip.waitFor({ state: "visible", timeout: 5000 });
        if (world?.attach) await world.attach(`${Filter} filter popup opened`, "text/plain");

        //Click Topic:        
        const allTopic = tooltip.locator(`//p[normalize-space()='${topic}']`).first();
        await allTopic.click();
        if (world?.attach) await world.attach(`Clicked topic: ${topic}`, "text/plain");
         if(Filter.toLowerCase()==="sources"){            
            const chip = page.locator(`//div[@role='button']//span[normalize-space(text())='${topic}']`);
            const isChipVisible = await chip.isVisible().catch(() => false);
             if (!isChipVisible) {
                const f = `Topic '${topic}' NOT selected (chip not found).`;
                console.error(f);
                if (world?.attach) await world.attach(f, "text/plain");
                throw new Error(f);
              }else {
              const smsg = `Topic '${topic}' is successfully selected`;
              console.log(smsg);
              if (world?.attach) await world.attach(smsg, "text/plain");
              }
        //Apply Filters
        await page.locator("//button[text()='Apply Filters']").click();
        await page.waitForTimeout(800);
 
        //Step 8: 
        const appliedChips = page.locator("//span[contains(@class,'MuiChip-label')]//p[@aria-label]");
        const appliedCount = await appliedChips.count();
        if (appliedCount === 0) {
            throw new Error("No applied chips found under the Applied section.");
        }
            const singleChip = page.locator(`//span[contains(@class,'MuiChip-label')]//p[@aria-label='${topic}']`);
            const exists = await singleChip.isVisible().catch(() => false);
            if (!exists) {
                const msg = `Applied section does NOT contain the Topic '${topic}'.`;
                console.error(msg);
                if (world?.attach) await world.attach(msg, "text/plain");
                throw new Error(msg);
            }
            const success = `Verified: Topic '${topic}' is present under Applied section.`;
            console.log(success);
            if (world?.attach) await world.attach(success, "text/plain");
            return;
}        
        if(Filter.toLowerCase()==="topics"){
        // Click Select All Button:
        const selectAllBtn = tooltip.locator("//button[normalize-space()='Select all']");
        await selectAllBtn.click();
        if (world?.attach) await world.attach(`Clicked Select all button`, "text/plain");
        // Get All Subtopics Inside Tooltip:
        const subTopicDivs = tooltip.locator("//div[p[@aria-label]]");
        const subCount = await subTopicDivs.count();
        if (subCount === 0) {
            throw new Error(`No subtopics found after selecting topic '${topic}'.`);
        }
        let subTopics = [];
        for (let i = 0; i < subCount; i++) {
            const p = subTopicDivs.nth(i).locator("p");
            const label = await p.getAttribute("aria-label");
            if (label) subTopics.push(label.trim()); 
        }
        // Remove duplicates :
        const uniqueSubTopics = [...new Set(subTopics)];
        // Log list :
        let listOutput = `Subtopics selected (${uniqueSubTopics.length}):\n`;
        uniqueSubTopics.forEach((t, i) => {
            listOutput += `${i + 1}. ${t}\n`;
        });
        console.log(listOutput.trim());
        if (world?.attach) await world.attach(listOutput.trim(), "text/plain");
        // Verify Each  Subtopic Appears Under Applied Filter Chips:
        for (let sub of uniqueSubTopics) {
            const chip = page.locator(`//div[@role='button']//span[normalize-space(text())='${sub}']`);
            const isChipVisible = await chip.isVisible().catch(() => false);
            if (!isChipVisible) {
                const f = `Subtopic '${sub}' NOT selected (chip not found).`;
                console.error(f);
                if (world?.attach) await world.attach(f, "text/plain");
                throw new Error(f);
            }
        }
        const smsg = `All ${uniqueSubTopics.length} subtopics are successfully selected!`;
        console.log(smsg);
        if (world?.attach) await world.attach(smsg, "text/plain");  
        // Apply Filters
        await page.locator("//button[text()='Apply Filters']").click();
        await page.waitForTimeout(800);

        // -------------------- STEP 8 ---------------------------
        const appliedChips = page.locator("//span[contains(@class,'MuiChip-label')]//p[@aria-label]");

        const appliedCount = await appliedChips.count();
        if (appliedCount === 0) {
            throw new Error("No applied chips found under the Applied section.");
        }
        // CASE 1 → Only ONE subtopic selected
        if (uniqueSubTopics.length === 1) {
            const sub = uniqueSubTopics[0];
            const singleChip = page.locator(`//span[contains(@class,'MuiChip-label')]//p[@aria-label='${sub}']`);
            const exists = await singleChip.isVisible().catch(() => false);
            if (!exists) {
                const msg = `Applied section does NOT contain the topic: '${sub}'.`;
                console.error(msg);
                if (world?.attach) await world.attach(msg, "text/plain");
                throw new Error(msg);
            }
            const success = `Verified: Topic '${sub}' is present under Applied section.`;
            console.log(success);
            if (world?.attach) await world.attach(success, "text/plain");
            return; 
        }
        // CASE 2 → MULTIPLE subtopics selected

        if (uniqueSubTopics.length > 1) {
            const total = uniqueSubTopics.length;
            const groupChip = page.locator(`//span[contains(@class,'MuiChip-label')]//p[contains(@aria-label,'(')]`);
            const expectedGroupChip = await groupChip.textContent();
            const groupExists = await groupChip.isVisible().catch(() => false);
            if (!groupExists) {
                const msg = `'${expectedGroupChip}' NOT found under Applied section.`;
                console.error(msg);
                if (world?.attach) await world.attach(msg, "text/plain");
                throw new Error(msg);
            }
            const foundMsg = `Verified: '${expectedGroupChip}'  is present under Applied section.`;
            console.log(foundMsg);
            if (world?.attach) await world.attach(foundMsg, "text/plain");
            // Click to Expand the Topics (...)
            await groupChip.click();
            await page.waitForTimeout(500);
            // Now verify all subtopics inside expanded chip
            for (let sub of uniqueSubTopics) {
                const chip = page.locator(`//div[@role='button']//span[normalize-space(text())='${sub}']`);
                const visible = await chip.isVisible().catch(() => false);
                if (!visible) {
                    const fail = `Subtopic '${sub}' NOT visible inside expanded Topics (${total}) chip.`;
                    console.error(fail);
                    if (world?.attach) await world.attach(fail, "text/plain");
                    throw new Error(fail);
                }
            }
            const finalSuccess = `All ${total} subtopics are successfully verified under Applied section.`;
            console.log(finalSuccess);
            if (world?.attach) await world.attach(finalSuccess, "text/plain");
        }
      }
    } catch (error) {
        const msg = `Failed in verifyselectAll_and_underApllied: ${error.message}`;
        console.error(msg);
        if (world?.attach) await world.attach(msg, "text/plain");
        throw error;
    }
}
async Click_on_any(page, world,Tab) {
    try {
        // 1. Locate first news item
        const firstNews = page.locator("//span[@aria-label]/p[@role='button']").first();
        // 2. Wait until at least one news headline is visible
        await firstNews.waitFor({ state: "visible", timeout: 5000 });
        // 3. Get headline text
        const headline = (await firstNews.textContent()).trim();
        // const msg1 = `First news selected: '${headline}'`;
        // console.log(msg1);
        // // if (world?.attach) await world.attach(msg1, "text/plain");
        // 4. Click the first news item
        await firstNews.click();
        await page.waitForTimeout(1000);
        const msg2 = `Clicked on first ${Tab}: '${headline}'`;
        console.log(msg2);
        if (world?.attach) await world.attach(msg2, "text/plain");
        // 5. Verify news is opened on the right side
        const newsAppearances = page.locator(`//span[@aria-label]/p[normalize-space(text())="${headline}"]`);
        const count = await newsAppearances.count();
        // const verifyMsg = `Found ${count} instances of headline '${headline}'`;
        // console.log(verifyMsg);
        // if (world?.attach) await world.attach(verifyMsg, "text/plain");
        // 6. Check result logic
        if (count === 2) {
            const passMsg = `${Tab}: '${headline}' opened correctly on the right-side window.`;
            console.log(passMsg);
            if (world?.attach) await world.attach(passMsg, "text/plain");
        } else {
            const failMsg = `FAIL: ${Tab} - '${headline}' did NOT open correctly on the right-side panel. Expected 2 appearances, found ${count}.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, "text/plain");
            throw new Error(failMsg);
        }
    } catch (error) {
        const err = `Failed in Clicking on any ${Tab}: ${error.message}`;
        console.error(err);
        if (world?.attach) await world.attach(err, "text/plain");
        throw error;
    }
}
async Sorting(page, opt, world) {
    try {
        // Click Sorting Dropdown
        const Sorting_dropdown = page.getByRole("button", {name: /Newest|Oldest|Relevance/,});
        await Sorting_dropdown.waitFor({ state: "visible", timeout: 15000 });
        await Sorting_dropdown.click();
        const msg1 = `Clicked Sorting dropdown.\n`;
        console.log(msg1);
        if (world?.attach) await world.attach(msg1, "text/plain");
        // Select Sorting Option Dynamically
        const Sorting_Option = page.locator(`//li[normalize-space(text())='${opt}']`).first();
        await Sorting_Option.waitFor({ state: "visible", timeout: 15000 });
        await Sorting_Option.click();
        const msg2 = `Selected sorting option: ${opt}\n`;
        console.log(msg2);
        if (world?.attach) await world.attach(msg2, "text/plain");
        //Wait a bit for sorting to apply
        await page.waitForTimeout(2000);
        //Grab All Timestamp Elements
        const timestamps = page.locator('p', {hasText: /[A-Za-z]{3} \d{1,2}, \d{4} \d{1,2}:\d{2} (AM|PM)/,});
        const count = await timestamps.count();
        const msg3 = `Found ${count} timestamp element(s).\n`;
        console.log(msg3);
        if (world?.attach) await world.attach(msg3, "text/plain");
        //Extract all timestamps as JS Date objects
        let dateList = [];
        for (let i = 0; i < count; i++) {
            const text = await timestamps.nth(i).innerText();
            dateList.push(new Date(text.trim()));
        }
        //Perform Sorting Assertions
        if (opt === "Newest") {
            for (let i = 0; i < dateList.length - 1; i++) {
                expect(dateList[i] >= dateList[i + 1],`Timestamps not sorted newest first at index ${i}`).to.be.true;
            }
            const msg4 = `Verified timestamps sorted by NEWEST.\n`;
            console.log(msg4);
            if (world?.attach) await world.attach(msg4, "text/plain");
        }
        if (opt === "Oldest") {
            for (let i = 0; i < dateList.length - 1; i++) {
                expect(dateList[i] <= dateList[i + 1],`Timestamps not sorted oldest first at index ${i}`).to.be.true;
            }
            const msg5 = `Verified timestamps sorted by OLDEST.\n`;
            console.log(msg5);
            if (world?.attach) await world.attach(msg5, "text/plain");
        }
        if (opt === "Relevance") {
            const msg6 = `Relevance sorting selected — cannot validate timestamps. UI maintains relevance logic.\n`;
            console.log(msg6);
            if (world?.attach) await world.attach(msg6, "text/plain");
        }
    } catch (error) {
        const errMsg = `Failed to verify sorting (${opt}): ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, "text/plain");
        throw error;
    }
}

async Click_on_any_news_and_close(page, world) {
    try {
        // 1. Locate first news item
        const firstNews = page.locator("//span[@aria-label]/p[@role='button']").first();

        // 2. Wait until at least one news headline is visible
        await firstNews.waitFor({ state: "visible", timeout: 5000 });

        // 3. Get headline text
        const headline = (await firstNews.textContent()).trim();

        // const msg1 = `First news selected: '${headline}'`;
        // console.log(msg1);
        // // if (world?.attach) await world.attach(msg1, "text/plain");

        // 4. Click the first news item
        await firstNews.click();
        await page.waitForTimeout(1000);

        const msg2 = `Clicked on first news: '${headline}'`;
        console.log(msg2);
        if (world?.attach) await world.attach(msg2, "text/plain");

        // 5. Verify news is opened on the right side
        const newsAppearances = page.locator(`//span[@aria-label]/p[normalize-space(text())='${headline}']`);
        const count = await newsAppearances.count();

        // const verifyMsg = `Found ${count} instances of headline '${headline}'`;
        // console.log(verifyMsg);
        // if (world?.attach) await world.attach(verifyMsg, "text/plain");

        // 6. Check result logic
        if (count === 2) {
            const passMsg = `News: '${headline}' opened correctly on the right-side window.`;
            console.log(passMsg);
            if (world?.attach) await world.attach(passMsg, "text/plain");
        } else {
            const failMsg = `FAIL: News '${headline}' did NOT open correctly on the right-side panel. Expected 2 appearances, found ${count}.`;
            console.error(failMsg);
            if (world?.attach) await world.attach(failMsg, "text/plain");
            throw new Error(failMsg);
        }

       // 1. Locate first news item
       const closeButton = page.locator('button:has(path[d*="15.5418"])');
      //  const closeButton = page.locator('button:has(svg path[d*="L"])').nth(9);
       
        // 2. Wait until at least one news headline is visible
        await closeButton.waitFor({ state: "visible", timeout: 5000 });
        await closeButton.click();
    
        console.log("Closed the side panel using X button");
       const suggestionLocator = page.locator("//p[text()='Summarize']").first();
    const isVisible = await suggestionLocator.isVisible().catch(() => false);
    expect(isVisible, `News: '${headline}' is Closed correctly (Right-side window).`).to.be.false;
    const successMsg = `News: '${headline}' is Closed correctly (Right-side window). `;
    console.log(successMsg);
    if (world?.attach) await world.attach(successMsg, "text/plain");



    } catch (error) {
        const err = `Failed in Click_on_any_news and Close: ${error.message}`;
        console.error(err);
        if (world?.attach) await world.attach(err, "text/plain");
        throw error;
    }
}
async Click_on_str(str, page, world) {
    try {
        // Locate & click the button (Ask Document)
        const btn = page.locator(`//p[text()='${str}']`).first();
        await btn.waitFor({ state: "visible", timeout: 10000 });

        // Wait for the new tab to open
        const [newTab] = await Promise.all([
            page.context().waitForEvent("page"),   // NEW TAB IS OPENING
            btn.click()
        ]);
        await newTab.waitForLoadState("domcontentloaded");
        // Verify chat box is visible in new tab
        const chatInput = newTab.locator("//textarea[@placeholder='Ask about this document']");
        await chatInput.waitFor({ state: "visible", timeout: 15000 });
        const successMsg = `A chat box is opened for '${str}' in a new tab.`;
        console.log(successMsg);
        if (world?.attach) await world.attach(successMsg, "text/plain");
        return page;
    } catch (error) {
        const err = `Failed in Click_on_${str}: ${error.message}`;
        console.error(err);
        if (world?.attach) await world.attach(err, "text/plain");
        throw error;
    }
}
async Click_on_str_And_Close(str, page, world) { 
  try{
    await this.Click_on_str(str,page,world)
      const pages = page.context().pages();
        const aiTab = pages[pages.length - 1];
        if (!aiTab || aiTab === page) {
            throw new Error("Ask Document tab was not detected.");
        }
    const closeBtn = aiTab.locator("//div[p[normalize-space()='AskREDD']]//following::button[1]").first();
        await closeBtn.waitFor({ state: "visible", timeout: 15000 });
        await closeBtn.click();
        // Paragraph shown after hover
    const popup = aiTab.locator("//div[p[normalize-space()='AskREDD']]");
    await aiTab.waitForTimeout(1000); 
    const popupVisible = await popup.isVisible();
    if (popupVisible) {
       throw new Error("The summarize pop up is not closed.");
    }
    if (!popupVisible) {
      if (world?.attach)
        await world.attach(`The summarize pop up is closed.`, "text/plain"); 
    }
  }catch (error) {
    const err = `Failed in Click_on_${str} and Close: ${error.message}`;
        console.error(err);
        if (world?.attach) await world.attach(err, "text/plain");
        throw error;
  }
}

async Askquestion(question, page, world) {
    try {
        // Get ALL open pages (tabs)
        const pages = page.context().pages();
        //The last opened page is the Ask Document chat tab
        const aiTab = pages[pages.length - 1];
        if (!aiTab || aiTab === page) {
            throw new Error("Ask Document tab was not detected.");
        }
        await aiTab.waitForLoadState("domcontentloaded");
        // Type the question in chat input
        const chatInput = aiTab.locator("//textarea[@placeholder='Ask about this document']");
        await chatInput.waitFor({ state: "visible", timeout: 15000 });
        await chatInput.fill(question);
        // Press Enter to submit
        await chatInput.press("Enter");
        if (world?.attach)
            await world.attach(`Asked question: "${question}"`, "text/plain");
        // Wait for AI response 
        const responseBox = aiTab.locator("//div[@id='markdown_text']");
        await responseBox.waitFor({ state: "visible", timeout: 30000 });
        if(!responseBox){
            const FailMsg =
            `The AI is not responded with the nearest answer to the question asked.`;
        console.log(FailMsg);
        if (world?.attach) await world.attach(FailMsg, "text/plain");
        }
        // Read the response text
        const responseText = await responseBox.textContent();
        const successMsg =
            `The AI responded with the nearest answer to the question asked:\n${responseText.trim()}`;
        console.log(successMsg);
        if (world?.attach) await world.attach(successMsg, "text/plain");
        //Close AI tab
        await aiTab.close();
        if (world?.attach)
            await world.attach(`AI chat tab closed successfully.`, "text/plain");

        return page;

    } catch (error) {
        const err = `Failed in Askquestion: ${error.message}`;
        console.error(err);
        if (world?.attach) await world.attach(err, "text/plain");
        throw error;
    }
}
async Verify_Highlighted_Words(clickon, refNum, page, world) {
  try {
    const pages = page.context().pages();
    const aiTab = pages[pages.length - 1];
    if (!aiTab || aiTab === page) {
        throw new Error("AI / Summarize tab was not detected.");
    }
    await aiTab.waitForLoadState("domcontentloaded");

    // Reference number locator
    const RefNum = aiTab.locator(`//div[@id='markdown_text']//a[contains(@class,'page-number-link') and text()='${refNum}']`);
    await RefNum.waitFor({ state: "visible", timeout: 15000 });

    // Click reference number if needed
    if (clickon.toLowerCase() === "reference number") {
      await RefNum.click({force: true});
      await aiTab.waitForLoadState("domcontentloaded");
      if (world?.attach) await world.attach(`Clicked on ${clickon}`, "text/plain");
    }

    // Hover to reveal paragraph
    await RefNum.hover();
    if (world?.attach) await world.attach(`Hovered on reference number "${refNum}"`, "text/plain");

    // Extract paragraph
    let paragraphLocator;
    try {
      paragraphLocator = aiTab.locator("//p[contains(normalize-space(), 'page')]/following-sibling::p[1]");
      await paragraphLocator.waitFor({ state: "visible", timeout: 2000 });
    } catch (e) {
      paragraphLocator = aiTab.locator("//button[contains(normalize-space(), 'Reference')]/following::p[2]");
      await paragraphLocator.waitFor({ state: "visible", timeout: 2000 });
    }

    let paragraphText = await paragraphLocator.textContent();
    if (!paragraphText) throw new Error("Reference paragraph text could not be extracted.");

    // Click "View in document" if needed
    if (clickon.toLowerCase() === "view in document") {
      const ViewInDocument = aiTab.locator(`//button[p[normalize-space()='${clickon}']]`);
      await ViewInDocument.waitFor({ state: "visible", timeout: 15000 });
      await ViewInDocument.click();
      if (world?.attach) await world.attach(`Clicked on ${clickon}`, "text/plain");
    }

    // Normalize paragraph text
    const normalizeText = text => text
      .toLowerCase()
      .replace(/[.,\/#!$%\^&\*;:{}=\-_`~()’']/g, "") // remove punctuation and apostrophes
      .replace(/\s+/g, " ") // normalize spaces
      .trim();

    const normalizedParagraph = normalizeText(paragraphText);

    // Get highlighted words
    await aiTab.waitForTimeout(5000); // wait for highlights to appear
    const Highlights = aiTab.locator("//span[contains(@class,'search-highlight')]");
    const highlightCount = await Highlights.count();
    if (highlightCount === 0) throw new Error("No highlighted text elements found.");

    let highlightedWords = [];
    for (let i = 0; i < highlightCount; i++) {
      let text = await Highlights.nth(i).textContent();
      text = normalizeText(text);
      highlightedWords.push(text);
    }

    // Logging
    const logMsg = `
Relevant Paragraph: ${paragraphText}
Normalized Paragraph: ${normalizedParagraph}
Highlighted Words: ${highlightedWords.join(" ")}
    `;
    console.log(logMsg);
    // if (world?.attach) await world.attach(logMsg, "text/plain");

    // Check if all highlighted words are present in paragraph
    for (const word of highlightedWords) {
      if (!normalizedParagraph.includes(word)) {
        throw new Error(`Highlighted word "${word}" not found in paragraph.`);
      }
    }
     if (world?.attach)
        await world.attach(`Highlighted paragraph is relevant paragraph.\n Relevant paragraph : ${paragraphText}\n Highlight: ${highlightedWords.join(" ")}`,"text/plain");
     
        return true;



  } catch (error) {
    const err = `Failed in verify relevant paragraph: ${error.message}`;
    console.error(err);
    if (world?.attach) await world.attach(err, "text/plain");
  
    throw error;
  }
}
async HoverOnReferenceNumber(refNum, page, world) {
  try {
    const pages = page.context().pages();
    const aiTab = pages[pages.length - 1];

    if (!aiTab || aiTab === page) {
      throw new Error("AI / Summarize tab was not detected.");
    }

    await aiTab.waitForLoadState("domcontentloaded");

    // Locate reference number
    const RefNum = aiTab.locator(
      `//div[@id='markdown_text']//a[contains(@class,'page-number-link') and text()='${refNum}']`
    );

    await RefNum.waitFor({ state: "visible", timeout: 15000 });
    await RefNum.hover();

    if (world?.attach)
      await world.attach(`Hovered on reference number "${refNum}"`, "text/plain");


    // Paragraph shown after hover
    let paragraph;
    try {
      paragraph = aiTab.locator("//p[contains(normalize-space(), 'page')]/following-sibling::p[1]");
     
    }catch(e){
     paragraph = aiTab.locator("//button[contains(normalize-space(), 'Reference')]/following::p[2]");
    }
    const viewButton = aiTab.locator("//button[p[normalize-space()='View in document']]");

    // Wait for either paragraph OR view button to appear
    await aiTab.waitForTimeout(1000); // small wait because popup loads dynamically

    const paragraphVisible = await paragraph.isVisible();
    const viewButtonVisible = await viewButton.isVisible();

    let paragraphText = "";
    if (paragraphVisible) {
      paragraphText = await paragraph.textContent();
    }

    if (!paragraphVisible && !viewButtonVisible) {
      if (world?.attach)
        await world.attach(
          `The popup did NOT show content and did NOT show 'View in document' button.`,
          "text/plain"
        );
      return false;
    }

    if (world?.attach)
      await world.attach(
        `The popup showed content or 'View in document' button.\nContent:\n${paragraphText}`,
        "text/plain"
      );

    return true;

  } catch (error) {
    const err = `Failed in verify Hover On ReferenceNumber: ${error.message}`;
    console.error(err);
    if (world?.attach) await world.attach(err, "text/plain");
    throw error;
  }
}
async verifyNewstabOption(page, world, optionName) {
  
  try {
    
    const ellipsis = page.locator('[viewBox="0 0 20 21"]').nth(20);;
    await ellipsis.waitFor({ state: "visible", timeout: 15000 });
    await ellipsis.click();

    if (world?.attach)
      await world.attach(`Clicked on ellipsis icon`, "text/plain");

    const menuItems = page.locator('//li[@role="menuitem"]');
    const count = await menuItems.count();

    if (count === 0) {
      throw new Error("No options found after clicking ellipsis.");
    }
    // Switch-case logic based on step text
    switch (optionName) {
      case "Available Options": {
        if (world?.attach)
          await world.attach(`Available Options are:`, "text/plain");
          // Log all found options
    let allOptions = [];
    for (let i = 0; i < count; i++) {
      const text = (await menuItems.nth(i).textContent()).trim();
      allOptions.push(text);

      const logText = `${i + 1}. ${text}`;
      console.log(logText);

      if (world?.attach)
        await world.attach(logText, "text/plain");
    }
        break;
      }
    case "Download": {
    const optionLocator = page.locator(`//li[normalize-space(text())='${optionName}']`);
    await optionLocator.waitFor({ state: 'visible', timeout: 10000 });
    if (world?.attach)
        await world.attach(`"${optionName}" option found`, "text/plain");
    // Start download
    const [download] = await Promise.all([
        page.waitForEvent("download"),
        optionLocator.click()
    ]);
    const filename = download.suggestedFilename();
    const downloadPath = require("path").join(process.cwd(), "downloads", filename);
    // Ensure directory exists
    const fs = require("fs");
    if (!fs.existsSync("downloads")) fs.mkdirSync("downloads");
    await download.saveAs(downloadPath);
    if (world?.attach)
        await world.attach(`File downloaded: ${downloadPath}`, "text/plain");
    // OPEN DOWNLOADED PDF FILE (Windows Default PDF Viewer)
    const { exec } = require("child_process");
    exec(`start "" "${downloadPath}"`, (err) => {
        if (err) {
            if (world?.attach)
                world.attach(`Failed to open FILE: ${err.message}`, "text/plain");
            throw new Error("FILE could not be opened.");
        }
    });

    if (world?.attach)
        await world.attach(
            `The selected news was downloaded and opened to read.\nOpened File: ${filename}`,
            "text/plain"
        );

    break;
}
      default:
        throw new Error(`Unknown option: "${optionName}" .`);
    }

    return true;

  } catch (error) {
    const err = `Failed in verifyNewstabOption: ${error.message}`;
    console.error(err);

    if (world?.attach)
      await world.attach(err, "text/plain");

    throw error;
  }
}
async clickSelectAll(page, world) {
    try {
        const selectAll = page.locator('//*[text()="Select all"]').first();

        await selectAll.waitFor({ state: "visible", timeout: 15000 });
        await selectAll.click();

        const msg = `Clicked on "Select All".`;
        console.log(msg);
        if (world?.attach) await world.attach(msg, "text/plain");

    } catch (error) {
        const errMsg = `ERROR: Failed to click "Select All". Reason: ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, "text/plain");

        throw new Error(errMsg);
    }
}

async verifySelectAllOption(page, world, option) {
    try {
      
        // -----------------------------------------------
        // 2️⃣ COUNT NEWS BEFORE SELECTED
        // -----------------------------------------------
        const allNews = page.locator("//span[@aria-label]/p[@role='button']");
        const countBefore = await allNews.count()-1;

        const msg2 = `Total News found on page before selection: ${countBefore}`;
        console.log(msg2);
        if (world?.attach) await world.attach(msg2, 'text/plain');

         // -----------------------------------------------
        // 6️⃣ STORE HEADLINES BEFORE VIEW SELECTED
        // -----------------------------------------------
        const headlines = [];

        for (let i = 0; i < countBefore; i++) {
            const eachNews = allNews.nth(i);
            await eachNews.waitFor({ state: "visible", timeout: 5000 });

            const headline = (await eachNews.textContent()).trim();
            headlines.push(headline);
        }

        const msg5 = `Captured ${headlines.length} headlines before viewing selected.`;
        console.log(msg5);
        if (world?.attach) await world.attach(msg5, "text/plain");

          // -----------------------------------------------
        // 1️⃣ CLICK "Select All"
        // -----------------------------------------------
        const selectAll = page.locator('//*[text()="Select all"]').first();

        await selectAll.waitFor({ state: "visible", timeout: 15000 });
        await selectAll.click();

        const msg1 = `Clicked on "Select All".`;
        console.log(msg1);
        if (world?.attach) await world.attach(msg1, "text/plain");


        // -----------------------------------------------
        // 3️⃣ READ SELECTED NEWS COUNT FROM CHIP
        // -----------------------------------------------
        const selectedChip = page.locator(
            '//p[normalize-space()="Selected News"]/following-sibling::div//span[contains(@class,"MuiChip-label")]'
        );
        await selectedChip.waitFor({ state: "visible" });

        const selectedCountText = await selectedChip.innerText();
        const selectedCount = parseInt(selectedCountText.trim(), 10);

        const msg3 = `Chip shows Selected News Count = ${selectedCount}`;
        console.log(msg3);
        if (world?.attach) await world.attach(msg3, 'text/plain');

        // -----------------------------------------------
        // 4️⃣ VALIDATE selectedCount == countBefore
        // -----------------------------------------------
        if (selectedCount !== countBefore) {
            const fail = `FAIL: Select All mismatch → Chip: ${selectedCount}, Actual: ${countBefore}`;
            console.error(fail);
            if (world?.attach) await world.attach(fail, "text/plain");
            throw new Error(fail);
        }

        const pass = `PASS: Select All verified → ${selectedCount} items selected.`;
        console.log(pass);
        if (world?.attach) await world.attach(pass, "text/plain");

        // -----------------------------------------------
        // 5️⃣ CLICK "View Selected"
        // -----------------------------------------------
        const viewSelected = page.locator(`//*[text()="${option}"]`);
        await viewSelected.waitFor({ state: "visible", timeout: 5000 });
        await viewSelected.click();

        const msg4 = `Clicked on option "${option}".`;
        console.log(msg4);
        if (world?.attach) await world.attach(msg4, 'text/plain');

       await page.waitForTimeout(20000);

        // -----------------------------------------------
        // 7️⃣ VERIFY EACH NEWS APPEARS TWICE
        //    → 1st: main list
        //    → 2nd: right-side selected panel
        // -----------------------------------------------
        for (let i = 0; i < countBefore; i++) {
            const headline = headlines[i];

            const newsAppearances = page.locator(
                `//span[@aria-label]/p[normalize-space(text())="${headline}"]`
            );

            const count = await newsAppearances.count();

            if (count === 2) {
                const success = `News-${i+1}: '${headline}' appears in both main list And right-side window.\n`;
                console.log(success);
                if (world?.attach) await world.attach(success, "text/plain");
            } else {
                const fail = `News-${i+1}: '${headline}' expected 2 appearances(in both main list And right-side window.), found ${count} appearance (in main list) .\n`;
                console.error(fail);
                if (world?.attach) await world.attach(fail, "text/plain");
                throw new Error(fail);
            }
        }

        const finalPass = `ALL NEWS verified successfully after "View selected".`;
        console.log(finalPass);
        if (world?.attach) await world.attach(finalPass, "text/plain");

    } catch (error) {
        const errMsg = `Error in verifySelectAllOption(): ${error.message}`;
        console.error(errMsg);
        if (world?.attach) await world.attach(errMsg, "text/plain");
        throw error;
    }
}


async verifyExportOption(page,world,option) {
  try {

        await this.clickSelectAll(page,world);
        const optionLocator = page.locator(`//*[text()="${option}"]`);
        await optionLocator.waitFor({ state: "visible", timeout: 5000 })     

    if (world?.attach) await world.attach(`Option found: ${option}`, "text/plain");

        // Trigger download
        const [download] = await Promise.all([
          page.waitForEvent('download'),
          optionLocator.click()
        ]);

        const fileName = download.suggestedFilename();

        expect(fileName.toLowerCase())
          .to.contain(".pdf");

        const msg = `"${option}" Option verified successfully And File downloaded successfully, File: ${fileName}`;
        console.log(msg);
        if (world?.attach) await world.attach(msg, "text/plain");

      
  } catch (error) {
    const failMsg = `Failed to verify "${option}".\nError: ${error.message}`;
    console.error(failMsg);
    if (world?.attach) await world.attach(failMsg, "text/plain");
    throw error;
  }
}






}

module.exports = { CountryProfile };
