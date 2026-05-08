

//customize-report.js

const fs = require('fs');
// const path = './reports/cucumber_report.html';
const path = process.env.REPORT_HTML_PATH || './reports/cucumber_report.html';
const jsonPath = './reports/cucumber_report.json';


let results = { passed: 0, failed: 0, total: 0 };

try {
  const jsonData = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));

  jsonData.forEach(feature => {
    feature.elements?.forEach(scenario => {
      const status = scenario.steps.every(step => step.result?.status === "passed")
        ? "passed"
        : "failed";

      if (status === "passed") results.passed++;
      else results.failed++;
    });
  });

  results.total = results.passed + results.failed;

  console.log("Scenario Summary:", results);

} catch (err) {
  console.error(" Unable to read cucumber_report.json");
}


// ---- 2. SCENARIO TIMINGS ----
let scenarioTimes = [];

try {
  const jsonData = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));

  jsonData.forEach(feature => {
    feature.elements?.forEach(scenario => {
      let durationNs = 0;

      scenario.steps.forEach(step => {
        if (step.result?.duration) durationNs += step.result.duration;
      });

      const seconds = Math.round(durationNs / 1_000_000_000);

      scenarioTimes.push({
        name: scenario.name,
        duration: `${seconds}s`
      });
    });
  });

  console.log("Scenario Timings:", scenarioTimes);

} catch (err) {
  console.error("Unable to read scenario durations");
}



// ---- 3. FINAL HTML CUSTOMIZATION ----
function customizeReport() {
  if (!fs.existsSync(path)) {
    console.error(" Report file not found:", path);
    return;
  }

  let html = fs.readFileSync(path, "utf8");

  // ---- Inject Pass/Fail Summary Box ----

const summaryBox = `
<div style="
    display: inline-block;
    padding: 8px 12px;
    margin: 10px 0 10px 3cm;  /* top 10px, right 0, bottom 10px, left 2.5cm */
    border-radius: 6px;
    background: #f9f9f9;
    border: 1px solid #ccc;
    font-size: 13px;
    line-height: 1.4;
">
  <strong>Total Scenarios:</strong> ${results.total} &nbsp;&nbsp;
  <span style="color:green;"><strong>Passed:</strong> ${results.passed}</span> &nbsp;&nbsp;
  <span style="color:red;"><strong>Failed:</strong> ${results.failed}</span>
</div>
`;

// Insert summary AFTER <body> tag (works 100% always)
html = html.replace(
  /<\/body>/i,
  `${summaryBox}\n</body>`
);
scenarioTimes.forEach(s => {
  // Escape special regex characters in scenario name
  const nameEscaped = s.name.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  
  // Match scenario title in <h4> or <a> depending on report version
  const regex = new RegExp(`(${nameEscaped})`, 'g');
  
  html = html.replace(
    regex,
    `$1 <span style="color:#888; font-size:12px;">(${s.duration})</span>`
  );
});
  // ---- Branding Changes ----
  html = html.replace(
    /(<div class="project-name[^>]*>)(.*?)(<\/div>)/i,
    "$1REDD APPLICATION$3"
  );

  html = html.replace(
    /(<b>)(\s*Metadata\s*)(<\/b>)/i,
    "$1Application Data$3"
  );

  html = html.replace(
    /(<a class="navbar-brand">)(.*?)(<\/a>)/i,
    "$1Report$3"
  );

  // // ---- Comment out default feature summary labels & generated time & feature piechart (do not delete) ----
  // // Comment top-right "Passed/Failed Features" labels in navbar
  // html = html.replace(
  //   /(<div class="label-container">\s*<span class="label label-success"[\s\S]*?<\/div>\s*<\/div>\s*<\/div>)/i,
  //   '<!-- $1 -->'
  // );

  // // Comment "Generated on ..." text
  // html = html.replace(
  //   /(<div class="generated-on">[\s\S]*?<\/div>\s*)/i,
  //   '<!-- $1 -->'
  // );

  // // // Comment left-side Features pie chart (keep Scenarios chart)
  // // html = html.replace(
  // //   /(<div class="chart col-lg-6 col-md-6" id="piechart_features"><\/div>\s*)/i,
  // //   '<!-- $1 -->'
  // // );

  // ---- Write final HTML once ----
  fs.writeFileSync(path, html, "utf8");

  console.log("Report HTML updated successfully!");
}

customizeReport();

