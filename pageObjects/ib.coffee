module.exports = (client, depend) ->
  {TestError} = depend.errors
  {expect} = require 'chai'

  {

    verifyTitle: ->

      it "verify title element", (done) ->
        client.title().then (title) ->
          try
            expect('I banku můžete mít rádi | Air Banks').to.eql title.value
          catch e
            return done new TestError e

          done()

    loginButtonExist: ->

      it "button Login exist", (done) ->
        client.isExisting("//a[contains(text(),'Přihlásit')]").then (isExisting) ->
          try
            expect(isExisting).to.be.true
          catch e
            return done new TestError e

          done()
  }