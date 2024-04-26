public class deleteDuplicate
{
    public static void deleteContact()
    {
        list<contact> cList = [select name from contact];
        map<string,ID> cMap = new map<string,ID>();
        
        for(contact c:cList){
            cMap.put(c.name,c.Id);
        }
        //set<string> s = cMap.keyset();
        list<contact> inclist = new list<contact>();
        list<contact> dellist = new list<contact>();
        list<id> l1 = cmap.values();
        for(contact c:cList)
        {
            if(l1.contains(c.id)) 
               inclist.add(c);
            else
                dellist.add(c);
            
        }
        system.debug(inclist);
        system.debug(dellist);
        
        delete dellist;
  
        
    
    }

}