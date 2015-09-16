path = require 'path'

capabilities = require path.resolve __dirname + '../../node_modules/test-stack-harness/capabilities/global'
capabilities.desiredCapabilities['browserName'] = 'chrome'
capabilities.desiredCapabilities['chromeOptions'] =
  args: [
    'start-maximized'
    'window-size=1280,800'
  ]
capabilities['host'] = '185.8.237.124'


module.exports = capabilities