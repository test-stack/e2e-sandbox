{TestError} = dependencies.errors
paperbackBookmark = ->

  describe "Select method of purchase Paperback", ->

    it "select method of purchase Paperback", (done) ->
      xPath = "//ul[@id='mediaTabs_tabSet']/li//span[contains(text(),'Paperback')]"
      client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
        return done new TestError "#{xPath} not found type of purchase method Paperback" if !isExist
      .click xPath, done

    it 'click on button Add to Cart', (done) ->
      xPath = "//input[@id='add-to-cart-button']"
      client.click xPath, done

module.exports =
  paperbackBookmark: paperbackBookmark