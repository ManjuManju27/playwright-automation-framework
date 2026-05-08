const report = require('multiple-cucumber-html-reporter');
const fs = require('fs');
const os = require('os');
const path = require('path');

// ===== PATHS =====
const jsonReportFile = path.join(__dirname, 'reports', 'cucumber_report.json');
const outputDir = path.join(__dirname, 'reports', 'extent');
const envFilePath = path.join(__dirname, 'config', 'env.json');

// ===== VALIDATION =====
if (!fs.existsSync(jsonReportFile)) {
  console.error('❌ cucumber_report.json not found at:', jsonReportFile);
  process.exit(1);
}

// ===== CLEAN OLD REPORT (VERY IMPORTANT) =====
if (fs.existsSync(outputDir)) {
  fs.rmSync(outputDir, { recursive: true, force: true });
  console.log("🧹 Old extent report cleaned");
}

// ===== LOAD EXECUTION TIME =====
let timeData = {};
try {
  timeData = JSON.parse(
    fs.readFileSync(path.join(__dirname, 'execution_time.json'), 'utf8')
  );
} catch {
  timeData = {};
}

// ===== LOAD ENV CONFIG =====
let envConfig = {};
try {
  const allEnv = JSON.parse(fs.readFileSync(envFilePath, 'utf8'));
  const envName = process.env.TEST_ENV || 'staging';
  envConfig = allEnv[envName] || {};
} catch {
  envConfig = {};
}

// ===== CALCULATE RESULTS =====
let totals = { passed: 0, failed: 0, total: 0 };

try {
  const jsonData = JSON.parse(fs.readFileSync(jsonReportFile, 'utf8'));

  jsonData.forEach(feature => {
    feature.elements?.forEach(scenario => {
      const isFailed = scenario.steps.some(
        step => step.result && step.result.status === 'failed'
      );

      if (isFailed) totals.failed++;
      else totals.passed++;
    });
  });

  totals.total = totals.passed + totals.failed;

} catch (err) {
  console.error("❌ Error reading JSON:", err);
}

// ===== PERCENTAGE =====
const passRate =
  totals.total > 0 ? `${Math.round((totals.passed / totals.total) * 100)}%` : '0%';

const failRate =
  totals.total > 0 ? `${Math.round((totals.failed / totals.total) * 100)}%` : '0%';

// ===== GENERATE REPORT =====
report.generate({
  jsonFile: jsonReportFile,   // ✅ ONLY CURRENT RUN (IMPORTANT)

  reportPath: outputDir,
  reportName: 'CDMNext Execution Reports',
  pageTitle: 'CDMNext Execution Reports',

  displayDuration: true,
  durationInMS: false,
  openReportInBrowser: false,

  metadata: {
    browser: {
      name: envConfig.browser || 'chromium',
      version: 'N/A'
    },
    device: os.hostname(),
    platform: {
      name: os.type(),
      version: os.release()
    }
  },

  customData: {
    title: 'Execution Summary',
    data: [
      { label: 'Application', value: 'CDMNext' },
      {
        label: 'Environment',
        value: envConfig.baseUrl || 'https://stage.ceicdata.com'
      },
      { label: 'Execution Start Time', value: timeData.startDisplay || 'N/A' },
      { label: 'Execution End Time', value: timeData.endDisplay || 'N/A' },
      { label: 'Total Duration', value: timeData.duration || 'N/A' },

      { label: 'Total Scenarios', value: String(totals.total) },
      { label: 'Passed', value: String(totals.passed) },
      { label: 'Failed', value: String(totals.failed) },

      { label: 'Pass Rate', value: passRate },
      { label: 'Fail Rate', value: failRate },

      { label: 'Executed By', value: os.userInfo().username }
    ]
  }
});

console.log('🎉 Extent-style report generated successfully!');
console.log('📂 Location:', outputDir);