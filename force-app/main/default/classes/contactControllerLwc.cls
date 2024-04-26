public with sharing class contactControllerLwc 
{
    @AuraEnabled(cacheable=true)
    public static list<contact> getContacts()
    {
        list<contact> conList = [select id, lastName, FirstName from contact limit 6];
        return conList;
    }
}