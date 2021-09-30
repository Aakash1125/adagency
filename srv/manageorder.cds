using from './manageOrder-service';

annotate ManageOrdersService.ManageOrder with @odata.draft.enabled;
annotate ManageOrdersService.ManageOrder with @( 
UI:{
     Identification: [{Value:ID}],
    
     SelectionFields: [ID,status,date],
    LineItem:[
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label:'{i18n>ID}'
            },
        {
            $Type: 'UI.DataField',
            Value: planID, 
            Label:'{i18n>Plan ID}'
            },
       {
           $Type: 'UI.DataField',
           Value: description,
           Label:'{i18n>Description}'
           },
        {
            $Type: 'UI.DataField',
            Value: date, 
            Label:'{i18n>Date}'
            },
        {
            $Type: 'UI.DataField',
            Value: address, 
            Label:'{i18n>Address}'
            },
       {
           $Type: 'UI.DataField',
           Value : totalAmount, 
           Label:'{i18n>Total Amount}'
           },
        {
            $Type: 'UI.DataField',
            Value : status, 
            Label:'{i18n>Status}'
            }
 
    ],
    HeaderInfo:{
        TypeName: '{i18n>ManageOrder}',
        TypeNamePlural: '{i18n>Manage Order}',
        Title: {Value: ID},
        //Description: {Value: title}
        
    },
 
     Facets: [
    
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}',Target: '@UI.FieldGroup#Details'},
        ],
         FieldGroup#Details: {
            Data: [
                {Value: planID,Label:'{i18n>Plan ID}'},
                {Value: description,Label:'{i18n>Description}'},
                {Value: date,Label:'{i18n>Date}'},
                {Value: address,Label:'{i18n>Address}'},
                {Value: totalAmount,Label:'{i18n>Total Amount}'},
                {Value: status,Label:'{i18n>Status}'},
            ]
        },
},
    
 
);


annotate ManageOrdersService.ManageOrder with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter @Core.Computed;
}

annotate ManageOrdersService.ManageOrder with{
    status @(
        sap.value.list:'fixed-values',
        Common : {
            FieldControl : #Mandatory,
            Text : status,
            TextArrangement : #TextOnly,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'StatusCode',
                Label : 'Order Status',
                SearchSupported: true,
                Parameters :[
                    {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'status',
                    ValueListProperty : 'code'
                    }
                ]
            },
        }
    )
};
