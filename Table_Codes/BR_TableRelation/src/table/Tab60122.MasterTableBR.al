table 60184 "Master Table BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; "Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Service,Inventory;
        }
        field(4; "Service Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Total Assignments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Assignment Table BR" WHERE("Item No." = FIELD("Item No.")));
        }
    }

    keys
    {
        key(PK; "Item No.")
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