public class leadExtension
{
    public list<lead> lList{get;set;}
    
    public leadExtension(apexPages.standardController s)
    {
     	lList = [select name,status from lead order by name];
        
    }
    
    public leadExtension(VfController vc)//parametrized with custom controller class name
    {
     	lList = [select name,status from lead order by name];
        
    }
    
    public void save()
    {
        system.debug('extension lead');
    }

}