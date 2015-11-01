{expect} = require 'chai'

abank =
  url: 'http://www.airbank.cz'

module.exports = ->

  describe "Open home page #{abank.url}", ->

    it "When open home page #{abank.url}", (done) ->
      client.url abank.url, done

    it "And wait for document ready state", (done) ->
      client.waitForDocumentReadyState client, done

    it "Then title is I banku můžete mít rádi | Air Bank", (done) ->
      client.getTitle().then (title) ->
        try
          expect('I banku můžete mít rádi | Air Bank').to.eql title
        catch e
          {TestError} = depend.errors
          return done new TestError e
        done()