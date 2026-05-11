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

        }
        field(3; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(5; "Evaluation Month"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Final Score"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Rating Status"; Option)
        {
            OptionMembers = Excellent,Good,Average,Poor;
            DataClassification = ToBeClassified;

        }
        field(7; "Status"; Option)
        {
            OptionMembers = Open,Completed;
            DataClassification = ToBeClassified;

        }

    }


    keys
    {
        key(PK; "Evaluation No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

}