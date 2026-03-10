table 60185 "Assignment Table BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Item No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Master Table BR"."Item No." where("Item Type" = const(service));

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
            DataClassification = ToBeClassified;
        }
        field(4; "Service Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Technician Name"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Assignment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Assignment No.")
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