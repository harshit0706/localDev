public with sharing class lwcAccountController {
    @AuraEnabled(Cacheable=true)
    public static list<Account> getAccountList(){
        return [SELECT Id, Name, Type, Industry from Account LIMIT 10];
    }

    @AuraEnabled(Cacheable=true)
    public static list<Account> filterAccountByType(string type){
        return [SELECT Id, Name, Type, Industry from Account where Type = :type LIMIT 5];
    }

    @AuraEnabled(Cacheable=true)
    public static list<Account> findAccount(string searchKey){
        string key = '%' + searchKey + '%';
        return [SELECT Id, Name, Type, Industry from Account 
        WHERE Name LIKE :key LIMIT 5];
    }
     
}