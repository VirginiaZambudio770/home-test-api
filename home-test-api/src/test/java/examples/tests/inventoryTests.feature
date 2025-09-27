Feature: Inventory API Tests

  Background:
    * url 'http://localhost:3100/api'
    * call read('classpath:examples/pages/common.feature@setup')

Scenario: Validate all inventory items
    * call read('classpath:examples/pages/inventory.feature@getAllItems')

Scenario: Validate filter by id
    * call read('classpath:examples/pages/inventory.feature@filterById')

Scenario: Validate add new item
  * def testData = { newId: currentId }
  * call read('classpath:examples/pages/inventory.feature@addItem') testData

  Scenario: Validate add item with existent id
    * def testData = { newId: currentId }
    * call read('classpath:examples/pages/inventory.feature@addItemExistent') testData

Scenario: Validate add item with missing info
    * call read('classpath:examples/pages/inventory.feature@addItemMissingInfo')

