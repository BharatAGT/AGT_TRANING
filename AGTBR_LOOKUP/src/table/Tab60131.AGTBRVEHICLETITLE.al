table 60131 "AGTBR VEHICLE TITLE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Company; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Wheels; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Two Wheeler","Three Wheeler","Four Wheeler","Five Wheeler","Six Wheeler","Seven Wheeler","Eight Wheeler","Nine Wheeler","Ten Wheeler";

        }
    }

    keys
    {
        key(PK; Company, Wheels)
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