public class SOSLClass 
{
    public static void dynamicSOSL()
    {
        string s = 'find \'paul\' RETURNING account, contact';
        list<list<sObject>> result = search.query(s);
        system.debug(result);
        
        list<list<sObject>> R1 = [find 'john OR paul' RETURNING account, contact];
        system.debug(R1);
        
        list<list<sObject>> R2 = [find 'john AND paul' RETURNING account, contact];
        system.debug(R2);
        
        
    }
    
    public static void basicSOSL()
    {
        list<list<sObject>> l1 = [find 'update*' in name fields 
                                  returning account(id,name,numberOfEmployees 
                                                    where name like 'update%' limit 10), 
                                  			contact(id,lastName)
                                 ];
        system.debug(l1);
        
        list<account> accList = l1[0];
        list<contact> conList = l1[1];
        
        for(account a:accList){
            system.debug(a);
        }
        
        for(contact c: conList){
            system.debug(c);
        }
    }
    @invocableMethod
    public static void processBuilderMethod(){
        system.debug('process builder run');
    }

}