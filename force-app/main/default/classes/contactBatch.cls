global class contactBatch implements database.Batchable<sObject>
{
    global database.QueryLocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator([select ID, firstName, lastName from contact]);
        
    }
    global void execute (database.BatchableContext bc, list<contact> conList)
    {
        for(contact c: conList)
        {
            if(c.firstName == ' ')
            {
                c.firstName = 'batchUpdate';
                c.lastName = c.lastName + 'updated';
				system.debug(c.Name);
            }
            update conlist;
        }
        
    }
    global void finish(database.BatchableContext bc)
    {
     	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'dwivediharshit93@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Batch Job is done');
        mail.setPlainTextBody('The batch Apex job processed');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   
    }
}