const { execSync } = require('child_process');
const fs = require('fs');

// Read CLI args
const args = process.argv.slice(2);

let tag = null;

args.forEach(arg => {
  if (arg.startsWith('--tags=')) {
    tag = arg.split('=')[1];
  }
});

console.log("🚀 Execution Config:");
console.log("Tag:", tag || "ALL");

console.log(`🚀 Execution Start: ${new Date().toLocaleString()}`);

// Ensure reports folder exists
if (!fs.existsSync('reports')) {
  fs.mkdirSync('reports', { recursive: true });
}

// Clean old files
if (fs.existsSync('rerun.txt')) fs.unlinkSync('rerun.txt');
if (fs.existsSync('reports/cucumber_report.json')) fs.unlinkSync('reports/cucumber_report.json');
if (fs.existsSync('reports/cucumber_rerun.json')) fs.unlinkSync('reports/cucumber_rerun.json');

console.log("🧹 Old files cleaned");

// MAIN EXECUTION
let cmd = `npx @cucumber/cucumber`;

cmd += ` features`;
cmd += ` --require step-definitions/**/*.js`;
cmd += ` --require setup/**/*.js`;
cmd += ` --format progress`;
cmd += ` --format summary`;
cmd += ` --format json:reports/cucumber_report.json`;
cmd += ` --format rerun:rerun.txt`;

if (tag) {
  cmd += ` --tags "${tag}"`;
}

console.log("\n🚀 Running command:");
console.log(cmd);

try {
  execSync(cmd, { stdio: 'inherit' });
} catch (e) {
  console.log("⚠️ Test execution finished with failures");
}

// Debug rerun
if (fs.existsSync('rerun.txt')) {
  const rerunData = fs.readFileSync('rerun.txt', 'utf-8').trim();

  console.log("\n📄 rerun.txt:");
  console.log(rerunData);

  if (rerunData.length > 0) {
    console.log("\n🔁 Running failed scenarios...");
    try {
      execSync(`node rerun-failed.js`, { stdio: 'inherit' });
    } catch (e) {
      console.log("⚠️ Rerun execution failed");
    }
  } else {
    console.log("✅ No failed scenarios to rerun");
  }

} else {
  console.log("❌ rerun.txt not generated");
}

// Generate Custom Report
try {
  console.log("\n📊 Generating Custom HTML Report...\n");
  execSync(`node custom-report.js`, { stdio: 'inherit' });
} catch (e) {
  console.log("❌ Custom report generation failed");
}

console.log(`⏱ Execution End: ${new Date().toLocaleString()}`);