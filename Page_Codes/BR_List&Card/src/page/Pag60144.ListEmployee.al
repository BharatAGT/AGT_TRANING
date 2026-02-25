page 60144 "List_Employee"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "EMPLOYEE_PERSONAL_INFO";
    CardPageId = "Card_Employee";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Employee Id"; Rec."Employee Id")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Id';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                field("Employee Address"; Rec."Employee Address")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Address';
                }
                field("Employee Phone"; Rec."Employee Phone")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Phone';
                }
                field("Employee Email"; Rec."Employee Email")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Email';
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