page 60181 "Master Table List BR"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Master Table BR";
    UsageCategory = Administration;
    CardPageId = "Master Table Card BR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field("Item Name"; Rec."Item Name") { ApplicationArea = All; }
                field("Item Type"; Rec."Item Type") { ApplicationArea = All; }
                field("Service Cost"; Rec."Service Cost") { ApplicationArea = All; }
                field("Total Assignments"; Rec."Total Assignments") { ApplicationArea = All; }
            }
        }
    }
}