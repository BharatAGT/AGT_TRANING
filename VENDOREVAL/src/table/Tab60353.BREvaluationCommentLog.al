table 60453 "BR Evaluation Comment Log"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(2; "Evaluation No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}