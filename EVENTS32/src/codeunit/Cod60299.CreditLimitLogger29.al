// codeunit 60299 "Credit Limit Logger29"
// {
//     [EventSubscriber(ObjectType::Table, Database::Customer,
//     'OnAfterValidateEvent', 'Credit Limit (LCY)', false, false)]
//     local procedure LogCreditLimitChange(var Rec: Record Customer; var xRec: Record Customer)
//     var
//         LogRec: Record "Credit Limit Log BR 29";
//     begin
//         // If there is a change in credit limit, then log the change
//         if Rec."Credit Limit (LCY)" <> xRec."Credit Limit (LCY)" then begin

//             LogRec.Init();
//             LogRec.Validate("Customer No.", Rec."No.");
//             LogRec.Validate("Old Credit Limit", xRec."Credit Limit (LCY)");
//             LogRec.Validate("New Credit Limit", Rec."Credit Limit (LCY)");
//             LogRec.Validate("User ID", UserId);
//             LogRec.Validate("Changed At", CurrentDateTime);
//             LogRec.Insert();
//         end;
//     end;
// }


// table 50100 StudentHeader
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Document Type"; Option)
//         {
//             OptionMembers = Quote,Order,Invoice;
//         }

//         field(2; "No."; Code[20])
//         {
//         }

//         field(3; "Customer No."; Code[20])
//         {
//             TableRelation = Customer;
//         }

//         field(4; Name; Text[100])
//         {
//         }
//     }

//     keys
//     {
//         key(PK; "Document Type", "No.")
//         {
//             Clustered = true;
//         }
//     }
// }

// table 50101 StudentLine
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Document Type"; Option)
//         {
//             OptionMembers = Quote,Order,Invoice;
//         }

//         field(2; "Document No."; Code[20])
//         {
//         }

//         field(3; "Line No."; Integer)
//         {
//         }

//         field(4; "Item No."; Code[20])
//         {
//             TableRelation = Item;
//         }

//         field(5; Quantity; Integer)
//         {
//         }
//     }

//     keys
//     {
//         key(PK; "Document Type", "Document No.", "Line No.")
//         {
//             Clustered = true;
//         }
//     }
// }

// page 50100 StudentCard
// {
//     PageType = Document;
//     SourceTable = StudentHeader;
//     ApplicationArea = All;
//     UsageCategory = Documents;

//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Customer No."; Rec."Customer No.")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = All;

//                     trigger OnValidate()
//                     begin
//                         Message('Name Validated');
//                     end;
//                 }
//             }

//             part(StudentLines; StudentSubpage)
//             {
//                 ApplicationArea = All;

//                 SubPageLink =
//                     "Document Type" = field("Document Type"),
//                     "Document No." = field("No.");
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         Message('Page Opened');
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         Message('Current Record %1', Rec."No.");
//     end;
// }

// page 50101 StudentSubpage
// {
//     PageType = ListPart;
//     SourceTable = StudentLine;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field("Item No."; Rec."Item No.")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
// }

// codeunit 50100 StudentCodeunit
// {
//     procedure UpdateCustomer()
//     var
//         Customer: Record Customer;
//     begin
//         Customer.SetFilter(Balance, '>1000');

//         if Customer.FindSet() then
//             repeat
//                 Customer.Blocked := Customer.Blocked::All;
//                 Customer.Modify();
//             until Customer.Next() = 0;
//     end;
// }

// codeunit 50101 StudentSubscriber
// {
//     [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', false, false)]
//     local procedure OnAfterInsertCustomer(var Rec: Record Customer)
//     begin
//         Message('Customer Created %1', Rec."No.");
//     end;

//     [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterModifyEvent', '', false, false)]
//     local procedure OnAfterModifyItem(var Rec: Record Item)
//     begin
//         Message('Item Modified %1', Rec."No.");
//     end;

//     [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnAfterValidateEvent', 'Name', false, false)]
//     local procedure OnAfterValidateVendorName(var Rec: Record Vendor)
//     begin
//         Message('Vendor Name Changed');
//     end;
// }



// codeunit 50100 EvaluationManagement
// {
//     procedure CalculateWeightedScore(Score: Decimal; Weightage: Decimal): Decimal
//     var
//         WeightedScore: Decimal;
//     begin
//         WeightedScore := (Score * Weightage) / 100;
//         exit(WeightedScore);
//     end;

//     procedure CalculateFinalScore(StudentNo: Code[20]): Decimal
//     var
//         EvaluationLine: Record StudentLine;
//         FinalScore: Decimal;
//     begin
//         EvaluationLine.SetRange("Student No.", StudentNo);

//         if EvaluationLine.FindSet() then
//             repeat
//                 FinalScore += EvaluationLine."Weighted Score";
//             until EvaluationLine.Next() = 0;

//         exit(FinalScore);
//     end;

//     procedure AssignRating(FinalScore: Decimal): Text[20]
//     begin
//         if FinalScore >= 90 then
//             exit('Excellent')
//         else
//             if FinalScore >= 75 then
//                 exit('Good')
//             else
//                 if FinalScore >= 50 then
//                     exit('Average')
//                 else
//                     exit('Poor');
//     end;
// }