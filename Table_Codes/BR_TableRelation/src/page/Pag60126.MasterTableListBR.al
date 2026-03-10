page 60181 "Master Table List BR"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Table BR";
    CardPageId = "Master Table Card BR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                    Caption = 'Item No.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = all;
                    Caption = 'Item Name';
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = all;
                    Caption = 'Item Type ';
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    ApplicationArea = all;
                    Caption = 'Service Cost';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}