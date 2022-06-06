public class AccountProcessor implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name FROM Account';
    }

    public void execute(Database.BatchableContext bc, List<Account> accList){
        List<Opportunity> oppList = [SELECT Id, AccountId, Name FROM Opportunity WHERE AccountId != NULL];
        for(Account acc : accList){
            for(Opportunity opp : oppList){
                if(opp.AccountId != NULL){
                    opp.Name += acc.Name;
                    opp.AccountId = acc.Id;
                }
            }
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Batch Processed Successfully!')
    }
}