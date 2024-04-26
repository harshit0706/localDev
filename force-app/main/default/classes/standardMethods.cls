public class standardMethods
{
	public static void leadConversion()
    {
        lead l = [select id,name from lead where name like 'converted%'];
        
        database.leadConvert  lc = new database.leadConvert();
        lc.setLeadId(l.id);
        system.debug('ID of lead converted'+l.id);
        lc.convertedStatus = 'Closed - Converted';
        lc.ownerID = '0055g000007eIiOAAU';
        database.LeadConvertResult lcr = database.convertLead(lc);
        
        
        
    }
}