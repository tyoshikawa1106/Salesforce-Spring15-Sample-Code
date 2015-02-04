public class AddressAndLocationDemoController {
    
    public List<Wrapper> wrapperList {get; set;}
    
    public AddressAndLocationDemoController() {
        
        this.wrapperList = new List<Wrapper>();
        
        List<Account> accounts = getAccounts();
        for (Account account : accounts) {
            Address addr = account.BillingAddress;
            Location loc = account.MyLocation__c;
            this.wrapperList.add(new Wrapper(account, addr, loc));
        }
    }
    
    private List<Account> getAccounts() {
        return [SELECT Id, Name, BillingAddress,MyLocation__c FROM Account ORDER BY Name ASC LIMIT 10];
    }
    
    public class Wrapper {
        public Account account {get; set;}
        public String acctCountry {get; set;}
        public String acctZipCode {get; set;}
        public String acctState {get; set;}
        public String acctCity {get; set;}
        public String acctStreet {get; set;}
        public Double lat {get; set;}
        public Double lon {get; set;}
        
        public Wrapper(Account account, Address addr, Location loc) {
            this.account = account;
            this.acctCountry = addr.Country;
            this.acctZipCode = addr.PostalCode;
            this.acctState = addr.State;
            this.acctCity = addr.City;
            this.acctStreet = addr.Street;
            this.lat = loc.latitude;
            this.lon = loc.longitude;
        }
    }
}