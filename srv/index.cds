using from './adagency-paymentplan';
using from './adagency-service';
using from '@sap/cds/common';


annotate PaymentPlanServices.PaymentPlanDetails with @( 
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
        //{Value: stock, Label: 'Stock Level', Criticality: level}

        //  {$Type: 'UI.DataField',Value: ID, Label: '{i18n>ID}'},
        // {$Type: 'UI.DataField',Value: title, Label: '{i18n>Book Title}'},
        // {$Type: 'UI.DataField',Value: author.name, Label: '{i18n>Author Name}'},
        // {$Type: 'UI.DataField',Value: author_ID, Label: '{i18n>Author ID}'},
        // {$Type: 'UI.DataField',Value: stock,Label: '{i18n>Book Stock}'}

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
           // { $Type:'UI.ReferenceFacet', Label:'{i18n>}', Target : ''}
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

annotate PaymentPlanServices.PaymentPlanDetails with {
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'PaymentPlanDetails',
            Label           : 'PaymentPlan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'content_ID',
                    ValueListProperty : 'content_ID',
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

annotate PaymentPlanServices.PaymentPlanDetails with {
     preferences@(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'PaymentPlanDetails',
            Label           : 'PaymentPlan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'preferences_ID',
                    ValueListProperty : 'preferences_ID',
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