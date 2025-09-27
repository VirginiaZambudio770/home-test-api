@setup
Feature: Common setup

  Scenario: Setup once per feature
  * def currentId = Math.floor(Date.now() / 1000)