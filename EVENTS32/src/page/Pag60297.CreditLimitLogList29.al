page 60297 "Credit Limit Log List29"
{
    PageType = List;
    SourceTable = "Credit Limit Log BR 29";
    ApplicationArea = All;   // ✅ Page level
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Old Credit Limit"; Rec."Old Credit Limit")
                {
                    ApplicationArea = All;
                }
                field("New Credit Limit"; Rec."New Credit Limit")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Changed At"; Rec."Changed At")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}