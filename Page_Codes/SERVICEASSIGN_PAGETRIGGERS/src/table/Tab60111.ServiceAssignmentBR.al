table 60120 "Service Assignment BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                CustRec: Record Customer;
            begin
                if CustRec.Get("Customer No.") then begin
                    "Customer Name" := CustRec.Name;
                    "Modified Date" := Today;
                    "Modified By" := UserId;
                end;
            end;
        }

        field(3; "Customer Name"; Text[100])
        {
            Editable = false;
        }

        field(4; "Service Cost"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Service Cost" < 0 then
                    Error('Service Cost cannot be negative.');
            end;
        }

        field(5; Status; Option)
        {
            OptionMembers = Open,Released,Completed;
        }

        field(6; "Created Date"; Date)
        {
            Editable = false;
        }

        field(7; "Created By"; Code[50])
        {
            Editable = false;
        }

        field(8; "Modified Date"; Date)
        {
            Editable = false;
        }

        field(9; "Modified By"; Code[50])
        {
            Editable = false;
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
        "Created By" := UserId;
        Status := Status::Open;
    end;

    trigger OnDelete()
    begin
        if (Status = Status::Released) or
           (Status = Status::Completed) then
            Error('Cannot delete Released or Completed service assignment.');
    end;
}