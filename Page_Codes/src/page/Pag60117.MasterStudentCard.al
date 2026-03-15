page 60117 "Master Student Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Student";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                field("Last Payment Amount"; Rec."Last Payment Amount")
                {
                    ApplicationArea = all;
                }
                field("Payment Date Filter"; Rec."Payment Date Filter")
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