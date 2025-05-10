@users
Feature: Test for the User Service

Background: Define Base URL
    Given url goRestUrl
    And header Authorization = 'Bearer ' + token
    * def createUserVars = callonce read('classpath:helpers/CreateUser.feature')
    * def userId = createUserVars.userId
    * def userName = createUserVars.userName
    
    Scenario: Get the user by ID
        Given path `/public/v2/users/${userId}`
        When method GET
        Then status 200
        And match response.name == userName
        And match response.email == createUserVars.userEmail

    Scenario: Update the user
        Given path `/public/v2/users/${userId}`
        And request { "name": "Updated Name" }
        When method PUT
        Then status 200
        And match response.name == "Updated Name"
        And match response.email == createUserVars.userEmail

    Scenario: Get the updated user by ID
        Given path `/public/v2/users/${userId}`
        When method GET
        Then status 200
        And match response.name == "Updated Name"
        And match response.email == createUserVars.userEmail
        
    Scenario: Delete the user
        Given path `/public/v2/users/${userId}`
        When method DELETE
        Then status 204

    Scenario: Verify user deletion
        Given path `/public/v2/users/${userId}`
        When method GET
        Then status 404
        And match response.message == "Resource not found"