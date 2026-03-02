table 60114 "Assignmnet Service BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Service Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                rec."Tax Amount" := (18 * rec."Service Cost") / 100;
                Rec."Total Amount" := rec."Service Cost" + Rec."Tax Amount";


            end;
        }
        field(4; "Status"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = open,Releasd,Completed;
        }
        field(5; "Assignmnet Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                CustRec: Record Customer;
            begin
                if CustRec.Get("Customer No.") then
                    Rec."Customer Name" := custrec.Name;

            end;
        }
        field(7; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Tax Amount"; Decimal)
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