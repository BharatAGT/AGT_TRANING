table 60451 "BR Vendor Evaluation Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Evaluation No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if VendorRec.Get("Vendor No.") then
                    "Vendor Name" := VendorRec.Name
                else
                    "Vendor Name" := '';
            end;
        }

        field(3; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(4; "Evaluation Month"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Final Score"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(6; "Rating Status"; Option)
        {
            OptionMembers = Excellent,Good,Average,Poor;
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(7; Status; Option)
        {
            OptionMembers = Open,Completed;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Evaluation No.")
        {
            Clustered = true;
        }
    }
}