Feature: Inventory Page Object

  Background:
    * url baseUrl
    * path 'inventory'

  @getAllItems
  Scenario: Get all items
    When method get
    Then status 200
    # Validate response contains at least 9 items
    And assert karate.sizeOf(response.data) >= 9
    # Validate each item contains required fields
    And match each response.data contains { id: '#present', name: '#string', image: '#string', price: '#string' }

  @filterById
  Scenario: Filter by id
    Given path 'filter'
    And param id = 3
    When method get
    Then status 200
    # Validate response data for Baked Rolls x 8
    And match response contains { id: '3', name: 'Baked Rolls x 8', image: '#string', price: '#string' }

  @addItem
  Scenario: Add item
    Given path 'add'
    And request { id: #(newId), name: "Hawaiian", image: "hawaiian.png", price: "$14" }
    When method post
    Then status 200

 @addItemExistent
  Scenario: Add item with existent id
   Given path 'add'
   And request { id: #(newId), name: "Hawaiian", image: "hawaiian.png", price: "$14" }
   When method post
   Then status 400

  @addItemMissingInfo
  Scenario: Add item with missing information
    Given path 'add'
    And request { name: 'Incomplete', price: '$5' }
    When method post
    Then status 400
    # Validate response contains the expected error message
    And match response.message == 'Bad Request'

  @validateItemExists
  Scenario: Validate item exists in inventory
    When method get
    Then status 200
    # Validate that Hawaiian is present in the inventory
    And match response contains { id: 10, name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
