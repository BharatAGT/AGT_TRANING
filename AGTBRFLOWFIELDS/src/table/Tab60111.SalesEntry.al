table 60111 "Sales Entry"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry no."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry Number';
            AutoIncrement = true;
        }
        field(2; "Customer no."; code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer no.';

        }
        field(3; Amount; Decimal)
        {

            DataClassification = ToBeClassified;
            Caption = 'Amount';

        }
    }

    keys
    {
        key(Key1; "Entry No.")
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