page 60180 "Master Table Card BR"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Master Table BR";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    ApplicationArea = All;
                }
                field("Total Assignments"; Rec."Total Assignments")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}