const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const mainJsonPath = path.join('reports', 'cucumber_report.json');
const rerunJsonPath = path.join('reports', 'cucumber_rerun.json');

console.log("🔁 Checking for failed scenarios...");

// ❌ Stop if no report
if (!fs.existsSync(mainJsonPath)) {
  console.log("❌ No cucumber_report.json → tests didn’t run");
  process.exit(1);
}

// 📄 Read report
const original = JSON.parse(fs.readFileSync(mainJsonPath, 'utf-8'));

// 🔍 Collect FAILED scenario names
const failedScenarios = [];

original.forEach(feature => {
  feature.elements?.forEach(scenario => {
    const failed = scenario.steps.some(s => s.result?.status === 'failed');
    if (failed) {
      failedScenarios.push(scenario.name);
    }
  });
});

// ❌ No failures
if (failedScenarios.length === 0) {
  console.log("✅ No failed scenarios");
  execSync(`node reporter.js`, { stdio: 'inherit' });
  process.exit(0);
}

console.log("🔁 Rerunning FAILED SCENARIOS:");
failedScenarios.forEach(s => console.log(" -", s));

// 🔥 SAFE PATTERN (only scenario ID)
const safePattern = failedScenarios
  .map(name => name.split(':')[0]) // TC_function_475
  .join('|');

console.log("🎯 Using pattern:", safePattern);

// 🚀 RERUN USING NAME
try {
  execSync(
    `npx cucumber-js features \
    --require step-definitions/**/*.js \
    --require setup/**/*.js \
    --name "${safePattern}" \
    --format progress \
    --format json:${rerunJsonPath}`,
    { stdio: 'inherit' }
  );
} catch (e) {
  console.log("⚠️ Rerun also has failures");
}

// 🔗 MERGE RESULTS
if (fs.existsSync(rerunJsonPath)) {
  const rerun = JSON.parse(fs.readFileSync(rerunJsonPath, 'utf-8'));

  const rerunMap = new Map();

  rerun.forEach(feature => {
    (feature.elements || []).forEach(scenario => {
      rerunMap.set(scenario.name, scenario);
    });
  });

  original.forEach(feature => {
    feature.elements?.forEach((scenario, i) => {
      if (rerunMap.has(scenario.name)) {
        feature.elements[i] = rerunMap.get(scenario.name);
      }
    });
  });

  fs.writeFileSync(mainJsonPath, JSON.stringify(original, null, 2));
  console.log("📄 Merged rerun results");
}

// 📊 FINAL REPORT
execSync(`node reporter.js`, { stdio: 'inherit' });

console.log("✅ Rerun completed & report generated");