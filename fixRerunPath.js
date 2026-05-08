const fs = require('fs');

const file = 'rerun.txt';

if (fs.existsSync(file)) {
  let content = fs.readFileSync(file, 'utf8');

  // Replace \ with /
  content = content.replace(/\\/g, '/');

  fs.writeFileSync(file, content);

  console.log("✅ rerun.txt path fixed");
}