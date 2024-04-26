public class apexController 
{
    list<account> acts = [select id,name, phone, industry, Type from account];
   
    public list<account> getActs()
    {
        
        return acts; 
    }
}