page 60148 "BR Student List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BR_STUDENT;
    CardPageId = "BR Student Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;

                }

                field("IsActive"; Rec."IsActive")
                {
                    ApplicationArea = All;

                }

                field("Grade"; Rec."Grade")
                {
                    ApplicationArea = All;

                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;

                }
                field("Phone"; Rec."Phone")
                {
                    ApplicationArea = All;

                }
                field("Block Reason"; Rec."Block Reason")
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