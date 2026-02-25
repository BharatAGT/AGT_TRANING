table 60145 "BHARAT TEST"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Age"; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Id")
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