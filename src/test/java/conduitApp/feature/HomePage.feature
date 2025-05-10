@conduit
Feature: Tests for the home page

Background: Define Base URL
    Given url 'https://conduit-api.bondaracademy.com/api/'

    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['Test','Zoom']
        * match response.tags !contains 'cars'
        * match response.tags == "#array"
        * match each response.tags == "#string"
    @debug
    Scenario: Get 10 articles from the page
        Given params {limit : 10, offset : 0}
        * path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[10]'
        * match response.articlesCount == 10
        * match response == {"articles": "#array", "articlesCount": 10}
        * match response.articles[0].createdAt contains '2024'
        * match response.articles[*].favoritesCount contains 19
        * match response..bio contains null
        * match each response..following == '#boolean'
        * match each response..bio == '##string'