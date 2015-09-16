{expect} = require 'chai'
module.exports = ->

  abank =
    url: 'http://www.airbank.cz'

  describe "Create new client", ->

    it "When open home page #{abank.url}", (done) ->
      client.url abank.url, done

    it "And wait for document ready state", (done) ->
      client.waitForDocumentReadyState client, done

    it "Then title is I banku můžete mít rádi | Air Bank", (done) ->
      client.getTitle().then (title) ->
        expectTitle = 'I banku můžete mít rádi | Air Bank'
        expect(expectTitle).to.eql title
        return done()

    describe 'Menu current account', ->

      it 'When click on Current account button', (done) ->
        client.click "//a[@href='/cs/bezny-ucet/proc-bezny-ucet/']", done

      it "And wait for document ready state", (done) ->
        expectTitle = 'Proč náš běžný účet? | Air Bank'
        client.waitForExist "//title[contains(text(),'#{expectTitle}')]", 10000, done

module.exports.tags = [
  'banka'
]