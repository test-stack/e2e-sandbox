{TestError} = dependencies.errors
wasAdded = (nameOfProduct) ->

  describe "#{nameOfProduct} was added to basket", ->

    it "wait for document ready state", (done) ->
      client.waitForDocumentReadyState client, done

    it "Added to cart notification", (done) ->
      xPath = "//h1[contains(text(),'Added to Cart')]"
      client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
        return done new TestError "#{xPath} not found." if !isExist
        done()

module.exports =
  wasAdded: wasAdded