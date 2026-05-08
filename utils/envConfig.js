const envConfig = require('../config/env.json');

// read environment from terminal command or default to staging
const environment = process.env.TEST_ENV || 'production';

module.exports = envConfig[environment];
