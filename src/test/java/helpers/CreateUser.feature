Feature: Test for the User Service

Background: Define Base URL
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url 'https://gorest.co.in'
    And header Authorization = 'Bearer ' + token
    # * def random_string = 
    # """
    # function(s) {
    #     var text = "";
    #     var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    #     for (var i = 0; i < 5; i++) {
    #         text += possible.charAt(Math.floor(Math.random() * possible.length));
    #     }
    #     return text;        
    # }
    # """
    # * def randomString = random_string(10)
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomName = dataGenerator.getRandomUsername()
    * def reqPayload = 
    """
    {
        "name": "#(randomName)",
        "email": "#(randomEmail)",
        "gender": "male",
        "status": "active"
    }
    """
    #* reqPayload.email = randomString + "@gmail.com"
    #* reqPayload.name = randomString
    
    Scenario: Create a new user and retrieve by ID
    Given path '/public/v2/users'
    And request reqPayload
    When method POST
    Then status 201
    * def userId = response.id
    * def userName = response.name
    * def userEmail = response.email