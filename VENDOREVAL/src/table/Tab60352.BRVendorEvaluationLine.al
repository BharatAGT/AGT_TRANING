table 60452 "BR Vendor Evaluation Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Evaluation No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            autoIncrement = true;
        }
        field(3; "Criteria Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Criteria Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Score"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                if Score > 100 then
                    Error('Score cannot be greater than 100.');
            end;
        }
        field(6; "Weightage"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Weightage < 0 then
                    Error('Weightage cannot be negative.');
            end;
        }
        field(7; "Weighted Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Evaluation No.", "Line No.")
        {
            Clustered = true;
        }
    }


}