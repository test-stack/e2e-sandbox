{TestError} = dependencies.errors
module.exports = ( typeOfProduct, nameOfProduct ) ->

  describe "Find #{nameOfProduct} in #{typeOfProduct}", ->

    availableTypeOfProducts = [
      'Books'
    ]

    describe "Select type #{typeOfProduct}", ->

      it "type of product #{typeOfProduct} is available", (done) ->
        return done new TestError "#{typeOfProduct} isn't available." if typeOfProduct not in availableTypeOfProducts
        done()

      it "open type of products dropdown", (done) ->
        xPath = "//select[@id='searchDropdownBox']"
        client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
          return done new TestError "#{xPath} not found for type of product #{typeOfProduct}" if !isExist
        .click xPath, done

      it "select type #{typeOfProduct}", (done) ->
        xPath = "//option[text()='Books']"
        client.click xPath, done

    describe "Fill #{nameOfProduct} to fill input and click on search button", ->

      it "open type of products dropdown", (done) ->
        xPath = "//input[@id='twotabsearchtextbox']"
        client.waitForExist(xPath, dependencies.explicitWaitMs).then (isExist) ->
          return done new TestError "#{xPath} not found for search input" if !isExist
        .keys nameOfProduct, done

      it "click on search button", (done) ->
        client.click "//input[@value='Go']", done