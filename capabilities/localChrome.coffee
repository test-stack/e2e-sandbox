capabilities = (global) ->
  global.desiredCapabilities['browserName'] = 'chrome'
  global.desiredCapabilities['chromeOptions'] =
    args: [
      'start-maximized'
      'window-size=1280,800'
    ]
  global['host'] = 'localhost'
  global


module.exports = capabilities
