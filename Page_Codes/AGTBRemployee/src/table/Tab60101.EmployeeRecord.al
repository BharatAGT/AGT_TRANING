table 60101 EmployeeRecord
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmployeeID; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee ID';

        }
        field(2; EmployeeName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Name';

        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';

        }
        field(4; TaskCompletionHour; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Completion Hour';

        }
        field(5; CompletedDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Completion Date';

        }
    }

    keys
    {
        key(Key1; EmployeeID)
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

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}