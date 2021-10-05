using from './adDetail-service';
using from '@sap/cds/common';

annotate AdDetailService.AdDetails with @odata.draft.enabled;

annotate AdDetailService.AdDetails with @(UI : {
    SelectionFields     : [categoryName],
    LineItem            : [
        {
            $Type : 'UI.DataField',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Value : categoryName,
        },
        {
            $Type : 'UI.DataField',
            Value : category_ID,
            Label : 'Category ID'
        },
    ],

    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Ad Detail}',
        TypeNamePlural : '{i18n>Ad List}',
        Title          : {Value : ID},
    },

    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>General}',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [
        {Value : title},
        {Value : textContent, },
        {Value : categoryName, }
    ]}
}, );

annotate AdDetailService.AdDetails with {
    @UI.MultiLineText
    textContent
};


// annotate AdDetailService.AdDetails.image with {
//     @UI.IsImageUrl : true
//     image
// };


annotate AdDetailService.AdDetails with {
    ID           @title : '{i18n>Ad ID}';
    title        @title : '{i18n>Ad Title}';
    categoryName @title : '{i18n>Category Name}';
    textContent  @title : '{i18n> Text Content}';
}

annotate AdDetailService.AdDetails with {
    categoryName @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'Category',
            Label           : 'Category',
            SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : 'categoryName',
                ValueListProperty : 'name'
            }]
        }
    });
}
