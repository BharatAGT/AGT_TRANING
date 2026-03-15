table 60110 "Service Assignment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Customer Name"; Text[100])
        {
        }

        field(3; "Service Cost"; Decimal)
        {
        }

        field(4; Status; Option)
        {
            OptionMembers = Open,Released,Completed;
        }

        field(5; "Created Date"; Date)
        {
        }

        field(6; "Modified Date"; Date)
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

    trigger OnInsert()
    begin
        "Created Date" := Today;
    end;

    trigger OnModify()
    begin
        "Modified Date" := Today;
    end;
}