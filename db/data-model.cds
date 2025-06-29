namespace demo.table;

type characterType : String(50);

using {
    cuid,
    managed
} from '@sap/cds/common';

//Table for Storing Customer Details
entity Customers : cuid, managed {
    //key customerId : UUID;
    name    : characterType default '' @title: '{i18n>name}';
    address : Composition of many Address
                  on address.customer = $self;
    emailId : characterType;
    //city    : String default 'Pune';
    //Country : String;
    gender  : String;
// createdBy: String;
// createdAt: DateTime;
// modifiedBy: String;
// ModifiedAt: DateTime;
}

// one Customer has many address
// one address is linked to one customer

entity Address : cuid {
    details      : String;
    city         : String;
    country      : String;
    addressTypes : String;
    pincode      : String;
    street       : String;
    customer     : Association to Customers;
}


// Composition - 1. Support CRUDQ , 2. If parent is deleted then child will be deleted
// Assocaition - 1. 2. If parent is deleted then child will not be deleted


entity PurchaseOrders : cuid {
    ponum : Integer;
    descr : String;
    poitem: Association to ExternalPurchaseItem on poitem.POItem = poitem_POItem;
    poitem_POItem: Integer;
}


entity ExternalPurchaseItem {
    key POItem : Integer;
    key POHNum : Integer;
        descr  : String;
}
