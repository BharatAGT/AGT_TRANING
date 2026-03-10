page 60182 "Assignment Table Card BR"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Assignment Table BR";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.")
                {
                    ApplicationArea = all;
                    Caption = 'Assignment No.';

                }
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
                field("Service Cost"; Rec."Service Cost")
                {
                    ApplicationArea = all;
                    Caption = 'Service Cost';
                }
                field("Technician Name"; Rec."Technician Name")
                {
                    ApplicationArea = all;
                    Caption = 'Technician Name';
                }
                field("Assignment Date"; Rec."Assignment Date")
                {
                    ApplicationArea = all;
                    Caption = 'Assignment Date';

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