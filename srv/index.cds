//using from './adagency-paymentplan';
using from './adagency-service';
using from '@sap/cds/common';

annotate AdAgencyServices.PaymentPlanDetails with @odata.draft.enabled;
annotate AdAgencyServices.PaymentPlanDetails with @( 
    Common.SemanticKey: [],

UI:{
     SelectionFields: [preferences_ID,content_ID],
    LineItem:[
        {Value: contentType},
        {Value: contentSize},
        {Value: contentCost},
        {Value: preferenceType},
        {Value: preferenceCost},
        {Value: startDate},
        {Value: endDate},

    ],
    HeaderInfo:{
        TypeName: '{i18n>paymentPlan}',
        TypeNamePlural: '{i18n>Plans}',
      //  Title: {Value: title},
        //Description: {Value:},
        Title:{Value:PlanId}
        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Plan Details}', Target: '@UI.FieldGroup#General'},
        
        ],
        FieldGroup#General: {
            Data: [
                //{Value: ID, Label:'{i18n>Book ID}'},
                {Value: preferenceType},
                {Value: preferenceCost},
                {Value:contentCost},
                {Value:contentType},
                {Value:contentSize}
            ]
        },
        

        
},    

);

annotate AdAgencyServices.PaymentPlanDetails with {
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'contentDetails',
            Label           : 'PaymentPlan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'content_ID',
                    ValueListProperty : 'content_Id',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentType'
                },  
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentSize'
                },   
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentCost'
                },  
            ]
        }
    });

    
}

annotate AdAgencyServices.PaymentPlanDetails with {
     preferences@(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'preferences',
            Label           : 'Payment Plan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'preferences_ID',
                    ValueListProperty : 'preference_Id',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceType'
                },  
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceCost'
                },   
               
            ]
        }
    });
}