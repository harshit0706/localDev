global class AccountBatch implements database.Batchable<sObject>
{
    //AccountBatch ab = new AccountBatch();
	//database.executeBatch(ab);
	//-----------------------------------------------------------------------------------
    global database.QueryLocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator([select ID,name from account]);
    }
    global void execute(database.BatchableContext bc, list<account> accList)
    {	
        integer i;
        for(account acc: accList)
        {
            acc.name = 'Account' + i;
            i++;
        }
        update accList;
        system.debug(i);
        //delete accList;
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