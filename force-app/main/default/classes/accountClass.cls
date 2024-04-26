public class accountClass 
{
    //database.query() 
    public static void DBquery()
    {
        string qr = 'select id';
        string[] fieldList = new list<string>();
        string objName = 'account';
        fieldList.add('name');
        fieldList.add('numberOfEmployees');
        fieldList.add('phone');
        
        for(string f:fieldList){
            qr += ', '+f;
        }
        qr += ' from '+ objName;
        //SQL injection check before database.query method is must 
        //to prevent invalid trespassing.
        string s = string.escapeSingleQuotes(qr);
         system.debug(s);
            
        list<sObject> accList = database.query(s);
        system.debug(accList);
        
    }
    public static void testAccountCreation()
    {
    	list<account> accList = new list<account>();
        for(integer i = 0;i<10000;i++){
            acclist.add(new account(name = 'batch-test-account-'+i, numberOfEmployees = 350));
        }
        insert accList;
    }
    public static void deleteAcc()
    {
		list<account> accList = [select id from account where name like 'batch-test-account%' ];
		delete accList;        
    }
    public static void updateAccount()
    {
        //list<account> accList = [select id from account];
        //account acc = new account();
        //integer i=0;
        /*
        for(account a:accList){
            
            i++;
      		a.name = 'updated name'+i;  
            a.numberOfEmployees = 500;
            update a;-too many dml operation governer limit exception
           
               
            }
	    */
        list<account> acc1 = [select id from account where name like 'batch-test-account%'];
        list<account> acc2 = [select id from account where name like 'test-account%'];
        for(account a1:acc1){
            a1.rating = 'hot';
        }
        for(account a2:acc2){
            a2.rating = 'cold';
        }
        
		update acc1;
        update acc2;
	}
      
        
    
    public static void sqlMethod1()
    {
        set<string> nme = new set<string>{'qwerty','poiuytrewq'};
        
        list<account> accList = [select name, id, billingAddress from account where name IN :nme];
        system.debug(accList);
        for(account a:accList){
            a.NumberOfEmployees = 1239;
            
        }
        update accList;
    }

}