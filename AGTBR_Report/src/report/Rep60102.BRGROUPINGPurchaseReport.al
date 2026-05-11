// report 60102 "BR_GROUPING_Purchase_Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrPurchaseorder.rdl';
//     Caption = 'BRREport';


//     dataset
//     {
//         dataitem(PurchHeader; "Purchase Header")
//         {
//             DataItemTableView =
//             sorting("Buy-from Vendor No.", "Document Date", "No.") order(descending);

//             column(VendorName; "Buy-from Vendor Name") { }
//             column(DocumentDate; "Document Date") { }
//             column(MonthYear; Format("Document Date", 0, '<Month Text> <Year4>')) { }
//             column(PurchaseNo; "No.") { }
//         }

//     }
// }

