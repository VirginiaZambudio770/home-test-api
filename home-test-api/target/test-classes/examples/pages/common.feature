Feature: Common setup

  Background:
    * def currentId = Math.floor(Date.now() / 1000)
    * def baseUrl = 'http://localhost:3100/api'    