@isTest
global class ApexMainfestDemoHttpMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest req) {
        
        HttpResponse res = new HttpResponse();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v33.0/tooling/apexManifest');
        res.setBody('{"id":"null", "name":"AddressAndLocationDemoController", "namespace":"null", "type":"CLASS", "typeRef":"AddressAndLocationDemoController"}');
        req.setMethod('GET');
        res.setStatusCode(200);
        return res;
    }
}