public class DMLclass 
{
	public static void DMLInsertmethod()
    {
        list<account> accList = new list<account>();
        for(integer i=1;i<20;i++){
            account a = new account(name = 'test-class-account-'+i);
            accList.add(a);
        }
        insert accList;
        
    }
    
    public static void DMLUpdateMethod()
    {
        list<account> accList = [select name from account where createdDate = today];
        for(account a:accList){
            a.name = a.name + '-7/15/21';
            
        }
        update accList;
    }
    
    public static void DMLUpsertMethod()
    {
        list<account> accList = [select name, numberOfEmployees from account where createdDate = today];
        for (account a:accList){
            a.NumberOfEmployees = 1050;
        }
        for(integer i = 1;i<20;i++){
            account a = new account(name = 'upsert-account-'+i,numberOfEmployees = i);
            accList.add(a);
        }
        upsert accList;
    }
    public static void DMLDeleteMethod()
    {
        list<account> accList = [select id from account where createdDate = today];
        delete accList;
        list<contact> conList = [select id from contact where createdDate = today];
        delete conList;
        list<opportunity> oppList = [select id from opportunity where createdDate = today];
        delete oppList;
    }
    
    public static void DMLUnDeleteMethod()
    {
        list<account> accList = [select name, numberOfEmployees from account where createdDate = today
                                and isDeleted = true ALL ROWS];
        undelete accList;
    }

    public static void DMLMergeMethod()
    {
        list<account> accList     = new list<account>();
        list<contact> conList     = new list<contact>();
        list<opportunity> oppList = new list<opportunity>();
        date d = date.today()+30;
        
        for(integer i=1;i<4;i++){
            account a = new account(name = 'merge-account-'+i,numberOfEmployees = 2000);
            accList.add(a);
        }
        insert(accList);
        //system.debug('account inserted');
        
        for(integer l=1;l<4;l++){
            //system.debug('in contact/opportunity creation loop');
        	string nme = 'merge-account-'+l+'%';
            //system.debug(nme);
            list<account> acc = [select id from account where name like :nme];
            //system.debug(acc);
        	for(account a:acc){
                for(integer j = 1;j<l+1;j++){
                    contact c = new contact(lastName = 'member'+l+j,
                                            firstName = 'c'+l+j,
                                            AccountId = a.id);
                    conList.add(c);
            	}
                for(integer k = 1;k<l+1;k++){
                    opportunity op = new opportunity(Name = 'merge-op'+l+k,
                                                     stageName = 'prospecting',
                                                     closeDate = d,
                                                     AccountId = a.id );
                    oppList.add(op);
                }
        	} 
        }
        insert(conList);
        insert(oppList);
        
        list<account> accMerge = [select id,name from account where name like 'merge%' order BY name];
        system.debug(accMerge);
        account a0 = accMerge[0];
        list<account> a23 = new list<account>();
        a23.add(accMerge[1]);
        a23.add(accMerge[2]);
        
        merge a0 a23;
        
    }
    
    public static void DBinsert()
    {
        Account[] accts = new List<Account>();
        for(integer i = 1;i<10;i++)
        {
        	accts.add(new Account(Name='Db-test-Account'+i));
    	    
        }   
    	accts.add(new Account());
        Database.SaveResult[] srList = Database.insert(accts, false);
         
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
      
    }
    
    
    
}