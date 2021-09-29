namespace adagency;

using {cuid} from '@sap/cds/common';

entity AdDetails : cuid {
    key ID          : UUID @odata.Type : 'Edm.String';
    key userID      : UUID @odata.Type : 'Edm.String';
        title       : String;
        textContent : LargeString;
        category    : Association to Category;
}

entity Category {
    key ID   : UUID @odata.Type : 'Edm.String';
        name : String;
}
