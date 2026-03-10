table 60130 "AGTBR VEHICLE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vehicle ID"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Vehicle Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            

        }
        field(3; "Vehicle Wheels"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Two Wheeler","Three Wheeler","Four Wheeler","Five Wheeler","Six Wheeler","Seven Wheeler","Eight Wheeler","Nine Wheeler","Ten Wheeler";
        }
        field(4; "Vehicle Company"; Text[100])
        {

            TableRelation = "AGTBR VEHICLE TITLE".Company;
        }

    }

    keys
    {
        key(PK; "Vehicle ID")
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