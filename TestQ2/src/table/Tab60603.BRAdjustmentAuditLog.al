table 60603 "BR Adjustment Audit Log"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            dataclassification = tobeclassified;
            AutoIncrement = true;
        }

        field(2; "Adjustment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Action Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Action Date Time"; DateTime)
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