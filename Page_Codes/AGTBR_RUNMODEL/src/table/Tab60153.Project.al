table 60153 "Project"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Project No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; "Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Project No.")
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