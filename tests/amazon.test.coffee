module.exports = ->

  nameOfBook = 'The Art of Application Performance Testing'

  describe "Add book #{nameOfBook} to basket", ->

    homepage.open 'http://www.amazon.com/', 'Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more'

    amazon.homepage.find 'Books', nameOfBook

    amazon.resultPage.openProduct nameOfBook

    amazon.detailPage.exist nameOfBook

    amazon.detailPage.addToBasket.paperbackBookmark()

    amazon.basket.exist.wasAdded nameOfBook

module.exports.tags = [
  'addBookToBasket'
]