page 60100 "Employee List BR"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Table";
    CardPageId = "Employee Card BR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("EMP no."; Rec."EMP no.")
                {
                    ApplicationArea = All;
                    Caption = 'Employee No.';
                }
                field("EMP Name"; Rec."EMP Name")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    Caption = 'Project No.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Caption = 'Project Name';
                }
            }
        }
    }
}