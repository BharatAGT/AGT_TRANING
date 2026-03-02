table 60141 "AGT_Company"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee Id"; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Id';
        }
        field(2; "Company Name"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Company Name';
        }
        field(3; "Address"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Address';
        }
    }

    keys
    {
        key(PK; "Employee Id")
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