table 60106 EmployeeMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmpNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee No.';
            AutoIncrement = true;

        }
        field(2; EmpCode; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Code';
            trigger OnValidate()
            begin
                // EmpCode must be between 100 and 999
                if (EmpCode < 100) or (EmpCode > 999) then
                    Error('EmpCode must be between 100 and 999.');

                // Even / Odd logic
                if (EmpCode mod 2 = 0) then
                    EmpDept := 'Accounts'
                else
                    EmpDept := 'HR';


            end;

        }
        field(3; EmpName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Name';
            trigger OnValidate()
            begin
                // Auto-fill EmpName if blank
                if EmpName = '' then
                    EmpName := 'Employee ' + Format(EmpCode);

            end;

        }
        field(4; EmpDept; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Department';
        }
    }

    keys
    {
        key(Key1; EMPno)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Message('Value Inserted');

    end;

    trigger OnModify()
    begin
        Message('Value Modified');

    end;

    trigger OnDelete()
    begin
        Message('Deleted');

    end;

    trigger OnRename()
    begin

    end;

}