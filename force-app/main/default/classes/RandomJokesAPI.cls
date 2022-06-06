public with sharing class RandomJokesAPI {
    public RandomJokesAPI() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        String endpoint = 'https://icanhazdadjoke.com/';
        request.setEndpoint(endpoint);
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug(response.getBody());
        }
    }
}