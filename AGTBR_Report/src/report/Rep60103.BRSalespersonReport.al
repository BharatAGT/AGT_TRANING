// report 60103 "BR_Salesperson_Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrSalesperson.rdl';

//     dataset
//     {
//         dataitem(Salesperson; "Salesperson/Purchaser")
//         {
//             column(Code; Code) { }
//             column(Name; Name) { }

//             dataitem(CustLedgEntry; "Cust. Ledger Entry")
//             {
//                 DataItemLink = "Salesperson Code" = field(Code);
//                 DataItemTableView = where("Document Type" = const(Invoice));

//                 column(Customer_Name; "Customer Name") { }
//                 column(Document_No; "Document No.") { }
//                 column(Amount; Amount) { }
//             }
//         }
//     }
// }