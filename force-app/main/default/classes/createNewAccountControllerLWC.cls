public with sharing class createNewAccountControllerLWC 
{
    @AuraEnabled
    public static List<Account> getAccounts(String accNameSearhKey, String billingState){
        try {
            System.debug('accNameSearhKey: '+ accNameSearhKey);
            accNameSearhKey = '%' + accNameSearhKey + '%';
            billingState = '%' + billingState + '%';

            system.debug(accNameSearhKey);
            List<Account> accounts = new List<Account>();
            accounts = [SELECT ID,
                               phone, 
                               NAME, 
                               Website, 
                               AnnualRevenue, 
                               BillingAddress , 
                               RecordTypeId, 
                               RecordType.Name
                        FROM Account 
                        WHERE Name LIKE :accNameSearhKey 
                        and   billingState LIKE :billingState];
            return accounts;   
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> fetchAccounts(String accNmeApexKey, String accNbrApexKey, String legalNmeApexKey){
        try {
            System.debug('accNameSearhKey: '+ accNmeApexKey);
            accNmeApexKey = '%' + accNmeApexKey + '%';
            accNbrApexKey = '%' + accNbrApexKey + '%';
            legalNmeApexKey = '%' + legalNmeApexKey + '%';

            system.debug(accNmeApexKey);
            List<Account> accounts = new List<Account>();
            accounts = [SELECT ID,
                               NAME, 
                               Legal_Name__c,
                               accountNumber
                            //    Website, 
                            //    AnnualRevenue, 
                            //    BillingAddress , 
                            //    RecordTypeId, 
                            //    RecordType.Name
                        FROM Account 
                        WHERE Name LIKE :accNmeApexKey 
                        OR    AccountNumber LIKE :accNbrApexKey
                        OR    Legal_Name__c LIKE :legalNmeApexKey];
            return accounts;   
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void createLogger(Logger__c log){
        try {
            insert log;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}