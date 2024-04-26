public class VfController
{
	public string accName;
    public integer accEmployees;
    public string conName, conEmail;
    public string oppNAme{get;set;}
    public decimal oppAmount{get;set;}
	
    public void setaccName(string a)
    {
        accName = a;
    }
    public string getaccName()
    {
        return accName;
    }
    //accEmployees
    public void setaccEmployees(integer i)
    {
        accEmployees =i;
    }
    public Integer getaccEmployees()
    {
        return accEmployees;
    }
    //conName
    public void setconName(string c)
    {
        conName =c;
    }
    public string getconName()
    {
        return conName;
    }
    //conEmail
    public void setconEmail(string e)
    {
        conEmail =e;
    }
    public string getconEmail()
    {
        return conEmail;
    }
    
    public void saveRecord()
    {
        account a = new account(name=accName,numberOfEmployees=accEmployees );
        insert a;
        
        contact c = new contact(lastName=conName, email=conEmail, accountid= a.id);
        insert c;
        
        opportunity o = new opportunity(Name = oppName, amount=oppAmount, accountid= a.id ,
                                        stageName='prospecting', closeDate=system.today() );
        insert o;
    }
}