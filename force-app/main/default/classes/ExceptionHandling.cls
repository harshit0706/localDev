public class ExceptionHandling 
{
	public static void negativeInteger(integer i)
    {
        try
        {
        	if(i<0)
            {
                throw new myException();
            }
            else
            {
                i = i*10;
                system.debug(i);
            }    
        }
        catch(myException excep)
        {
            system.debug('Number can\'t be -ve');
        }
        
    }

}