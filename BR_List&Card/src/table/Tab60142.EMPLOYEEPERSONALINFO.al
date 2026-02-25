table 60142 "EMPLOYEE_PERSONAL_INFO"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee Id"; Text[20])
        {
            DataClassification = ToBeClassified;
            tooltip = 'Employee Id';

        }
        field(2; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Employee Address"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Employee Phone"; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Employee Email"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Employee Name")
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