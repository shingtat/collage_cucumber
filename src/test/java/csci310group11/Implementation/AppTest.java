package csci310group11.Implementation;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }
    
    public void testApi() {
    		GoogleCustomSearchApi api = new GoogleCustomSearchApi();
    		try {
				System.out.println(api.execute("dog").size());
			} catch (InsufficientImagesFoundError e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    }
    
    public void testDriver() {
    		CollageGenerator cg = new CollageGenerator();
    		String filePath = cg.collageGeneratorDriver("DOG");
    		System.out.println(filePath);
    }
}
