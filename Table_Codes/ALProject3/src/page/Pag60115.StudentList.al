page 60115 "Student List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = STUDENT;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;

                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;

                }
                field("Student Age"; Rec."Student Age")
                {
                    ApplicationArea = All;

                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;

                }
                field("DOB"; Rec."DOB")
                {
                    ApplicationArea = All;

                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;

                }
                field("Total Courses"; Rec."Total Courses")
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