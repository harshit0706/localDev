public with sharing class utilityClass 
{
    // @AuraEnabled
    // public static map<string,string> mapMethod()
    // {
    //    system.debug('in apex class'); 
    //    map<string,string> testMap = new Map<String,String>();
    //    testMap.put('a','harshit');
    //    testMap.put('b','abhishek');
    //    testMap.put('c','kedar');
    //    testMap.put('d','ashish');
    //    testMap.put('e','manish');
    //    System.debug(testMap);
    //    return testMap;
       
       
       
    // }
    @AuraEnabled
    public static List<SObject> getContactList(string name)
    {
        string key = '%'+ name + '%';
        string query = 'select id, name, phone,email from contact where name like :key' ; 
        return Database.Query(query);     
    }
    @AuraEnabled
    public static List<SObject> getAccountList(string name)
    {
        string key = '%'+ name + '%';
        string query = 'select  id,name, industry from account where name like :key' ; 
        return Database.Query(query);     
        
    }
}