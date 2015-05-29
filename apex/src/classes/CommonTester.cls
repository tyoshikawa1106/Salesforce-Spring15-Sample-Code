public with sharing class CommonTester {

    /**
     * テスト実行ユーザ取得
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }

    /**
     * ユーザ テストデータ作成
     */
    public static User createUser(Id profileId, Boolean isInsert) {
        
        User user = new User(
             LastName = 'LastName'
            ,Alias = 'Alias'
            ,Email = 'user@tester.co.jp'
            ,Username = 'user@tester.co.jp.dev'
            ,CommunityNickname = 'TestUser'
            ,EmailEncodingKey = 'ISO-2022-JP'
            ,TimeZoneSidKey = 'Asia/Tokyo'
            ,LocaleSidKey = 'ja_JP'
            ,LanguageLocaleKey = 'ja'
            ,ProfileId = profileId
        );
        
        if (isInsert) {
            insert user;
        }
        
        return user;
    }

    /**
     * ChatterMessageの送信
     */
    public static ConnectApi.ChatterMessage doSendChatterMessage(String message, Id userId) {
        ConnectApi.ChatterMessage chatterMessage = ConnectApi.ChatterMessages.sendMessage(message, userId);
        return chatterMessage;
    }
}