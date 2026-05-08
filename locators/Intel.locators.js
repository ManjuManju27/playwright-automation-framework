export const IntelLocators = {

  intelBtnIcon: (page) => page.locator(`#Markets_fill`),

  intelPageVerificationFeild: (page) => page.locator(`//p[normalize-space()='Intel']`),
  
  watchlists: (page) =>
    page.getByRole('dialog').locator('[role="button"]'),

  addToAlertsBtn: (page) =>
    page.getByRole('button', { name: 'Add to alerts' }),

  popupCloseBtn: (page) =>
    page.getByRole('dialog').locator('button').first(),
  
  alertsPopup: (page) => page.getByText('Add an alert for'), // update selector
   emailslider: (page) => page.locator(`//div[.//p[text()='Email']]//input[@type='checkbox' and contains(@class,'PrivateSwitchBase-input')]`), // update selector

  alertButton: (page) => page.getByRole('button', { name: 'Add an Alert' }), // update selector
  cancelButton: (page) => page.getByRole('button', { name: 'Cancel' })
}