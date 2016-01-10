{TestError} = dependencies.errors
module.exports = ( nameOfProduct ) ->

  describe "Result page", ->


    describe "Product #{nameOfProduct} was found", ->

      it "wait for document ready state", (done) ->
        client.waitForDocumentReadyState client, done

      it "select and open #{nameOfProduct}", (done) ->
        xPath = "//a[contains(@title,'#{nameOfProduct}')]"
        client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
          return done new TestError "#{xPath} not found for #{nameOfProduct}" if !isExist
        .click xPath, done