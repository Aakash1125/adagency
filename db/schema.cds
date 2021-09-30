namespace adagency;

using {cuid} from '@sap/cds/common';

entity ManageOrder : cuid {
    key ID          : UUID @odata.Type : 'Edm.String';
        planID      : String;
        description : String;
        date        : Date;
        address     : String;
        totalAmount : Double;
        status      : OrderStatus;      
}

type OrderStatus : String enum{
    Confirmed;Pending;
}

entity MyOrderStatus{
    key code: String;
}
