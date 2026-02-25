page 56101 "Student Master List By Bharat"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentMasterByBharat;

    layout
    {
        area(Content)
        {
            repeater(StudentData)
            {
                field(StudentName; Rec.StudentName)
                {
                    Caption = 'Student Name Page';

                }
                field(StudentRoll; Rec.StudentRoll)
                {
                    Caption = 'Student Roll Page';

                }
                field(StudentAddress; Rec.StudentAddress)
                {
                    Caption = 'Student Address Page';

                }
            }
        }
    }


}