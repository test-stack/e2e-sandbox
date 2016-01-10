{TestError} = dependencies.errors
module.exports = ( nameOfProduct ) ->

  describe "Product #{nameOfProduct} exist", ->

    it "wait for document ready state", (done) ->
      client.waitForDocumentReadyState client, done

    it "select and open #{nameOfProduct}", (done) ->
      xPath = "//span[@id='productTitle' and contains(text(),'#{nameOfProduct}')]"
      client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
        return done new TestError "#{xPath} not found title of product #{nameOfProduct}" if !isExist
      .click xPath, done