Feature: Inventory API Tests

  Background:
    * url 'http://localhost:3100/api'

  @getAllItems
  Scenario: Validate all inventory items
    * call read('classpath:examples/pages/inventory.feature@getAllItems')

  @filterById
  Scenario: Validate filter by id
    * call read('classpath:examples/pages/inventory.feature@filterById')

  @addItem
  Scenario: Validate add new item
   * call read('classpath:examples/pages/inventory.feature@addItem')

  @addItemExistent
  Scenario: Validate add item with existent id
   * call read('classpath:examples/pages/inventory.feature@addItemExistent')

  @addItemMissingInfo
  Scenario: Validate add item with missing info
    * call read('classpath:examples/pages/inventory.feature@addItemMissingInfo')

  @checkItemAdded
  Scenario: Validate item added is present in inventory
    * def lastId = Math.floor(Date.now() / 1000)
    * call read('classpath:examples/pages/inventory.feature@getAllItems')
