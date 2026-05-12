table 60602 "BR Inventory Adjustment Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Adjustment No."; Code[20])
        {
            dataclassification = tobeclassified;

        }

        field(2; "Line No."; Integer)
        {
            dataclassification = tobeclassified;
        }

        field(3; "Item No."; Code[20])
        {
            dataclassification = tobeclassified;
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("Item No.") then
                    Description := ItemRec.Description;
            end;
        }

        field(4; Description; Text[100])
        {
            dataclassification = tobeclassified;
        }

        field(5; Quantity; Decimal)
        {
            dataclassification = tobeclassified;
            trigger OnValidate()
            begin
                if Quantity <= 0 then
                    Error('Quantity must be positive');

                "Total Cost" := Quantity * "Unit Cost";
            end;
        }

        field(6; "Unit Cost"; Decimal)
        {
            dataclassification = tobeclassified;

            trigger OnValidate()
            begin
                "Total Cost" := Quantity * "Unit Cost";
            end;
        }

        field(7; "Total Cost"; Decimal)
        {
            Editable = false;
            dataclassification = tobeclassified;
        }
    }

    keys
    {
        key(PK; "Adjustment No.", "Line No.")
        {
            Clustered = true;
        }
    }
}