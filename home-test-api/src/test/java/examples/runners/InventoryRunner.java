package examples.runners;

import com.intuit.karate.junit5.Karate;

public class InventoryRunner {

    @Karate.Test
    Karate runTests() {
        return Karate.run("classpath:examples/tests/inventoryTests.feature").relativeTo(getClass());
    }
}

