public class contactListController 
{
    @AuraEnabled
    public static list<contact> getContactList(string AccountId)
    {
        list<contact> contactList = new list<contact>([select Id, 
                                                       firstName, 
                                                       lastName ,
                                                       email,
                                                       name, 
                                                       phone 
                                                       from contact 
                                                       where email !=Null 
                                                       and AccountId = :AccountId]);
        //system.debug('AccountId'+ contactList);
        return contactList;
    }
	
}