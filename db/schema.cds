namespace adagency;

using { cuid,managed} from '@sap/cds/common';
entity Preferences:cuid
{
key preference_Id: UUID  @odata.Type:'Edm.String' @title : '{i18n>Preference Id}' @Core.Computed;
preferenceType:String @title : '{i18n>Preference Type}'; 
preferenceCost:String  @title : '{i18n>Preference Cost}';
}

entity ContentDetails:cuid
{
key content_Id: UUID  @odata.Type:'Edm.String' @title : '{i18n>Content Id}' @Core.Computed;
contentType:String @title : '{i18n>Content Type}';
contentSize: String @title : '{i18n>Content Size}';
contentCost: String @title : '{i18n>Content Cost}';

}

entity PaymentPlan:cuid,managed
{
    key PlanId:UUID   @odata.Type:'Edm.String' @title : '{i18n>Plan Id}' @Core.Computed;
   content: association to ContentDetails;
   preferences: association to Preferences;
   startDate: DateTime @title : '{i18n>Start Date}';
   endDate: DateTime  @title : '{i18n>End Date}';


}
