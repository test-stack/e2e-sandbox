capabilities = (global) ->
  global.desiredCapabilities['browserName'] = 'chrome'
  global.desiredCapabilities['chromeOptions'] =
    args: [
      'start-maximized'
      'window-size=1280,800'
    ]
  global['host'] = '185.8.237.124'
  global


module.exports = capabilities
