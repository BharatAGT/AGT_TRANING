table 60601 "BR Inventory Adjustment Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Adjustment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }

        field(3; "Request Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Requested By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Posted;
        }

        field(6; "Approved By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."Approver ID";
        }
    }

    keys
    {
        key(PK; "Adjustment No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Request Date" := Today;
        "Requested By" := UserId;
        Status := Status::Open;
    end;
}