page 60180 "Master Table Card BR"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Table BR";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                    Caption = 'Item Type';
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