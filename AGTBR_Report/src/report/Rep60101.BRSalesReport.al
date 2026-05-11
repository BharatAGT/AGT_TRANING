// report 60101 "BR_Sales_Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrSalesorder.rdl';
//     Caption = 'BR Sales Report';

//     dataset
//     {
//         dataitem(Customer; Customer)
//         {
//             RequestFilterFields = "No.";
//             column(No_; "No.")
//             {

//             }
//             column(Name; "Name")
//             {

//             }

//             dataitem("Sales Header"; "Sales Header")

//             {
//                 DataItemLink = "Sell-to Customer No." = field("No.");
//                 DataItemTableView = where("Document Type" = const(Order));
//                 column("Order_No_"; "No.")
//                 {

//                 }
//                 column("Cus_Name"; "Sell-to Customer Name")
//                 {

//                 }

//             }
//         }


//     }
// }