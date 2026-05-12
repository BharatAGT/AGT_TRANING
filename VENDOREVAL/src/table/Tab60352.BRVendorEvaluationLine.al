table 60452 "BR Vendor Evaluation Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Evaluation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Vendor Evaluation Header"."Evaluation No.";
        }

        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Criteria Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Criteria Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(5; Score; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Score > 100 then
                    Error('Score cannot exceed 100.');
            end;
        }

        field(6; Weightage; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Weightage = 0 then
                    Error('Weightage cannot be zero.');
            end;
        }

        field(7; "Weighted Score"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Evaluation No.", "Line No.")
        {
            Clustered = true;
        }
    }
}