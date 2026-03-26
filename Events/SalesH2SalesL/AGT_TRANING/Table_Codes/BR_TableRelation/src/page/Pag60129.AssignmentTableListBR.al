page 60183 "Assignment Table List BR"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Assignment Table BR";
    CardPageId = "Assignment Table Card BR";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.") { ApplicationArea = All; }
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field("Item Name"; Rec."Item Name") { ApplicationArea = All; }
                field("Technician Name"; Rec."Technician Name") { ApplicationArea = All; }
                field("Assignment Date"; Rec."Assignment Date") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("View Items")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemRec: Record "Master Table BR";
                begin
                    Page.Run(Page::"Master Table List BR", ItemRec);
                end;
            }
        }
    }
}