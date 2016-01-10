module.exports = ->

  homepage.open 'http://www.airbank.cz', 'I banku můžete mít rádi | Air Bank'

  describe 'Menu current account', ->

    it 'When click on Current account button', (done) ->
      client.click "//a[@href='/cs/bezny-ucet/proc-bezny-ucet/']", done

    it "And wait for document ready state", (done) ->
      expectTitle = 'Proč náš běžný účet? | Air Bank'
      client.waitForExist "//title[contains(text(),'#{expectTitle}')]", 10000, done