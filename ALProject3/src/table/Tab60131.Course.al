table 60131 Course
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Course Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Course Code")
        {
            Clustered = true;
        }
    }

}