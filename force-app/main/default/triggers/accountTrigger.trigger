trigger accountTrigger on Account (after insert ) 
{
    list<account> accList = new list<account>();
    if(trigger.isAfter && trigger.isInsert)
    {
        
        for(account acc: trigger.new)
        {
            if(checkRecursive.executeOnce==True)
            {
                account childAcc = new account();
                childAcc.Name = acc.Name + '-Child';
                childAcc.ParentId = acc.Id;
                accList.add(childAcc);
                checkRecursive.executeOnce = false;    
            }
        }
        Insert accList;
    }
}