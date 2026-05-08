const { Given, When, Then, defineStep } = require('@cucumber/cucumber');
const { expect }  = require('@playwright/test');
const path = require('path');
const fs = require('fs');
const os = require('os');
const XLSX = require('xlsx');
const assert = require('assert');
const axios = require('axios');
const FunctionMethods = require('../pages/FunctionPage.js');
const SmokeTestLocators  = require('../locators/SmokeTestLocators.json');

// Step: Create insight → search series → add series → open function editor
Given('Create insight and add series {string} >open function popup', async function (seriesId) {
    const functionPage = new FunctionMethods(this.page);    
    await functionPage.createInsightAndOpenFunction(seriesId);
});

// TC_01
// Step: Search function → select function option → clean previous function → insert function
Given('Applying {string} {string} function', async function (functionName, functionOption) {

    // Search function
    const searchBox = this.page.locator(SmokeTestLocators.functionSearchBox);
    await searchBox.fill(functionName);

    // Select function option dynamically
    const functionLocator = SmokeTestLocators.functionOption.replace("FUNCTION_OPTION", functionOption);
    await this.page.locator(functionLocator).click();

    // Hover search area
    await this.page.locator(SmokeTestLocators.searchArea).hover();

    // Click Clean button
    await this.page.locator(SmokeTestLocators.cleanButton).click();

    // Click Insert Function
    const insertFunction = this.page.locator(SmokeTestLocators.insertFunction);
    await insertFunction.click();

});
//TC_02
Given('Apply function {string} {string} by applying {string}', async function (functionName, functype, argument) {

    // Search function
    const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
    await searchBox.fill(functionName);

      // Select the function from list
      await this.page.locator(`//div[@title="${functype}"]`).click();
     // Open argument dropdown
    await this.page.locator("//b[@role='presentation']").click();

    // Select argument
    // Select argument dynamically
    await this.page.getByRole('option', { name: argument }).click();

    // Scroll and click Insert Function
    const insertFunction = this.page.locator("text=Insert function");
    // await insertFunction.scrollIntoViewIfNeeded();
    await insertFunction.click();


});
//TC_03
Given('Apply fuction {string},{string} input ValueIn {string}', async function (functionName, functype, value) {       
   // Search function
   const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
   await searchBox.fill(functionName);

     // Select the function from list
     await this.page.locator(`//div[@title="${functype}"]`).click();
    // Open argument dropdown

   const Value = this.page.locator("//input[@class='function-parameter--input']");

   await Value.click();
   await this.page.keyboard.press('Control+A');
   await this.page.keyboard.type(value);

   // Scroll and click Insert Function
   const insertFunction = this.page.locator("text=Insert function");
   // await insertFunction.scrollIntoViewIfNeeded();
   await insertFunction.click();
  });


  Given('Apply function-{string},{string} >{string},{string},{string}', async function (functionName, functype, frequency, endMonth, method) {
        // Search function
        const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
        await searchBox.fill(functionName);
        console.log("Function Name:", functionName);
          // Select the function from list
        
          await this.page.locator(`//div[@title="${functype}"]`).click();
          console.log("Function Type:", functype);
    
         // Open argument dropdown

        try{
        await this.page.locator("(//b[@role='presentation'])[1]").click();
        await this.page.getByRole('option', { name: frequency }).click();
        }catch(e){
            // await this.page.locator(`//div[@class='function-data--info function-data--highlight-info']//*[contains(text(),"${frequency}")]`).click();
        await this.page.getByRole('option', { name: 'frequency' }).click();
        }

        await this.page.locator("(//b[@role='presentation'])[2]").click();
        console.log("End Month:", endMonth);
        await this.page.getByRole('option', { name: endMonth }).click();

        await this.page.locator("(//b[@role='presentation'])[3]").click();
        console.log("End Month:", endMonth);
        
    
        // Select argument
        // Select argument dynamically
        await this.page.getByRole('option', { name: method }).click();
        console.log("Method:", method);


    
        // Scroll and click Insert Function
        const insertFunction = this.page.locator("text=Insert function");
        // await insertFunction.scrollIntoViewIfNeeded();
        await insertFunction.click();
    }

  );

  Given('Apply function-{string},{string} >{string},{string}',async function (functionName, functype, Currency, Unit) {
     // Search function
     const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
     await searchBox.fill(functionName);
     console.log("Function Name:", functionName);
       // Select the function from list
       await this.page.locator(`//div[@title="${functype}"]`).click();
       console.log("Function Type:", functype);
      // Open argument dropdown
     await this.page.locator("(//b[@role='presentation'])[1]").click();
     console.log("Currency:", Currency);
     await this.page.getByRole('option', { name: Currency }).click();


     await this.page.locator("(//b[@role='presentation'])[2]").click();
     console.log("Unit:", Unit);
     await this.page.getByRole('option', { name: Unit }).click();
  
     // Scroll and click Insert Function
     const insertFunction = this.page.locator("text=Insert function");
     // await insertFunction.scrollIntoViewIfNeeded();
     await insertFunction.click();
  });

  Given('Applying {string},{string} function', async function (functionName, functype) {
      // Search function
      const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
      await searchBox.fill(functionName);
      console.log("Function Name:", functionName);
        // Select the function from list
        await this.page.locator(`//div[@title="${functype}"]`).click();
        console.log("Function Type:", functype);
   
      // Scroll and click Insert Function
      const insertFunction = this.page.locator("text=Insert function");
      // await insertFunction.scrollIntoViewIfNeeded();
      await insertFunction.click();
  });
     
//   Given('Apply fuction {string},{string} by applying {string}',async function (functionName, functype, Period) {
//      // Search function
//      const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
//      await searchBox.fill(functionName);
//      console.log("Function Name:", functionName);
//        // Select the function from list
//        await this.page.locator(`//div[@title="${functype}"]`).click();
//        console.log("Function Type:", functype);
//       // Open argument dropdown
//      await this.page.locator("//*[contains(@class,'function-parameter--input')]").click();
//      console.log("Period:", Period);
//      await this.page.getByRole('option', { name: Period }).click();

  
//      // Scroll and click Insert Function
//      const insertFunction = this.page.locator("text=Insert function");
//      // await insertFunction.scrollIntoViewIfNeeded();
//      await insertFunction.click();
//   });

  Given('Apply fuction {string},{string} by applying {string}', async function (functionName, functype, Type) {
     // Search function
     const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
     await searchBox.fill(functionName);
     console.log("Function Name:", functionName);
       // Select the function from list
       await this.page.locator(`//div[@title="${functype}"]`).click();
       console.log("Function Type:", functype);

       await this.page.locator("(//b[@role='presentation'])[1]").click();
       console.log("Type:", Type);
       await this.page.getByRole('option', { name: Type }).click();

  
     // Scroll and click Insert Function
     const insertFunction = this.page.locator("text=Insert function");
     // await insertFunction.scrollIntoViewIfNeeded();
     await insertFunction.click();
  });

  Given('Apply fuction {string},{string} select argument {string} input ValueIn {string}',async  function (functionName, functype, Type, Period) {
     // Search function
     const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
     await searchBox.fill(functionName);
     console.log("Function Name:", functionName);
       // Select the function from list
       await this.page.locator(`//div[@title="${functype}"]`).click();
       console.log("Function Type:", functype);

       await this.page.locator("(//b[@role='presentation'])[1]").click();
       console.log("Type:", Type);
       await this.page.getByRole('option', { name: Type }).click();

       const input = await this.page.locator("//*[contains(@class,'function-parameter--input')]");
       console.log("Period:", Period);
       await input.fill(String(Period));

        // Scroll and click Insert Function
     const insertFunction = this.page.locator("text=Insert function");
     // await insertFunction.scrollIntoViewIfNeeded();
     await insertFunction.click();
  });

//   Then(
//     'Apply function {string} with {string},{string},{string}',async function (functionName, functype, frequency, End, Method) {
//     // Search function
//         const searchBox = this.page.locator("//*[contains(@class,'index-module_input')]//*");
//         await searchBox.fill(functionName);
//         console.log("Function Name:", functionName);
//           // Select the function from list
//           await this.page.locator(`//div[@title="${functype}"]`).click();
//           console.log("Function Type:", functype);
//          // Open argument dropdown
//         await this.page.locator("(//b[@role='presentation'])[1]").click();
//         console.log("Frequency:", frequency);
//         await this.page.getByRole('option', { name: frequency }).click();

//         await this.page.locator("(//b[@role='presentation'])[2]").click();
//         console.log("End Month:", End);
//         await this.page.getByRole('option', { name: End }).click();

//         await this.page.locator("(//b[@role='presentation'])[3]").click();
//         console.log("Method:", Method);
//         await this.page.getByRole('option', { name: Method }).click();
    
//         // Scroll and click Insert Function
//         const insertFunction = this.page.locator("text=Insert function");
//         // await insertFunction.scrollIntoViewIfNeeded();
//         await insertFunction.click();
//     }
//   );

Then('Verify latest download excel file with {string} testdata file', async function (string) {  
    const downloadPromise = this.page.waitForEvent('download');

    await this.page.locator(".insight-download__modal-button.button__download-btn").click();

    const download = await downloadPromise;

    const downloadsFolder = path.join(__dirname, '../downloads');

    const originalFilePath = path.join(downloadsFolder, download.suggestedFilename());

    await download.saveAs(originalFilePath);

    const renamedFilePath = path.join(downloadsFolder, `${fileName}.xlsx`);

    fs.renameSync(originalFilePath, renamedFilePath);

    // Read downloaded excel
    const downloadedWorkbook = XLSX.readFile(renamedFilePath);
    const downloadedSheet = downloadedWorkbook.Sheets[downloadedWorkbook.SheetNames[0]];

    const downloadedData = XLSX.utils.sheet_to_json(downloadedSheet, {
        header: 1,
        defval: ""
    });

    // Read expected excel
    const expectedPath = path.join(__dirname, '../testdata', `${fileName}.xlsx`);

    const expectedWorkbook = XLSX.readFile(expectedPath);
    const expectedSheet = expectedWorkbook.Sheets[expectedWorkbook.SheetNames[0]];

    const expectedData = XLSX.utils.sheet_to_json(expectedSheet, {
        header: 1,
        defval: ""
    });

    let mismatches = [];

    const maxRows = Math.max(downloadedData.length, expectedData.length);

    for (let row = 0; row < maxRows; row++) {

        const downloadedRow = downloadedData[row] || [];
        const expectedRow = expectedData[row] || [];

        const maxCols = Math.max(downloadedRow.length, expectedRow.length);

        for (let col = 0; col < maxCols; col++) {

            const actualValue = downloadedRow[col] ?? "";
            const expectedValue = expectedRow[col] ?? "";

            if (actualValue.toString().trim() !== expectedValue.toString().trim()) {

                mismatches.push({
                    expected: expectedValue,
                    actual: actualValue
                });

            }
        }
    }

    if (mismatches.length > 0) {

        let report = `
------------------------------------------------------------
Test Data Value                     | Downloaded Value
------------------------------------------------------------
`;

        mismatches.forEach(m => {

            report += `${(m.expected || "").toString().padEnd(35)} | ${m.actual || ""}\n`;

        });

        report += "------------------------------------------------------------";

        // Print in console
        console.log(report);

        // Attach to Cucumber report
        await this.attach(report, 'text/plain');

        throw new Error(`Excel validation failed. Total mismatches: ${mismatches.length}`);
    }

    const successMessage = "✅ Excel validation passed. All values matched.";

    console.log(successMessage);
    await this.attach(successMessage, 'text/plain');

    // Delete downloaded file
    if (fs.existsSync(renamedFilePath)) {
        fs.unlinkSync(renamedFilePath);
    }

  });


Then('Uncheck Replace selected series', async function () {
    const functionPage = new FunctionMethods(this.page);
    functionPage.uncheckTheReplaceSelectedSeries();
});

Given('Check Replace selected series', async function () {
    const colour = await this.page.locator(
        "(//*[text()='Replace selected series']//preceding-sibling::*//span//*[1])[1]"
      ).count();
      
      if (colour === 0) {
        await this.page.locator(
          "//*[text()='Replace selected series']//preceding-sibling::*"
        ).click();
      }
  });


Then('Click on apply function', async function () {

    // Click Apply button
    await this.page.getByRole('button', { name: 'Apply' }).click();
    console.log("Click on The Apply  ");

    // Wait until function modal closes
    await this.page.locator(".movable-modal--close").waitFor({ state: 'hidden' });

    // Select all series
    await this.page.locator("//*[@class='check-all-series']/label[contains(@class,'input-control')]").click();

    // Click download
    await this.page.locator("//*[@class='download-button--text drop-down-button--label']").click();

    // Select XLSX format
    await this.page.locator("//div[@class='icon--export icon--export__xlsx']").click();


});


    Given('Applyin time frame from {string}  to {string}', async function (startDate, endDate) {

// Click Reset if visible
const resetBtn = this.page.getByRole('button', { name: 'Reset' }).last();

if (await resetBtn.count() > 0) {
    await resetBtn.click({ force: true });
}

// // Wait for modal to stabilize
// await this.page.waitForSelector('text=Data refresh', { state: 'visible' });

await this.page.locator("//div[text()='CEIC Addin']/../../../..//div[text()='Data refresh']/../../div//*[name()='svg']").first().click();

await this.page.locator("(//div[@class='insight-download-timeframe-type'])[2]").first().click(); 

    // Fill start date directly
    // Start date
    const StartDate = this.page.locator('.input-date-start');

    await StartDate.click();
    await this.page.keyboard.press('Control+A');
    await this.page.keyboard.type(startDate);
    await this.page.keyboard.press('Enter');
    
    const EndDate = this.page.locator('.input-date-end');
    
    await EndDate.click();
    await this.page.keyboard.press('Control+A');
    await this.page.keyboard.type(endDate);
    await this.page.keyboard.press('Enter');

    console.log("Apply Time Freme " , startDate ," B/W " , endDate);

});

Given('Select below attribute', async function (dataTable) {

    // Open attribute selector
    await this.page.locator(".choosable-selected-item--small-purple").click();

    // Click Unselect all
    await this.page.locator("//div[.='Unselect all']").click();

    // Get attributes from feature file
    const attributes = dataTable.raw().flat();

    // Loop through attributes and select them
    for (const attribute of attributes) {
        await this.page.locator(`//*[text()='${attribute}']//preceding-sibling::span`).click();
        console.log("Slect Attributes " , attribute);
    }

});

Then('Verify download excel file with {string} testdata file', async function (fileName) {

    const downloadPromise = this.page.waitForEvent('download');

    await this.page.locator(".insight-download__modal-button.button__download-btn").click();

    const download = await downloadPromise;

    const downloadsFolder = path.join(__dirname, '../downloads');

    const originalFilePath = path.join(downloadsFolder, download.suggestedFilename());

    await download.saveAs(originalFilePath);

    const renamedFilePath = path.join(downloadsFolder, `${fileName}.xlsx`);

    fs.renameSync(originalFilePath, renamedFilePath);

    // Read downloaded excel
    const downloadedWorkbook = XLSX.readFile(renamedFilePath);
    const downloadedSheet = downloadedWorkbook.Sheets[downloadedWorkbook.SheetNames[0]];

    const downloadedData = XLSX.utils.sheet_to_json(downloadedSheet, {
        header: 1,
        defval: ""
    });

    // Read expected excel
    const expectedPath = path.join(__dirname, '../testdata', `${fileName}.xlsx`);

    const expectedWorkbook = XLSX.readFile(expectedPath);
    const expectedSheet = expectedWorkbook.Sheets[expectedWorkbook.SheetNames[0]];

    const expectedData = XLSX.utils.sheet_to_json(expectedSheet, {
        header: 1,
        defval: ""
    });

    let mismatches = [];

    const maxRows = Math.max(downloadedData.length, expectedData.length);

    for (let row = 0; row < maxRows; row++) {

        const downloadedRow = downloadedData[row] || [];
        const expectedRow = expectedData[row] || [];

        const maxCols = Math.max(downloadedRow.length, expectedRow.length);

        for (let col = 0; col < maxCols; col++) {

            const actualValue = downloadedRow[col] ?? "";
            const expectedValue = expectedRow[col] ?? "";

            if (actualValue.toString().trim() !== expectedValue.toString().trim()) {

                mismatches.push({
                    expected: expectedValue,
                    actual: actualValue
                });

            }
        }
    }

    if (mismatches.length > 0) {

        let report = `
------------------------------------------------------------
Test Data Value                     | Downloaded Value
------------------------------------------------------------
`;

        mismatches.forEach(m => {

            report += `${(m.expected || "").toString().padEnd(35)} | ${m.actual || ""}\n`;

        });

        report += "------------------------------------------------------------";

        // Print in console
        console.log(report);

        // Attach to Cucumber report
        await this.attach(report, 'text/plain');

        throw new Error(`Excel validation failed. Total mismatches: ${mismatches.length}`);
    }

    const successMessage = "✅ Excel validation passed. All values matched.";

    console.log(successMessage);
    await this.attach(successMessage, 'text/plain');

    // Delete downloaded file
    if (fs.existsSync(renamedFilePath)) {
        fs.unlinkSync(renamedFilePath);
    }

});

