table 60230 "Overdue Invoice Setup"
{
    Caption = 'Overdue Invoice Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date From"; Date)
        {
            Caption = 'Posting Date From';
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date To"; Date)
        {
            Caption = 'Posting Date To';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}