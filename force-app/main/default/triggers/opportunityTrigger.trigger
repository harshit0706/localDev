trigger opportunityTrigger on Opportunity (before insert, before update, before delete,
                                   after insert, after update, after delete, after undelete ) 
{
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            system.debug('before insert');
            OppTriggerHelperClass.oppAmountCheck(trigger.New);
            
        }
        else if(trigger.isUpdate)
        {
            system.debug('before update');
                       
            map<id,opportunity> oMap = new map<id,opportunity>();
            oMap = trigger.oldMap;
            for(opportunity nOpp:trigger.new)
            {
                opportunity oOpp = new opportunity();
                oOpp = oMap.get(nOpp.id);
                if(nOpp.Amount != oOpp.Amount )
                {
                    nOpp.Amount.addError('Amount can not be changed');
                }
            }
            
            
        }
        else if(trigger.isDelete)
        {
            system.debug('before delete');
        }
    }
    else if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            system.debug('after insert');
        }
        else if(trigger.isUpdate)
        {
            system.debug('after update');   
        }
        else if(trigger.isDelete)
        {
            system.debug('after delete');
        }
        else if(trigger.isUnDelete)
        {
            system.debug('after unDelete');
        }
    }
}