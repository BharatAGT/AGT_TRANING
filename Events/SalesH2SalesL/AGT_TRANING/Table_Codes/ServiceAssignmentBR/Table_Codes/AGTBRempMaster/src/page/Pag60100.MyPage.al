page 60106 AGTBRemployee
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeMaster;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(EmpNo; Rec.EmpNo)
                {
                    Caption = 'Employee No.';

                }
                field(EmpCode; Rec.EmpCode)
                {
                    Caption = 'Employee Code';

                }
                field(EmpName; Rec.EmpName)
                {
                    Caption = 'Employee Name';

                }
                field(EMPdept; Rec.EMPdept)
                {
                    Caption = 'Employee Department';

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