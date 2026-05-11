// report 60102 "BR_Purchase_Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrPurchaseorder.rdl';
//     Caption = 'BR Purchase Report';

//     dataset
//     {
//         dataitem(Item; Item)
//         {

//             column(No_; "No.")
//             {

//             }
//             column(Description; "Description")
//             {

//             }

//             dataitem("Purchase Header"; "Purchase Header")

//             {
//                 DataItemLink = "Buy-from Vendor No." = field("No.");
//                 // DataItemTableView = where("Document Type" = const(Order));
//                 column("Order_No_"; "No.")
//                 {

//                 }
//                 column("Vend_Name"; "Buy-from Vendor Name")
//                 {

//                 }
//             }


//         }
//     }
// }