trigger ContactTrigger on Contact (before insert, after insert)
{
    if(trigger.isBefore){
        ContactTriggerHelper.beforeInsert(trigger.new);
    }
    if(trigger.isAfter){
        ContactTriggerHelper.afterInsert(trigger.new);
    }
    
}