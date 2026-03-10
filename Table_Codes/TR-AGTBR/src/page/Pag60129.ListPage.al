page 60129 "List Page"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ITEM TEST";
    CardPageId = "ITEM TEST Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ApplicationArea = All;
                }


                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
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