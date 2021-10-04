using from './adagency-service';

annotate AdAgencyServices.preferences with @odata.draft.enabled;
annotate AdAgencyServices.preferences with @( 

 
UI:{
    SelectionFields: [preferenceType],
    LineItem:[
        
    {
            $Type: 'UI.DataField',
            Value: preference_Id,
            Label:'{i18n>ID}'
            },
                {
            $Type: 'UI.DataField',
            Value: preferenceType,
            Label:'{i18n>Type}'
            },
                {
            $Type: 'UI.DataField',
            Value: preferenceCost,
            Label:'{i18n>Cost}'
            },

    ],
    HeaderInfo:{
        TypeName: '{i18n>Preference}',
        TypeNamePlural: '{i18n>Preferences List}',

        Title:{Value:preference_Id}
        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Preference Details}', Target: '@UI.FieldGroup#General'},
        
        ],
        FieldGroup#General: {
            Data: [
                {Value: preferenceType, Label:'{i18n>Preference Type}'},
                {Value: preferenceCost, Label:'{i18n>Preference Cost}',},

            ]
        },
        

        
},    

);


annotate AdAgencyServices.preferences with {
    preference @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'Preferences',
            Label           : 'Preferences',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'preferenceType',
                    ValueListProperty : 'preferenceType',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceCost'
                },  

            ]
        }
    });

    
}

//##########################################Content#############################################

annotate AdAgencyServices.contentDetails  with @( 
    Common.SemanticKey: [],

UI:{
     SelectionFields: [contentType],
    LineItem:[
        {Value:content_Id},
        {Value: contentType},
        {Value:contentSize},
        {Value: contentCost},
    

    ],
    HeaderInfo:{
        TypeName: '{i18n>Contents}',
        TypeNamePlural: '{i18n>ContentDetails List}',
      //  Title: {Value: title},
        //Description: {Value:},
        Title:{Value:content_Id}
        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Preference Details}', Target: '@UI.FieldGroup#General'},
        
        ],
        FieldGroup#General: {
            Data: [
                {Value: contentType},
                {Value:contentSize},
                {Value: contentCost},

            ]
        },
        

        
},    

);


annotate AdAgencyServices.ContentDetails with {
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'ContentDetails',
            Label           : 'Content Details',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'contentType',
                    ValueListProperty : 'contentType',
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

