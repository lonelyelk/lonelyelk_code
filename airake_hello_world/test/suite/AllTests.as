package suite {
  
  import flexunit.framework.TestSuite;  
  
  public class AllTests extends TestSuite {
    
    public function AllTests() {
      super();
      addTest(HelloWorldTest.suite());
    }
    
  }
  
}
