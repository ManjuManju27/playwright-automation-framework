const homepagelocators = require('../locators/HomePageLocators.json');
const countryprofilrlocators = require('../locators/CountryProfileLocators.json');


class LoginPage {
  constructor(page) {
    this.page = page;
    
    this.errorMessage = '[class="alert alert-danger"]';
    this.dashboard = '//button[contains(@class, "MuiButtonBase")][1]';
    this.signOut = 'text=Sign Out';
    this.registerButton = 'text=Register';
    this.changePassword = 'text=Change password';
    this.passworderrorMessage = '#password-error';
    this.usererrorMessage ='#email-error';
  }

  async enterUsername(username) {
    await this.page.fill(homepagelocators.usernameField, username);
  }

  async enterPassword(password) {
    await this.page.fill(homepagelocators.passwordField, password);
  }

  async clickLogin() {
    await this.page.click(homepagelocators.loginButton);
  }

  async getErrorMessage() {
    return await this.page.textContent(homepagelocators.errorMessage);
  }

async getErrorMessages() {
  const userErrMsg = await this.page.textContent(homepagelocators.usererrorMessage).catch(() => '');
  const passwordErrMsg = await this.page.textContent(homepagelocators.passworderrorMessage).catch(() => '');
  return { userErrMsg, passwordErrMsg };
}

  async isPasswordMasked() {
    const type = await this.page.getAttribute(homepagelocators.passwordField, 'type');
    return type === 'password';
  }

  async canCopyPassword() {
    return await this.page.evaluate((selector) => {
      const field = document.querySelector(selector);
      const selection = window.getSelection();
      const range = document.createRange();
      range.selectNodeContents(field);
      selection.removeAllRanges();
      selection.addRange(range);
      return document.execCommand('copy'); // returns true if copied
    }, homepagelocators.passwordField);
  }
  
  async isDashboardVisible() {
    await this.page.waitForLoadState('networkidle'); // wait until network is idle
  const locator = this.page.locator(countryprofilrlocators.mainmenu);
  try {
    await locator.waitFor({ state: 'visible', timeout: 10000 });
    return true;
  } catch {
    return false;
  }
    
  }

  async isLoginPageVisible() {
    return await this.page.locator(this.loginButton).isVisible();
  }

  async isRegisterButtonVisible() {
    return await this.page.locator(this.registerButton).isVisible();
  }

  async isChangePasswordVisible() {
    return await this.page.locator(this.changePassword).isVisible();
  }

  async signOut() {
    await this.page.click(this.signOut);
  }
   async copyPassword() {
     const passwordLocator =  await this.page.locator(homepagelocators.passwordField);
      await passwordLocator.focus();
      await passwordLocator.press('Control+A');
      await passwordLocator.press('Control+C'); 
      return await this.page.evaluate(() => navigator.clipboard.readText().catch(() => ''));
  }
  async logout() {
    console.log('Logging out...');
    await this.page.click(homepagelocators.settings_button);
    await this.page.waitForSelector(homepagelocators.Logout_button, { state: 'visible', timeout: 10000 });
    await this.page.click(homepagelocators.Logout_button);
    // await this.page.waitForSelector(homepagelocators.loginButton, { timeout: 20000 });
    console.log('Logout successful!');
  }
}



module.exports = { LoginPage };
