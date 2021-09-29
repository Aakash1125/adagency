namespace adagency;

using {cuid} from '@sap/cds/common';

entity AdDetails : cuid {
    key ID          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
   // key userID      : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        title       : String;
        textContent : LargeString;
        category    : Association to Category;
        image     : LargeBinary @Core.MediaType   : imageType;
        imageType : String      @Core.IsMediaType : true;
}

entity Category {
    key ID   : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        name : String;
}
