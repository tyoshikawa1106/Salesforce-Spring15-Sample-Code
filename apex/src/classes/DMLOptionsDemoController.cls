public with sharing class DMLOptionsDemoController {
    
    public Account account {get; set;}
    public Boolean isDuplicate {get; set;}

    public DMLOptionsDemoController () {
        this.isDuplicate = false;
        doInit();
    }
    
    public void doSave() {
        // DMLOptions Class
        Database.DMLOptions dml = new Database.DMLOptions(); 
        // 重複レコード保存不可
        dml.DuplicateRuleHeader.AllowSave = false;
        // INSERT
        Database.SaveResult sr = Database.insert(this.account, dml);
        // エラー判定
        if (!sr.isSuccess()) {
            // 重複エラー
            this.isDuplicate = true;
            // Insertion failed due to duplicate detected
            for(Database.Error duplicateError : sr.getErrors()){
                // Datacloud.DuplicateResult
                Datacloud.DuplicateResult duplicateResult = ((Database.DuplicateError)duplicateError).getDuplicateResult();
                System.debug('Database.DuplicateResult:getFields() = ' +  duplicateResult.getDuplicateRule());
                System.debug('Database.DuplicateResult:getErrorMessage() = ' +  duplicateResult.getErrorMessage());
                System.debug('Database.DuplicateResult:getMatchResults() = ' +  duplicateResult.getMatchResults());
                System.debug('Database.DuplicateResult:isAllowSave() = ' +  duplicateResult.isAllowSave());
                // Database.DuplicateError
                System.debug('Database.DuplicateError:getFields() = ' +  duplicateError.getFields());
                System.debug('Database.DuplicateError:getMessage() = ' +  duplicateError.getMessage());
                System.debug('Database.DuplicateError:getStatusCode() = ' +  duplicateError.getStatusCode());
                
                // Error Message
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, duplicateResult.getErrorMessage()));
            }
            
        } else {
            // 正常実行
            this.isDuplicate = false;
            // Create Message
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Create Account!!'));
            // Default
            doInit();
        }
    }
    
    private void doInit() {
        this.account  = new Account(
             Name = 'Sample Account'
            ,AccountNumber = 'Sample Number'
        );
    }
}