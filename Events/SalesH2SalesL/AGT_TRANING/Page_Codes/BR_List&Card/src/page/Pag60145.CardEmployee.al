page 60145 "Card_Employee"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "EMPLOYEE_PERSONAL_INFO";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
}

