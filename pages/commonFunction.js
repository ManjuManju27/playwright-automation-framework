

/**
 * Clicks an element and waits for it to be clickable.
 * @param {import('@playwright/test').Page} page - Playwright Page object
 * @param {string} selector - The selector of the element to click
 */
export async function clickElement(page, selector) {
  const element = page.locator(selector);
  await element.waitFor({ state: 'visible' });
  await element.click();
  console.log(`Clicked element: ${selector}`);
}

/**
 * Verifies that a dropdown contains the expected options.
 * @param {import('@playwright/test').Page} page - Playwright Page object
 * @param {string} selector - The dropdown (select) element selector
 * @param {string[]} expectedOptions - List of expected option texts
 */
export async function verifyDropdownOptions(page, selector, expectedOptions) {
  const options = await page.locator(`${selector} option`).allTextContents();
  for (const expected of expectedOptions) {
    if (!options.includes(expected)) {
      throw new Error(`❌ Option "${expected}" not found in dropdown`);
    }
  }
  console.log(`Verified dropdown options for: ${selector}`);
}

/**
 * Selects an option in a dropdown by visible text or value.
 * @param {import('@playwright/test').Page} page - Playwright Page object
 * @param {string} selector - The dropdown selector
 * @param {string} valueOrLabel - The visible text or value to select
 */
export async function selectDropdownOption(page, selector, valueOrLabel) {
  const dropdown = page.locator(selector);
  await dropdown.waitFor({ state: 'visible' });
  await dropdown.selectOption({ label: valueOrLabel }).catch(async () => {
    // fallback: try selecting by value if label doesn’t match
    await dropdown.selectOption({ value: valueOrLabel });
  });
  console.log(`Selected "${valueOrLabel}" in dropdown: ${selector}`);
}



