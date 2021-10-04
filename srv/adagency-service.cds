using adagency from '../db/schema';

service AdAgencyServices 
 {
    @Capabilities: {Insertable:true,Deletable:true,}
     // @odata.draft.enabled : true
    
    entity preferences as Projection on adagency.Preferences
    
    @Capabilities: {Insertable:true,Deletable:true,}
     //@odata.draft.enabled : true
     entity contentDetails as projection on adagency.ContentDetails

    @Capabilities: {Insertable:true,Deletable:true,}
     // @odata.draft.enabled : true
    entity PaymentPlanDetails as Projection on adagency.PaymentPlan
    {
     *,content.content_Id as Cid, preferences.preferenceType as preferenceType, preferences.preferenceCost as preferenceCost,content.contentType as contentType,content.contentSize as contentSize,content.contentCost as contentCost
    }

 }
     
     

