page 60455 "BR Vendor Evaluation Doc. Page"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BR Vendor Evaluation Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                    TableRelation = "BR Vendor Evaluation Line";
                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;

                }

                field("Evaluation Month"; Rec."Evaluation Month")
                {
                    ApplicationArea = All;
                }

                field("Final Score"; Rec."Final Score")
                {
                    ApplicationArea = All;
                }

                field("Rating Status"; Rec."Rating Status")
                {
                    ApplicationArea = All;
                }

                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }

            part(VendorEvaluationLines; "BR Vendor Evaluation Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Evaluation No." = FIELD("Evaluation No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Calculate Score")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Final: Codeunit "BR EvaluationManagement";
                begin
                    Final.CalculateFinalScore(Rec."Evaluation No.");
                end;
            }

            action("Complete Evaluation")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Final: Codeunit "BR EvaluationManagement";
                begin
                end;
            }

            action("ReOpen Evaluation")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Message('Evaluation Re-Opened');
                end;
            }
        }
    }
}