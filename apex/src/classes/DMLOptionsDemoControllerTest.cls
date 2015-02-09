@isTest
private class DMLOptionsDemoControllerTest {
    
    private static User testAdminUser = CommonTester.getLoginUser();
    
    /**
     * DMLOptionsDemoControllerTest1
     */
    static testMethod void DMLOptionsDemoControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            DMLOptionsDemoController cls = new DMLOptionsDemoController();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.isDuplicate, false);
            System.assertEquals(cls.account.Name, 'Sample Account');
            System.assertEquals(cls.account.AccountNumber, 'Sample Number');
        }
    }

    /**
     * doSaveTest1
     */
    static testMethod void doSaveTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            DMLOptionsDemoController cls = new DMLOptionsDemoController();
            cls.doSave();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.isDuplicate, false);
            List<Account> resultAccounts = [SELECT Id,Name,AccountNumber FROM Account LIMIT 1];
            System.assertEquals(resultAccounts.size(), 1);
            System.assertEquals(resultAccounts[0].Name, 'Sample Account');
            System.assertEquals(resultAccounts[0].AccountNumber, 'Sample Number');
        }
    }
    
    /**
     * doSaveTest2
     */
    static testMethod void doSaveTest2() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            DMLOptionsDemoController cls = new DMLOptionsDemoController();
            // 保存1回目
            cls.doSave();
            // 保存2回目 (重複エラー発生条件)
            cls.doSave();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.isDuplicate, true);
            List<Account> resultAccounts = [SELECT Id,Name,AccountNumber FROM Account LIMIT 1];
            System.assertEquals(resultAccounts.size(), 1);
            System.assertEquals(resultAccounts[0].Name, 'Sample Account');
            System.assertEquals(resultAccounts[0].AccountNumber, 'Sample Number');
        }
    }
    
    /**
     * doSaveTest3
     */
    static testMethod void doSaveTest3() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            DMLOptionsDemoController cls = new DMLOptionsDemoController();
            // 保存1回目
            cls.doSave();
            // 保存2回目 (条件変更)
            cls.account.AccountNumber = cls.account.AccountNumber + '★';
            cls.doSave();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.isDuplicate, false);
            List<Account> resultAccounts = [SELECT Id,Name,AccountNumber FROM Account ORDER BY AccountNumber ASC LIMIT 5];
            System.assertEquals(resultAccounts.size(), 2);
            System.assertEquals(resultAccounts[0].Name, 'Sample Account');
            System.assertEquals(resultAccounts[0].AccountNumber, 'Sample Number');
            System.assertEquals(resultAccounts[1].Name, 'Sample Account');
            System.assertEquals(resultAccounts[1].AccountNumber, 'Sample Number★');
        }
    }
}