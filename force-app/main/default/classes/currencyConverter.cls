public class currencyConverter 
{
	public static decimal convertCurrency(decimal usd)
    {
        decimal inr = 0.0;
        http h = new http();
        httpRequest req = new httpRequest();
        
        req.setEndpoint('https://free.currconv.com/api/v7/convert?q=USD_PHP&compact=ultra&apiKey=e9667cd4b1f259357c78');
        req.setMethod('GET');
        
        httpResponse res = h.send(req);
        
        map<string,Object> jsonBody = (map<string,Object>)json.deserializeUntyped(res.getBody());
        
        map<string,Object> mMap = (map<string,object>)jsonBody.get('results');
        system.debug(jsonBody);
        //map<string,Object> mMap2 =  (map<string,object>)mMap.get('USD_INR');
        //decimal conversionRate = (decimal)mMap2.get('val');
        //inr = usd*conversionRate;
        return inr;
    }
}