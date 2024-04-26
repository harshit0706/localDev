public class myVariables 
{
	public static void myDate()
    {
        date d1;
        d1 = date.newInstance(2021, 6, 7);
        system.debug('start of month: ' + d1.toStartOfMonth());
        d1 = d1.addYears(2);
        d1 = d1 + 2;
        d1 = d1.addMonths(3);
        system.debug('New date assigned: ' + d1);
    }
    public static void myDateTime()
    {
        dateTime dt1;
        dt1 = dateTime.now();
        system.debug('today' +'\''+'s date time is: '+ dt1);
    }
    public static void myID()
    {
        ID i = 'a413N0000009ibc';
        system.debug(i);
        //a413N0000009ibcQAA
            
    }
    public static void mySobjects()
    {
        //through constructor
        Account a1 = new account(name = 'my Variable class1', numberOfEmployees = 120);
        
        //through dot notation.
        account a2 = new account();
        
        a2.Name = 'my variabl class2';
        a2.NumberOfEmployees = 300;
        
        insert a1;
        insert a2;
        
        
    }
    public static void myGenericSobject()
    {
        sObject s1 = new account(name = 'test account3',numberOfEmployees = 3000);
        insert s1;
        
        sObject s2 = new account();
        s2.put('name','test account_2');
        insert s2;
        //typecast of variable
        string name = (string)s1.get('name');
        integer nbr = (integer)s1.get('numberOfEmployees');
        
        object NM = s2.get('name');
       
        system.debug('name from generic sObject '+ (string)NM);
    }
    public static void myNestedList()
    {
        //2 dimensional list
        list<list<integer>> lList = new list<list<integer>>();
		list<integer> l1 = new list<integer>{11,12,13};
		list<integer> l2 = new list<integer>{14,15,16};
		list<integer> l3 = new list<integer>{17,18,19};   
		lList.add(l1);
		lList.add(l2);
        lList.add(l3);
        
        system.debug(lList);
        list<list<integer>> lList1 = new list<list<integer>>{
          new list<integer>{11,12,13},
          new list<integer>{14,15,16},
          new list<integer>{17,18,19}    
          };
		system.debug(lList1);   
        //3 dimensional list
        
        list<list<list<integer>>> lList3 = new list<list<list<integer>>>
        {
            new list<list<integer>>{new list<integer>{11,12,13},new list<integer>{14,15,16},new list<integer>{17,18,19}},    
            new list<list<integer>>{new list<integer>{11,12,13},new list<integer>{14,15,16},new list<integer>{17,18,19}},    
            new list<list<integer>>{new list<integer>{11,12,13},new list<integer>{14,15,16},new list<integer>{17,18,19}}    
                
        };
        system.debug(lList3);    
    }
}