table 56101 StudentMasterByBharat
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key(Base)';
            AutoIncrement = true;

        }

        field(2; StudentName; Text[100])

        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';
            // MaskType = Concealed;

        }

        field(3; StudentRoll; Integer)

        {
            DataClassification = ToBeClassified;
            Caption = 'Student Roll';
        }

        field(4; StudentAddress; Text[100])

        {
            DataClassification = ToBeClassified;
            Caption = 'Student Address';
        }
    }

    keys
    {
        key(Key1; PK)
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