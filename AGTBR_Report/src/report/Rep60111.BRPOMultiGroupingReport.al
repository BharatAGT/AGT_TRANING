// report 60111 "BR_PO_MultiGrouping_Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrMultiGrouping.rdl';
//     Caption = 'BR PO MultiGrouping Report';

//     dataset
//     {
//         dataitem(Vendor; Vendor)
//         {
//             column(Name; Name)
//             {

//             }
//             dataitem("Purchase Header"; "Purchase Header")
//             {
//                 DataItemLink = "Buy-from Vendor No." = field("No.");
//                 DataItemTableView = sorting("Document Date") order(descending);
//                 column(Document_Date; "Document Date") { }
//                 column(No_; "No.") { }
//                 column(MonthYear; Format("Document Date", 0, '<Month Text> <Year4>')) { }
//             }
//         }
//     }

// }