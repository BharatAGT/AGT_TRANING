// page 60355 "BR Vendor Evaluation Doc. Page"
// {
//     PageType = Document;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "BR Vendor Evaluation Header";

//     layout
//     {
//         area(Content)
//         {
//             group(GroupName)
//             {
//                 field("Evaluation No."; rec."Evaluation No.")
//                 {
//                     applicationArea = All;
//                     TableRelation = "BR Vendor Evaluation Line";
//                 }
//                 field("Vendor No."; rec."Vendor No.")
//                 {
//                     applicationArea = All;
//                     TableRelation = "BR Vendor Evaluation Line";
//                 }
//                 field("Vendor Name"; rec."Vendor Name")
//                 {
//                     applicationArea = All;
//                 }
//                 field("Evaluation Month"; rec."Evaluation Month")
//                 {
//                     applicationArea = All;
//                 }
//                 field("Final Score"; rec."Final Score")
//                 {
//                     applicationArea = All;
//                 }
//                 field("Rating Status"; rec."Rating Status")
//                 {
//                     applicationArea = All;
//                 }
//                 field("Status"; rec.Status)
//                 {
//                     applicationArea = All;
//                 }
//             }
//             part(VendorEvaluationLines; "BR Vendor Evaluation Subform")
//             {
//                 ApplicationArea = All;

//                 SubPageLink = "Evaluation No." = field("Evaluation No.");
//             }
//         }


//     }
//     actions
//     {
//         area(Processing)
//         {
//             action("Calculate Score")
//             {


//                 trigger OnAction()
//                 var
//                     final: Codeunit "BR EvaluationManagement";
//                 begin

//                     final.CalculateFinalScore(rec."Evaluation No.");

//                 end;
//             }
//             action("Complete Evaluation")
//             {

//                 trigger OnAction()
//                 var
//                     final: Codeunit "BR EvaluationManagement";
//                 begin


//                 end;
//             }
//             action("ReOpen Evaluation")
//             {

//                 trigger OnAction()
//                 begin
//                     rec.Status := rec.status::open;
//                     Message('Evaluation Re-Opened');

//                 end;
//             }
//         }
//     }
// }