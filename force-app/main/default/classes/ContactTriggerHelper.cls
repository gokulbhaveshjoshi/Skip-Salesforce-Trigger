public with sharing class ContactTriggerHelper {
    public static boolean doNotRunTrigger = false;
    public ContactTriggerHelper() {

    }

    public static void beforeInsert(List<Contact> con){
        if(ContactTriggerHelper.doNotRunTrigger){
            return;
        }
        List<account> acc = new List<Account>();
        for(Contact c: con){
            String name = c.firstname + ' ' + c.lastname;
            Account a = new Account(name = name);
            insert a;
            c.AccountId = a.id;
            
        }
       
    }

    public static void afterInsert(List<Contact> con){
        if(ContactTriggerHelper.doNotRunTrigger){
            return;
        }
        List<Contact> ct = new List<Contact>();
        for(Contact c: con){
            Opportunity op = new Opportunity(name = c.LastName, contactid = c.id, StageName = 'Prospecting', CloseDate = system.today() + 7);
            insert op;
        }
        
    }
}