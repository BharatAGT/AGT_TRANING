table 60135 "CAMPUS TABLE BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Campus Id"; Code[20]) { }

        field(2; "Campus Name"; Text[100]) { }

        field(3; "Campus City"; Text[50]) { }

        field(4; "IsActive"; Boolean) { }

        field(5; "Capacity"; Integer)
        {
            trigger OnValidate()
            begin
                if "Capacity" < 0 then
                    Error('Capacity cannot be negative.');

                if "Current Enrollment" > "Capacity" then
                    Error('Current Enrollment cannot exceed Capacity.');
            end;
        }

        field(6; "Current Enrollment"; Integer)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Current Enrollment" < 0 then
                    Error('Current Enrollment cannot be negative.');

                if "Current Enrollment" > "Capacity" then
                    Error('Current Enrollment cannot exceed Capacity.');
            end;
        }
    }

    keys
    {
        key(PK; "Campus Id")
        {
            Clustered = true;
        }
    }
}