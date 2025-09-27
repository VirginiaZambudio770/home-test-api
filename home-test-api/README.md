# Home Test API - Karate Automation

## Overview

This project contains API automation tests for the Take Home API Test using **Karate BDD** and **Maven**.  
Tests are organized following the **Page Object Model (POM)** pattern.

The API under test is served via Docker at: `http://localhost:3100/api`.

---

## Prerequisites

Before running the tests, make sure you have installed:

1. **Java JDK 17 or higher**
2. **Apache Maven 3.9+**
3. **Docker**
4. **IntelliJ IDEA** (optional, for running tests from IDE)

---

## Project Structure

src
└── test
└── java
└── examples
├── pages
│ └── inventory.feature # Page Object
├── tests
│ └── inventoryTests.feature # Feature tests
└── runners
└── InventoryRunner.java # JUnit5 runner

- **pages/**: Feature files containing reusable API actions (Page Object).
- **tests/**: Feature files containing actual test scenarios, calling the pages.
- **runners/**: Java classes to execute the feature files using JUnit5.

---

## Setup Instructions

1. Clone the repository
   git clone https://github.com/your-username/home-test-api.git
   cd home-test-api

2. Pull and run the Docker API
   docker pull automaticbytes/demo-app
   docker run -p 3100:3100 automaticbytes/demo-app
   Verify API is running: http://localhost:3100/api

3. Set the base URL in karate-config.js
   function fn() {
   var config = {};
   config.baseUrl = 'http://localhost:3100/api';
   return config;
   }

Running Tests
Run all tests via Maven
mvn test
Run a specific runner
mvn test -Dtest=InventoryRunner
Run only scenarios with a specific tag
mvn test -Dkarate.options="--tags @getAllItems"

Test Scenarios Covered

1. Get all menu items
   Validate response contains at least 9 items.
   Validate each item has id, name, price, image.
2. Filter by id
   GET /api/inventory/filter?id=3
   Validate response contains correct item: Baked Rolls x 8.
3. Add item for non-existent id
   POST /api/inventory/add
   Validate status code 200.
4. Add item for existing id
   POST /api/inventory/add
   Validate status code 400.
5. Add item with missing information
   POST /api/inventory/add with incomplete JSON.
   Validate status code 400.
   Validate response contains error message.
6. Validate recently added item exists
   GET /api/inventory
   Validate item is present with correct data.

Notes
• The API database is ephemeral. Restart the Docker container to reset inventory between test runs:
docker rm -f demo-api
docker run -d -p 3100:3100 --name demo-api automaticbytes/demo-app
• Tests are implemented using Karate Page Object Model:
o pages/inventory.feature → reusable API actions.
o tests/inventoryTests.feature → actual test scenarios calling pages.
o runners/InventoryRunner.java → JUnit5 runner.
• For IntelliJ: Right-click InventoryRunner → Run, or configure Karate Options to filter tags.
