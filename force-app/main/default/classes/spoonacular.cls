public class spoonacular {
    private static final string spoonacular_api = 'https://api.spoonacular.com';
    private static final string api_key = 'ee04bc46467e4ea4b9e0b09635173328';
    
    public static void getRandomRecipie(){
        http http = new http();
		httpRequest request = new httpRequest();
		request.setEndPoint(spoonacular_api + '/recipes/random?apiKey='+api_key);
		request.setMethod('GET');

		httpResponse response = http.send(request);
		system.debug('response code :'+ response.getStatusCode());
		if(response.getStatusCode() == 200){
    	system.debug('response  :' + response.getBody());
		}
    }
    
    public static void getRecipie(string recipieId){
        http http = new http();
		httpRequest request = new httpRequest();
		request.setEndPoint(spoonacular_api + '/recipes/'+recipieId+'/information?apiKey='+api_key);
		request.setMethod('GET');

		httpResponse response = http.send(request);
		system.debug('response code :'+ response.getStatusCode());
		if(response.getStatusCode() == 200){
    	system.debug('response  :' + response.getBody());
		}
    }
    public static void getRecipieByIngredient(string ingredients){
        http http = new http();
		httpRequest request = new httpRequest();
		request.setEndPoint(spoonacular_api + '/recipes/findByIngredients?apiKey='+api_key + '&ingredients='+ingredients);
		request.setMethod('GET');

		httpResponse response = http.send(request);
		system.debug('response code :'+ response.getStatusCode());
		if(response.getStatusCode() == 200){
    	system.debug('response  :' + response.getBody());
		}
    }
}