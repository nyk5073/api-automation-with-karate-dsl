package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import com.intuit.karate.junit5.Karate;

class ConduitTest {

    // @Test
    // void testParallel() {
    //     Results results = Runner.path("classpath:conduitApp")
    //             .outputCucumberJson(true)
    //             .parallel(5);
    //     assertEquals(0, results.getFailCount(), results.getErrorMessages());
    // }

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    // @Karate.Test
    // Karate testTags() {
    //     return Karate.run().tags("@users").relativeTo(getClass());
    // }

    // @Karate.Test
    // Karate testConduit() {
    //     return Karate.run().tags("@conduit").relativeTo(getClass());
    // }

    // @Karate.Test
    // Karate testConduit() {
    //     return Karate.run().tags("@conduit").relativeTo(getClass());
    // }

}
