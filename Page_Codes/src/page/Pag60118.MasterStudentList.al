page 60118 "Master Student List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Student";
    CardPageId = "Master Student Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = all;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = all;

                }
                field("Total Fees"; Rec."Total Fees")
                {
                    ApplicationArea = all;

                }
                field("Total Payment"; Rec."Total Payment")
                {
                    ApplicationArea = all;

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