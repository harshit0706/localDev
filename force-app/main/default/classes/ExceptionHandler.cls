public class ExceptionHandler 
{
    public static void exception0()
    {
        system.debug('Code started');
        try
        {
            integer a=5;
            integer b = a*5;
            
        }
        catch(exception e)
        {
            system.debug('Exception occured');
            
        }
        finally
        {
            system.debug('execute even withut exception');
        }
        system.debug('Code continued');
    }
    public static void exception1(integer i)
    {
        system.debug('Code started');
        try
        {
            if(i==0)
            {
                integer a;
            	integer b = a*5; 			//throw NullPointerException
            }
            else
            {
                account a = new account();  // throws DMLException
                insert a;
            }                       
        }
        catch(NullPointerException npe)
        {
            system.debug('NullPointerException occured');
            
        }
        catch(DMLException de)
        {
            system.debug('DMLException occured');
            
        }
        catch(Exception e)
        {
            system.debug('Some other Exception occured');
            
        }
        finally
        {
            system.debug('execute even withut exception');
        }
        system.debug('Code continued');
    }   
    
    public static void exception2()
    {
        try
        {
            Account acc = new account();
            insert acc;
            
        }
        catch(DMLException de)
        {
            system.debug('DMLException'+de.getMessage());
        }
    }
    public static void exception3()
    {
        try
        {
            list<string> l1 = new list<string>{'xxx','qwe','asd','dfg'};
            system.debug(l1.get(5));
        }
        catch(ListException le)
        {
            system.debug('ListException'+le.getMessage());
        }
    }
    public static void exception4()
    {
        try
        {
            list<string> l1; // l1 not refers to any list object
            l1.add('hi');
            
            account a; //a doesn't refer to any account object
            a.name = 'test-acc-1';
            
            
        }
        catch(NullPointerException ne)
        {
            system.debug('NullPointerException'+ne.getMessage());
        }
    }
    public static void exception5()
    {
        try
        {
        	account a = [select id, name from account where name like 'DB-test%'];// multiple rows returned
            system.debug(a);
            
            account a1 = [select id, name from account where name like 'abc%']; // no row ret
            system.debug(a1);
    
        }
        catch(queryException qe)
        {
            system.debug('queryException'+qe.getMessage());
        }
                
    }
    public static void exception6()
    {
        try
        {
        	list<account> accList = [select id, name from account ];// multiple rows returned
            for(account a:accList)
            {
            	system.debug(a.numberOfEmployees);                
            }            
        }
        catch(sObjectException soe)
        {
            system.debug('sObjectException'+soe.getMessage());
        }
                
    }


}