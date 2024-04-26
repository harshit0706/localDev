trigger invoiceTrigger on Invoice__c (before insert, after insert) 
{
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
			for(invoice__C inv: trigger.New)
            {
                inv.Status__c = 'New';
            }  
            
        }
        
    }
    if(trigger.isAfter)
    {
        for(Invoice__c inv: trigger.new)
        {
            double totalAmt = 0.00;
            list<Invoice__c> invoices = [select id , status__c,Amount__c 
                                         from Invoice__c 
                                         where Contact__c = :inv.Contact__c];
            for(Invoice__c inv1:invoices)
            {
                Invoice__c newInv = [select id from Invoice__c where contact__c = :inv.Contact__c
                                 order by createdDate desc 
                                 limit 1];
                if(inv1.Id != newInv.Id)
                {
                    inv1.status__c = 'Old';
                }
                totalAmt = totalAmt + inv1.Amount__c;
               	
            }
            update invoices;
            system.debug(totalAmt);
            contact cont = [select id,Total_Amount__c from contact where id = :inv.contact__c];
           	
            cont.Total_Amount__c = totalAmt;
            update cont;
        }        
        
        
    }

}