table 60185 "Assignment Table BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
        }

        field(2; "Item No."; Code[20])
        {
            TableRelation = "Master Table BR"."Item No."
                            WHERE("Item Type" = CONST(Service));

            trigger OnValidate()
            var
                ItemRec: Record "Master Table BR";
            begin
                if ItemRec.Get("Item No.") then begin
                    "Item Name" := ItemRec."Item Name";
                    "Service Cost" := ItemRec."Service Cost";
                end;
            end;
        }

        field(3; "Item Name"; Text[100])
        {
        }

        field(4; "Service Cost"; Decimal)
        {
        }

        field(5; "Technician Name"; Text[100])
        {
        }

        field(6; "Assignment Date"; Date)
        {
        }
    }

    keys
    {
        key(PK; "Assignment No.")
        {
            Clustered = true;
        }
    }
}