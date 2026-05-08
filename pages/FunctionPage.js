const FunctionLocators = require('../locators/FunctionsLocators.json');

class FunctionMethods {

    constructor(page){
        this.page = page;
    }

    async createInsightAndOpenFunction(seriesId){

        // Click search input
        await this.page.locator(FunctionLocators.searchInput).click();

        // Enter Series ID
        await this.page.locator(FunctionLocators.searchInput).fill(seriesId);

        console.log("Searching for Series ID :", seriesId);

        // Press Enter
        await this.page.keyboard.press('Enter');

        // Select first series
        await this.page.locator(FunctionLocators.seriesCheckbox).click();

        // Hover series name
        const series = this.page.locator(FunctionLocators.seriesName);
        await series.hover();

        // Add to data selection
        await this.page.locator(FunctionLocators.addToDataSelectionIcon).click();

        // Get insight title
        const name = await this.page.locator(FunctionLocators.insightTitle).textContent();
        console.log("Insight Title:", name);

        // Select series
        await this.page.locator(FunctionLocators.dataSelectionCheckbox).click();

        // Open function editor
        console.log("Open Function Editor");
        await this.page.locator(FunctionLocators.functionEditorIcon).click();
    }

    async uncheckTheReplaceSelectedSeries(){
        const checkbox = this.page.locator(FunctionLocators.replaceSelectedCheckbox);

        const count = await checkbox.count();
    
        if (count === 1) {
            await this.page.locator(FunctionLocators.checkbox).click();
            console.log("Uncheck the Replace Selected Series ");
        }
    }




}

module.exports = FunctionMethods ;