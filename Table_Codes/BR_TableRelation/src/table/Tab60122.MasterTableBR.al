table 60184 "Master Table BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Item Type"; Option)
        {
            OptionMembers = Service,Inventory;
        }

        field(4; "Service Cost"; Decimal)
        {
        }

        field(5; "Total Assignments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Assignment Table BR"
                                WHERE("Item No." = FIELD("Item No.")));
        }
    }

    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
}