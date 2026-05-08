const reporter = require('cucumber-html-reporter');
const { execSync } = require('child_process');
const os = require('os');
const fs = require('fs');
const path = require('path');

console.log("🚀 REPORTER STARTED");

// ✅ Timestamp
const runTimestamp = new Date()
  .toLocaleString('en-IN', { timeZone: 'Asia/Kolkata', hour12: false })
  .replace(/[/:, -]/g, '_');

// ✅ Report directory
const reportDir = path.join(__dirname, 'reports', `CDMNext_REPORT_${runTimestamp}`);

if (!fs.existsSync(reportDir)) {
  fs.mkdirSync(reportDir, { recursive: true });
}

// ✅ Main JSON report
const runJson = path.join(__dirname, 'reports', 'cucumber_report.json');

// ❌ Stop if JSON missing
if (!fs.existsSync(runJson)) {
  console.error('❌ cucumber_report.json not found');
  process.exit(1);
}

// ✅ Copy JSON to report folder
const reportJsonCopy = path.join(reportDir, 'cucumber_report.json');
fs.copyFileSync(runJson, reportJsonCopy);

// ✅ Calculate results (fixed logic)
let results = { passed: 0, failed: 0 };

try {
  const jsonData = JSON.parse(fs.readFileSync(runJson, 'utf8'));

  jsonData.forEach(feature => {
    (feature.elements || []).forEach(scenario => {

      // Ignore hooks
      const steps = (scenario.steps || []).filter(step => !step.hidden);

      if (steps.length === 0) return;

      const isFailed = steps.some(step => step.result?.status === "failed");

      if (isFailed) results.failed++;
      else results.passed++;
    });
  });

  results.total = results.passed + results.failed;

  console.log("✅ Scenario Summary:", results);

} catch (err) {
  console.error("❌ Error parsing JSON:", err);
}

// ✅ System info
const systemInfo = {
  OS: `${os.type()} ${os.release()}`,
  'Node.js Version': process.version,
  'Playwright Version': execSync('npx playwright --version').toString().trim()
};

// ✅ REPORT OPTIONS (UPDATED UI)
const options = {
  theme: 'hierarchy',   // 🔥 MODERN UI

  jsonFile: reportJsonCopy,
  output: path.join(reportDir, 'cucumber_report.html'),

  reportSuiteAsScenarios: true,
  scenarioTimestamp: true,
  storeScreenshots: true,
  launchReport: false,

  metadata: {
    "Project": "CDMNext Automation",
    "Environment": process.env.TEST_ENV || 'staging',
    "Browser": "Chromium",
    "OS": systemInfo.OS,
    "Execution Time": new Date().toLocaleString(),
    "Total": results.total || 0,
    "Passed": results.passed || 0,
    "Failed": results.failed || 0
  },

  customData: {
    title: 'Execution Summary',
    data: [
      { label: 'Project', value: 'CDMNext Automation' },
      { label: 'Release', value: '1.0' },
      { label: 'Cycle', value: 'Regression' }
    ]
  }
};

// ✅ Generate HTML report
reporter.generate(options);

console.log("🎉 HTML REPORT GENERATED SUCCESSFULLY");
console.log("📂 Report Location:", path.join(reportDir, 'cucumber_report.html'));