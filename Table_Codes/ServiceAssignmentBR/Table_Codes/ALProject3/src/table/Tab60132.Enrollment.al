table 60132 Enrollment
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Enrollment Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Student No.", "Course Code")
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