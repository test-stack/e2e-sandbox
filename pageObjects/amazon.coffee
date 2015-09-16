module.exports = (client, depend) ->
  {TestError} = depend.errors
  {expect} = require 'chai'

  {

    open: ->

      url = "http://www.amazon.com"
      homePageTitle = "Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more"

      describe "Open Amazon website", ->

        it "Given open home page #{url}", (done) ->
          client.url url, done

        it "When wait for document ready state", (done) ->
          client.waitForDocumentReadyState client, done

        it "Then title of home page is #{homePageTitle}", (done) ->
          client.getTitle().then (title) ->
            try
              expect(title).to.equal homePageTitle
            catch e
              return done new TestError e

            done()

    search: (typeSearch, title) ->

      AVAILABLE_TYPES_OF_SEARCH = [
        'Books'
      ]

      expectedTitle = "Amazon.com: #{title}: #{typeSearch}"

      describe "Search #{typeSearch} #{title}", ->

        it "Given type of search #{typeSearch} is available", (done) ->
          return done new TestError "Type of search #{typeSearch} isn't available." if typeSearch not in AVAILABLE_TYPES_OF_SEARCH
          done()

        it "And select #{typeSearch} from type of search", (done) ->
          client.click "//select[@id='searchDropdownBox']"
          .click "//option[contains(text(), 'Books')]", done

        it "And type #{title}", (done) ->
          client.click "//input[@id='twotabsearchtextbox']"
          .keys title, done

        it "When click on button with magnifier icon", (done) ->
          client.click "div.nav-search-submit input.nav-input", done

        it "And wait for document ready state", (done) ->
          client.waitForDocumentReadyState client, done

        it "Then title of home page is #{expectedTitle}", (done) ->
          client.getTitle().then (title) ->
            try
              expect(title).to.equal expectedTitle
            catch e
              return done new TestError e

            done()

  }