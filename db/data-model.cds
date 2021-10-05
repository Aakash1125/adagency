namespace adagency;

using {cuid} from '@sap/cds/common';

entity AdDetails : cuid {
    key ID             : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        // userID      : UUID        @odata.Type     : 'Edm.String'  @Core.Computed;
        title          : String;
        textContent    : LargeString;
        category       : Association to Category;
        graphicContent : Association to GraphicContent;
}

entity Category {
    key ID   : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        name : String;
}

entity GraphicContent {
    key ID        : UUID        @odata.Type       : 'Edm.String'  @Core.Computed;
        imageType : String      @Core.IsMediaType : true;
        image     : LargeBinary @Core.MediaType   : imageType  @Core.ContentDisposition.Filename : fileName;
        fileName  : String;
}
