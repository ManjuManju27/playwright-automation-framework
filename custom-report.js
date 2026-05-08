const fs = require('fs');

const data = JSON.parse(fs.readFileSync('reports/cucumber_report.json', 'utf8'));

let total = 0, passed = 0, failed = 0;
let summaryRows = '';
let detailedRows = '';
let stepIndex = 1;

data.forEach(feature => {
  feature.elements.forEach(scenario => {
    total++;
    let status = 'PASS';

    scenario.steps.forEach(step => {
      if (step.result.status === 'failed') status = 'FAIL';
    });

    if (status === 'PASS') passed++; else failed++;

    summaryRows += `
<tr>
<td>${total}</td>
<td>AdvanceSearch</td>
<td>${scenario.name}</td>
<td>${new Date().toLocaleString()}</td>
<td class="${status}">${status}</td>
<td><a href="#details">Link</a></td>
</tr>`;

    // Scenario header
    detailedRows += `
<tr class="scenario">
<td colspan="7">${scenario.name}</td>
</tr>`;

    scenario.steps.forEach(step => {
      const st = step.result.status.toUpperCase();

      detailedRows += `
<tr>
<td>${stepIndex++}</td>
<td>${step.name || ''}</td>
<td>User should complete step</td>
<td>${st}</td>
<td>${new Date().toLocaleString()}</td>
<td class="${st}">${st}</td>
<td>N/A</td>
</tr>`;
    });
  });
});

const html = `
<html>
<head>
<title>CNA Automation Test Report</title>
<style>
body {
  font-family: Arial;
  background: #f3eef7;
}
h1 {
  text-align: center;
  color: #5a2d82;
}
.section-title {
  background: #5a2d82;
  color: white;
  padding: 5px;
  margin-top: 20px;
}
table {
  width: 100%;
  border-collapse: collapse;
}
th {
  background: #5a2d82;
  color: white;
  padding: 6px;
}
td {
  padding: 6px;
  background: #eae2f3;
}
.scenario td {
  background: #d6c6ea;
  font-weight: bold;
  text-align: center;
}
.PASS { color: green; font-weight: bold; }
.FAIL { color: red; font-weight: bold; }
</style>
</head>

<body>

<h1>CNA Automation Test Report</h1>

<div class="section-title">Summary Report</div>
<table>
<tr>
<th>SL.No</th>
<th>Module</th>
<th>Scenario Description</th>
<th>TimeStamp</th>
<th>Status</th>
<th>Link</th>
</tr>
${summaryRows}
</table>

<div class="section-title" id="details">Detailed Report</div>
<table>
<tr>
<th>SL.No</th>
<th>Test Step</th>
<th>Expected Result</th>
<th>Actual Result</th>
<th>TimeStamp</th>
<th>Status</th>
<th>Screenshot</th>
</tr>
${detailedRows}
</table>

</body>
</html>
`;

fs.writeFileSync('reports/CNA_Report.html', html);

console.log("✅ CNA Styled Report Generated");