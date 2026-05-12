page 60607 "BR Audit Adjustment Log"
{
    PageType = List;
    SourceTable = "BR Adjustment Audit Log";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Adjustment No."; rec."Adjustment No.")
                {
                    ApplicationArea = All;
                }

                field("Action Type"; rec."Action Type")
                {
                    ApplicationArea = All;
                }

                field("User ID"; rec."User ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}