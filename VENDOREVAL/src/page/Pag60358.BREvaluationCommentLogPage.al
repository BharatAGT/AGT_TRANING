page 60458 "BR Evaluation Comment Log Page"
{
    PageType = List;
    SourceTable = "BR Evaluation Comment Log";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                }

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }

                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}