using {demo.table as dataModels} from '../db/data-model';

service CustomerInformationService {

    entity CustomerSet as projection on dataModels.Customers;
    entity PurchaseOrders as projection on dataModels.PurchaseOrders;
    entity ExternalPurchaseItem as projection on dataModels.ExternalPurchaseItem;
}