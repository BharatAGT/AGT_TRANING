table 60128 "ITEM TEST"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                CustomerRec: Record Customer;
            begin
                if CustomerRec.Get("Customer No.") then begin
                    "Customer Address" := CustomerRec."Address";
                    "Customer Name" := CustomerRec."Name";
                end;
            end;
        }

        field(2; "Customer Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."Phone No." where("No." = field("Customer No."));

        }
        field(3; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;


        }
        field(4; "Customer Address"; Text[250])
        {
            DataClassification = ToBeClassified;



        }
    }

    keys
    {
        key(PK; "Customer No.", "Customer Address")
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