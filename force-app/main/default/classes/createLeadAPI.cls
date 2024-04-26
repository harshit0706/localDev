@RESTResource(urlMapping='/CreateLead/')
global class createLeadAPI 
{
	@HTTPGet
    global static string getLead()
    {
        string objName;
        id i;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        objName = req.headers.get('objectName'); //req.headers return key,value pair of map
        i = req.headers.get('Id');
        
        
        
        
        string qr = 'select Name from '+  objName+ ' where Id = :i '+ ' limit 1';
       
        sObject s = database.query(qr);
        
        string jsonResponse = '{\"Name\" : \"'+s.get('name')+ '\"}';
        return jsonResponse;
    }
    @HTTPPost
    global static string createLeadRecord()
    {
        string fName, LName, Comp;
        string fieldValue, fieldName;
        restRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string jsonBody = req.requestBody.toString();
        JSONParser parser = JSON.createParser(jsonBody);
        while(parser.nextToken()!=Null)
        {
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName=='firstName')
                {
                    fName = fieldValue;
                }
                else if(fieldName=='lastName')
                {
                    lName = fieldValue;
                }
                else if(fieldName=='company')
                {
                    comp = fieldValue;
                }
            }
        }
        lead l = new lead(firstName = fName, lastName = lName, company = comp);
        insert l;
        
        return l.id;
    }
}