public class opportunityClass 
{
	public static void aggregateMethod()
    {
        aggregateResult ar1 = [select sum(amount),max(Amount) from opportunity];
        system.debug('sum/max '+ar1);
        
        decimal d = (decimal)ar1.get('expr0');
        system.debug('total amount '+d);
        
        integer i = [select count() from opportunity];
        system.debug('count '+ i);
        
        aggregateResult ar2 = [select count(id) from opportunity];
        system.debug('count-id '+ar2);
        
        aggregateResult ar3 = [select count(amount) from opportunity];
        system.debug('count-amount '+ar3);
        
        aggregateResult ar4 = [select avg(amount) from opportunity];
        system.debug('average ' +ar4);
        
        aggregateResult ar5 = [select count_distinct(amount) from opportunity];
        system.debug('count-distinct ' +ar5);
        
        
    }
}