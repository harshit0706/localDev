public class OppTriggerHelperClass 
{
	public static void oppAmountCheck(list<opportunity> opp)
    {
        double oppAmount = 0;
        for(opportunity o1:[select id,Amount from opportunity where createdDate=today 
                               and createdById=:userinfo.getuserId()])
        {
            oppAmount = oppAmount + o1.Amount;
        }
        
        for(opportunity o2:opp)
        {
            oppAmount = oppAmount + o2.Amount;
            if(oppAmount >= 100000)
            {
                o2.addError('Total opportunity amount limit exceeded >=100K');
            }
            
        }
        
        
    }
}