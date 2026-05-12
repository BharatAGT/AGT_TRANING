page 60456 "BR Vendor Evaluation Subform"
{
    PageType = ListPart;
    SourceTable = "BR Vendor Evaluation Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }

                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = All;
                }

                field("Criteria Description"; Rec."Criteria Description")
                {
                    ApplicationArea = All;
                }

                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                }

                field(Weightage; Rec.Weightage)
                {
                    ApplicationArea = All;
                }

                field("Weighted Score"; Rec."Weighted Score")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}