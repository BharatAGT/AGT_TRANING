table 60152 "Employee Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "EMP no."; Code[20])
        {
            caption = 'EMP no.';
            DataClassification = ToBeClassified;

        }
        field(2; "EMP Name"; Text[50])
        {
            caption = 'EMP Name';
            DataClassification = ToBeClassified;

        }
        field(3; "Project No."; Integer)
        {
            caption = 'Project No.';
            DataClassification = ToBeClassified;

        }
        field(4; "Project Name"; Text[50])
        {
            caption = 'Project Name';
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; "EMP no.")
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