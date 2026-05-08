const common = `
  --require setup/assertions.js
  --require setup/hooks.js
  --require step-definitions/**/*.js
  --format json:reports/cucumber_report.json
`;

module.exports = {
  default: `${common}`
};
