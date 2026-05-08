const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const config = require('../utils/envConfig');
const { LoginPage } = require('../pages/loginPage');
const homepagelocators = require('../locators/HomePageLocators.json');

// Launch application
Given('Launch the REDD application login page', async function () {
//   await this.page.goto(process.env.BASE_URL || 'https://stage.ceicdata.com');
  await this.page.goto(config.baseUrl);
  await this.page.waitForLoadState('networkidle');
  console.log(`Launched REDD Login Page: ${config.baseUrl}`);
});
Given('User is logged in successfully', async function () {
   await this.loginPage.enterUsername(config.username);
   await this.loginPage.enterPassword(config.password);
   await this.loginPage.clickLogin();
});
// --- Login scenarios ---
When('Enter valid username and password', async function () {
   await this.loginPage.enterUsername(config.username);
   await this.loginPage.enterPassword(config.password);
});
When('Enter password in the password field', async function () {
  await this.loginPage.enterPassword(config.password);
  console.log(`Entered password in password field`);
});
When('Enter invalid username and valid password', async function () {
  await this.loginPage.enterUsername("red3@test.com");
   await this.loginPage.enterPassword(config.password);
});

When('Enter valid username and invalid password', async function () {
  await this.loginPage.enterUsername(config.username);
   await this.loginPage.enterPassword("red123456");
});

When('Enter invalid username and invalid password', async function () {
  await this.loginPage.enterUsername('invalidUser');
  await this.loginPage.enterPassword('invalidPass');
});

When('Enter valid password only', async function () {
  await this.loginPage.enterPassword(config.password);
});
When('Enter valid password', async function () {
  await this.loginPage.enterPassword(config.password);
});

When('Click on Login button', async function () {
  await this.loginPage.clickLogin();
});

When('Click on Login button without entering credentials', async function () {
  await this.loginPage.clickLogin();
});

When('Enter valid username with space at the end', async function () {
  await this.loginPage.enterUsername(config.username+" ");
});

When('Enter valid username with space in the front', async function () {
  await this.loginPage.enterUsername(" "+config.username);
});
When('Enter valid username', async function () {
  await this.loginPage.enterUsername(config.username);
});

When('Enter valid password with space at the end', async function () {
  await this.loginPage.enterPassword(config.password+" ");
});

When('Enter valid password with space in the front', async function () {
  await this.loginPage.enterPassword(" "+config.password);
});




Then('User should not be able to copy the password', async function () {
  const type = await this.page.getAttribute(homepagelocators.passwordField, 'type');

  expect(type).toBe('password');

});





// --- Verification steps ---
Then('User should be able to login successfully', async function () {
  const dashboardVisible = await this.loginPage.isDashboardVisible();
  expect(dashboardVisible).toBeTruthy();
  await this.loginPage.logout();

});

Then('Click on Log Out and User should be logged out successfully', async function () {
  
  await this.loginPage.logout();

});

Then('Error message {string} should be displayed', async function (expectedMsg) {
  const actualMsg = await this.loginPage.getErrorMessage();
  expect(actualMsg.trim()).toBe(expectedMsg.trim());
});
Then('Error message {string} should be displayed.', async function (expectedMsg) {
  const { userErrMsg } = await this.loginPage.getErrorMessages();
  
  expect(userErrMsg.trim()).toBe(expectedMsg.trim());
  
});

Then('Password should be masked as asterisks', async function () {
  const isMasked = await this.loginPage.isPasswordMasked();
  expect(isMasked).toBeTruthy();
});



Then('User should be logged out successfully', async function () {
  const loginPageVisible = await this.loginPage.isLoginPageVisible();
  expect(loginPageVisible).toBeTruthy();
});

Then('Register button should not be visible', async function () {
  const visible = await this.loginPage.isRegisterButtonVisible();
  expect(visible).toBeFalsy();
});

Then('Change password option should not be visible', async function () {
  const visible = await this.loginPage.isChangePasswordVisible();
  expect(visible).toBeFalsy();
});

Then('Error message {string} and {string} should be displayed', async function (expectedUserMsg, expectedPasswordMsg) {
  const { userErrMsg, passwordErrMsg } = await this.loginPage.getErrorMessages();
  
  expect(userErrMsg.trim()).toBe(expectedUserMsg.trim());
  expect(passwordErrMsg.trim()).toBe(expectedPasswordMsg.trim());
});

