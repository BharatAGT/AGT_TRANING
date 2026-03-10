table 60115 "Master Student"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student no.';

        }
        field(2; "Student Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';

        }
        field(3; "Total Fees"; Decimal)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum("Student Payment".Amount where("Student No." = field("Student no.")));

        }
        field(4; "Total Payment"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Student Payment"
                        where("Student No." = field("Student No.")));
            Caption = 'Total Payment';
        }
        field(5; "Last Payment Amount"; Decimal)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup("Student Payment".Amount
                            where("Student No." = field("Student No.")));
            Caption = 'Last Payment Amount';

        }
        field(6; "Payment Date Filter"; Date)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowFilter;
            Caption = 'Payment Date Filter';

        }
    }

    keys
    {
        key(PK; "Student no.")
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