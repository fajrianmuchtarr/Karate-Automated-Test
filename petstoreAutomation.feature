Feature: Swagger Petstore API Automation

Background:
  * url 'https://petstore.swagger.io/v2'

Scenario: Add a new pet
  Given path '/pet'
  And request { "id": 1, "name": "Fluffy", "status": "available" }
  When method post
  Then status 200

Scenario: Get pet by ID
  Given path '/pet/2'
  When method get
  Then status 200

Scenario: Update pet information
  Given path '/pet'
  And request { "id": 1, "name": "broto", "status": "sold" }
  When method put
  Then status 200

Scenario: Place an order
  Given path '/store/order'
  And request { "id": 1, "petId": 1, "quantity": 1, "shipDate": "2023-12-12T12:00:00Z", "status": "placed", "complete": true }
  When method post
  Then status 200

Scenario: Get user by username
  Given path '/user/user1'
  When method get
  Then status 200
  And match response == { "id": 11111, "username": "user1", "firstName": "User", "lastName": "User", "email": "test@mail.com", "password": "pass", "phone": "12345678", "userStatus": 0 }

Scenario: Update user information
  Given path '/user/user1'
  And request { "id": 1, "username": "johndoe", "firstName": "John", "lastName": "Doe", "email": "john.doe@example.com", "password": "newpassword", "phone": "9876543210" }
  When method put
  Then status 200

Scenario: Get pet by Status
    Given path '/pet/findByStatus'
    And params { "status": "sold" }
    When method get
    Then status 200

Scenario: Find purchase by order id
    Given path '/store/order/1'
    When method get
    Then status 200

Scenario: return pet inventories by status
    Given path '/store/inventory'
    When method get
    Then status 200

Scenario: login user into system
    Given path '/user/login'
    And params { "username": "user1", "password": "password" }
    When method get
    Then status 200

Scenario: user logout
    Given path '/user/logout'
    When method get
    Then status 200