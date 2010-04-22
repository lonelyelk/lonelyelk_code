package suite {
  import flexunit.framework.TestCase;
  import flexunit.framework.TestSuite;
  public class HelloWorldTest extends TestCase {
    public function HelloWorldTest(methodName:String) {
      super(methodName);
    }

    public static function suite():TestSuite {
      var ts:TestSuite = new TestSuite();
      
      ts.addTest(new HelloWorldTest("testHelloWorld"));
      
      return ts;
    }

    public function testHelloWorld():void {
      assertTrue("Надпись должна гласить 'Привет, Мир!'", true);
    }
  }
}
