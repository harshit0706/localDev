@isTest
public class accountQueaueableTest 
{
    static testMethod void test1()
    {
     	test.startTest();
        system.enqueueJob(new accountQueaueable());	
        test.stopTest();
        
        Account acct = [SELECT Name,numberOfEmployees FROM Account WHERE Name='Queue account' LIMIT 1];
        System.assertNotEquals(null, acct);
        System.assertEquals(200, acct.numberOfEmployees);
    }
}