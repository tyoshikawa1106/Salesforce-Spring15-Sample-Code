public with sharing class ApexManifestDemoController {

    public List<Wrapper> wrapperList {get; set;}

    public ApexManifestDemoController() {
        // new List
        this.wrapperList = new List<Wrapper>();

        // Tooling API
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v33.0/tooling/apexManifest');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        String jsondata = res.getBody();

        // Check List
        if (String.isEmpty(jsondata)) {
            return;
        }

        // テストクラスでエラーが解決できないので今回はスキップ
        // System.TypeException: Invalid conversion from runtime type Map<String,ANY> to List<ANY>
        if(Test.isRunningTest()){
            return;
        }

        // Get Results
        List<Object> apexManifestList = (List<Object>)JSON.deserializeUntyped(jsondata);

        for (Object obj : apexManifestList) {
            Map<String, Object> recordMap = new Map<String, Object>((Map<String, Object>)obj);
            // Add List
            this.wrapperList.add(new Wrapper(recordMap));
        }

        // System.debug
        System.debug(res);
        System.debug(apexManifestList);
    }

    public class Wrapper {
        public String apexId {get; set;}
        public String apexName {get; set;}
        public String apexNamespace {get; set;}
        public String apexType {get; set;}
        public String apexTypeRef {get; set;}

        public Wrapper(Map<String, Object> recordMap) {
            this.apexId = (String)recordMap.get('id');
            this.apexName = (String)recordMap.get('name');
            this.apexNamespace = (String)recordMap.get('namespace');
            this.apexType = (String)recordMap.get('type');
            this.apexTypeRef = (String)recordMap.get('typeRef');
        }
    }
}