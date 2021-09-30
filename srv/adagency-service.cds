using adagency from '../db/schema';

service AdAgencyServices @(path:'/browse')
 {
    @Capabilities: {Insertable:true,Deletable:true,}
      @odata.draft.enabled : true
    
    entity preferences as Projection on adagency.Preferences
    
    @Capabilities: {Insertable:true,Deletable:true,}
     @odata.draft.enabled : true
     entity contentDetails as projection on adagency.ContentDetails



 }
     
     

