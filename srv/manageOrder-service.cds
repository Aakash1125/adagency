using adagency as ad from '../db/schema';

service ManageOrdersService {

    @Capabilities : { Insertable: true, Deletable:true }
    entity ManageOrder as projection on ad.ManageOrder;

@readonly
   entity StatusCode as projection on ad.MyOrderStatus;


}

