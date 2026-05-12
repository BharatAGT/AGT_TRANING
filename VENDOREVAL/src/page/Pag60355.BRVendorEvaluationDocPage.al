page 60455 "BR Vendor Evaluation Doc. Page"
{
    PageType = Document;
    SourceTable = "BR Vendor Evaluation Header";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Evaluation Month"; Rec."Evaluation Month")
                {
                    ApplicationArea = All;
                }

                field("Final Score"; Rec."Final Score")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Rating Status"; Rec."Rating Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Status; Rec.Status)
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
                    EvaluationLine: Record "BR Vendor Evaluation Line";
                    FinalScore: Decimal;
                begin
                    EvaluationLine.Reset();
                    EvaluationLine.SetRange("Evaluation No.", Rec."Evaluation No.");

                    if EvaluationLine.FindSet() then begin
                        repeat
                            Final.CalculateWeightedScore(EvaluationLine);
                        until EvaluationLine.Next() = 0;
                    end;

                    FinalScore := Final.CalculateFinalScore(Rec."Evaluation No.");

                    Rec."Final Score" := FinalScore;
                    Rec.Modify();

                    Final.AssignRating(Rec);

                    Message('Score calculated successfully.');
                end;
            }

            action("Complete Evaluation")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Final: Codeunit "BR EvaluationManagement";
                begin
                    Final.CompleteEvaluation(Rec);
                end;
            }

            action("ReOpen Evaluation")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();

                    Message('Evaluation reopened successfully.');
                end;
            }
        }
    }
}