@isTest
public class queueableApexTest 
{
	static testmethod void test1()
    {
		test.startTest();
		system.enqueueJob(new queueableApex());        
        test.stopTest();
    
        account acct = [select name, phone from Account where name = 'queue apex class' limit 1];
        system.assertNotEquals(null, acct);
        system.assertEquals('+91-9786956789', acct.Phone);
    }
}