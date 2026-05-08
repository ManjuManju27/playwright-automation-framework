 const { Given, When, Then, defineStep } = require('@cucumber/cucumber');
 const countryprofilrlocators = require('../locators/CountryProfileLocators.json');
 const path = require('path');
const fs = require('fs');


Given('Navigate to {string} section', async function (sectionName) {
  await this.countryProfilePage.navigateToSection(sectionName);
  this.attach(`Clicked On '${sectionName}'`)
});
Then('Verify the recently viewed section', { timeout: 70000 }, async function () {
  const { text, isVisible, reportText } = await this.countryProfilePage.Verify_recently_viewed_section();
  this.attach(`'${text}' is Displayed`, 'text/plain'); 
  this.attach(reportText, 'text/plain');              
  if (!isVisible) {
    throw new Error(`Recently viewed section is not Visible`);
  }
   
});

When('Select {string} from Country of Risk dropdown', { timeout: 70000 }, async function (optionText) {
  const { selectedOpt } = await this.countryProfilePage.selectCountryDropdown(optionText);
   this.attach(`" ${selectedOpt} " is Selected`);
 
});
When('Enter {string} in the search text box', { timeout: 70000 }, async function (input) {
 await this.countryProfilePage.searchInput(input);
 
});
Then('Verify that list should be displayed only countries related to the {string}', { timeout: 60000 }, async function (expectedValue) {
  const { text1} = await this.countryProfilePage.verifyCountryOfRiskColumn(expectedValue); 
  this.attach(`Displayed list related to ${text1}`);
 
});


Then('Click on any country in the recently viewed section', { timeout: 60000 }, async function () {
  const firstItem = this.page.locator(countryprofilrlocators.Recently_viewed_item).first();
  const { firstItemText, newTabUrl, newTabTitle, screenshotBuffer,newPage } = await this.countryProfilePage.clickFirstRecentlyViewedItemAndVerify(firstItem); 
   this.attach(`Clicking on first Recently Viewed item: ${firstItemText}`);
   this.attach(`New tab opened successfully!`);
   this.attach(`URL: ${newTabUrl}`);
   this.attach(`Title: ${newTabTitle}`);
   this.attach(screenshotBuffer, 'image/png');
   await newPage.close();
});

Then('Verify the default option for the dropdown {string}', { timeout: 60000 }, async function (defaultOpt) {
  const { Selected } = await this.countryProfilePage.Verify_defaultOption_dropdown_CountryOfRisk(defaultOpt);
   this.attach(`Default selected option is: ${Selected}`);
});

defineStep('Choose {string} option and Verify the respective country or company profile should be opened in a new tab', { timeout: 60000 }, async function (str) {

   try {
      const suggestionsLocator = this.page.locator(countryprofilrlocators.Search_Suggestions);
      const FirstsuggestionsLocator = this.page.locator(countryprofilrlocators.Search_Suggestions).first();
      await FirstsuggestionsLocator.waitFor({ state: 'visible' });
      const suggestionCount = await suggestionsLocator.count();
      expect(suggestionCount, 'No suggestions found').to.be.greaterThan(0);

      let targetSuggestion = null;

      if (str === 'any') {
        
        targetSuggestion = suggestionsLocator.first();
      } else {
        
        for (let i = 0; i < suggestionCount; i++) {
          const suggestion = suggestionsLocator.nth(i);
          const text = (await suggestion.textContent())?.trim() || '';

          if (text === str) {
            targetSuggestion = suggestion;
            break;
          }
        } 
        expect(targetSuggestion, `Suggestion "${str}" not found in list`).to.not.be.null;
      }
      const { firstItemText, newTabUrl, newTabTitle, screenshotBuffer,newPage } = await this.countryProfilePage.clickFirstRecentlyViewedItemAndVerify(targetSuggestion); 
   this.newPage = newPage; 
  this.attach(`Clicking on : ${firstItemText}`);
   this.attach(`New tab opened successfully!`);
   this.attach(`URL: ${newTabUrl}`);
   this.attach(`Title: ${newTabTitle}`);
   if (str === 'any') {
   await newPage.close();
   };
    } catch (error) {
      const failMsg = `Failed to choose option "${str}" and verify new tab.\nError: ${error.message}`;
      console.error(failMsg);
      if (this?.attach) await this.attach(failMsg, 'text/plain');
      throw error;
    }
});


// Then('Verify {string} tab',async function (tabString) {
//     try {
//       if (!this.newPage) {
//         throw new Error("No new tab available...");
//       }

//      // const expectedTabs = tabString.split(',').map(t => t.trim());

//       await this.countryProfilePage.verifyTab(this.newPage,tabString,this);

//     } catch (error) {
//       const failMsg = `Failed to verify ${tabString}. Error: ${error.message}`;
//       console.error(failMsg);
//       if (this?.attach) this.attach(failMsg, 'text/plain');
//       throw error;
//     }
//   }
// );
Then('Verify {string}', async function (tabString) {
  try {
    if (!this.newPage) throw new Error("No new tab available...");
    await this.countryProfilePage.verify(this.newPage, tabString, this);
  } catch (error) {
    const failMsg = `Failed to verify ${tabString}. Error: ${error.message}`;
    console.error(failMsg);
    if (this?.attach) this.attach(failMsg, 'text/plain');
    throw error;
  }
});





Then('Verify the tabs - {string}',async function (tabString) {
    try {
      if (!this.newPage) {
        throw new Error("No new tab available...");
      }

      const expectedTabs = tabString.split(',').map(t => t.trim());

      await this.countryProfilePage.verifyTabsInNewPage(this.newPage,expectedTabs,this);

    } catch (error) {
      const failMsg = `Failed to verify tabs. Error: ${error.message}`;
      console.error(failMsg);
      if (this?.attach) this.attach(failMsg, 'text/plain');
      throw error;
    }
  });

  Then('Verify the filters options - {string}',async function (tabString) {
    try {
      const expectedoptions = tabString.split(',').map(t => t.trim());

      await this.countryProfilePage.verifyFilterOptions(this.newPage,expectedoptions,this);

    } catch (error) {
      const failMsg = `Failed to verify Filter Options. Error: ${error.message}`;
      console.error(failMsg);
      if (this?.attach) this.attach(failMsg, 'text/plain');
      throw error;
    }
  });
Then('Click on Select All and Verify the options - {string}',async function (OptionsString) {
    try {
      const expectedoptions = OptionsString.split(',').map(t => t.trim());

            const Select_all = this.newPage.locator('//*[text()="Select all"]').first();
            await Select_all.waitFor({ state: "visible", timeout: 15000 });
            await Select_all.click();
            const Select_allMsg = `Clicked on "Select All".`;
            console.error(Select_allMsg);
            if (this?.attach) this.attach(Select_allMsg, 'text/plain');

      await this.countryProfilePage.verifyFilterOptions(this.newPage,expectedoptions,this);

    } catch (error) {
      const failMsg = `Failed to verify Options. Error: ${error.message}`;
      console.error(failMsg);
      if (this?.attach) this.attach(failMsg, 'text/plain');
      throw error;
    }
  });

Then('Suggestions should be displayed only when minimum of 2 characters are entered in the search text box {string}', async function (str) {
  await this.countryProfilePage.verifySearchSuggestionThreshold(this,str);
});

Then('Click on close in the search text box', async function () {
  await this.countryProfilePage.verifySearchBoxClose(this);
});
defineStep('Verify the count near the Search for sovereigns, SOEs, Subnational and Supranational issuers.', async function () {
  await this.countryProfilePage.verifyCount(this);
});
defineStep('Verify the toggle for {string}', async function (str) {
  await this.countryProfilePage.verifyToggleState(this,str);
});
Then('Verify the issuers which are on the spotlight', async function () {
  await this.countryProfilePage.verifyIssuerName(this);
});

Then('Turn on the toggle- {string}', async function (str) {
  await this.countryProfilePage.verifyToggleState(this,str);
});
defineStep('Navigate to {string} -> {string}', async function (label,subLabel) {
  await this.countryProfilePage.navigateToTab (this.newPage,label,subLabel,this);
});
defineStep('Click on share icon and Enter email address and message - {string}',async function (str,dataTable) {
    const data = dataTable.rowsHash();
    await this.countryProfilePage.shareData(this.newPage,str,data.EmailID,data.Message,data.ClickOn,this);
  }
);
Then('Verify Sorting dropdown - {string}', async function (opt) {
  await this.countryProfilePage.Sorting(this.newPage,opt,this);
});


Then('Verify {string} option for charts in {string}', async function (optionName,str) {
  await this.countryProfilePage.verifyChartOption(this.newPage,this, optionName,str);
});

Then('Verify {string} option in SelectAll', async function (option) {
  await this.countryProfilePage.verifyExportOption(this.newPage,this,option);
});
Then('Click on ellipsis and Verify {string}', async function (optionName) {
  await this.countryProfilePage.verifyNewstabOption(this.newPage,this,optionName);
});
When('Verify Add to bookmarks',async function (dataTable) {
    const params = dataTable.rowsHash();
    const folderName = params["FolderName"];
     const str = params["Tab"];
    await this.countryProfilePage.AddtoBookmark(this.newPage, folderName,str,this.world);
  });

Then('Verify the filters section is open by default', async function () {
    await this.countryProfilePage.verifyFiltersOpenByDefault(this.newPage,this.world);
});  
Then('verify adding keyword {string} in filters', async function (keyword) {
  await this.countryProfilePage.verifyAddKeywordFilter(this.newPage,keyword,this.world);
});
Then('verify Date Range dropdown', async function () {
  await this.countryProfilePage.verifyDateRangeFilter(this.newPage,this.world);
});
Then('Verify adding date range {string}', async function (date) {
  await this.countryProfilePage.verifyDateRangeSelection(this.newPage,date,this.world);
});
Then('Verify {string} section under filter with search of Valid keyword {string} & InValid keyword {string}', async function (opt,Validkeyword,InValidkeyword) {
  await this.countryProfilePage.verifyFilteropt(this.newPage,opt,Validkeyword,InValidkeyword,this);
});
Then('Select Topics {string} verify that applied filters are added under the applied section',async function (topic) {
    await this.countryProfilePage.verifyAppliedFilters(topic,this.newPage, this.world);
  });
  
Then('Select {string} in {string} filter verify that applied filters are added under the applied section',async function (topic,Filter) {
    await this.countryProfilePage.verifyAppliedFilters(topic,Filter,this.newPage, this.world);
  });  
Then('Verify the list of {string}', async function (type) {
  await this.countryProfilePage.verifyTopicSection(this.newPage,type,this);
});
Then('verify select all in {string} filter section', async function (type) {
  await this.countryProfilePage.verifyselectAll(this.newPage,type,this);
});
Then('Verify {string} - {string}', async function (opt,tab) {
  await this.countryProfilePage.Contact_our_expert(this.newPage,opt,tab,this);
});

Then('verify Unselect all in {string} filter section', async function (type) {
  await this.countryProfilePage.verifyUnselectAll(this.newPage,type,this);
});

Then('Click on any {string}', async function (Tab) {
  await this.countryProfilePage.Click_on_any(this.newPage,this,Tab);
});
Then('Click on any news and Close', async function () {
  await this.countryProfilePage.Click_on_any_news_and_close(this.newPage,this);
});
Then('Click on {string}', async function (str) {
  await this.countryProfilePage.Click_on_str(str,this.newPage,this);
});
Then('Click on {string} and close', async function (str) {
  await this.countryProfilePage.Click_on_str_And_Close(str,this.newPage,this);
});
Then('Ask any question {string} and check the response', async function (question) {
  await this.countryProfilePage.Askquestion(question,this.newPage,this);
});
Then('Click on {string} for number {string} from summarization', async function (clickon,refNum) {
  await this.countryProfilePage.Verify_Highlighted_Words(clickon,refNum,this.newPage,this);
});
Then('Hover on reference number {string} from summarization', async function (refNum) {
  await this.countryProfilePage.HoverOnReferenceNumber(refNum,this.newPage,this);
});
Then('Click on Select All and Verify the option - {string}', async function (option) {
  await this.countryProfilePage.verifySelectAllOption(this.newPage, this, option);
});

