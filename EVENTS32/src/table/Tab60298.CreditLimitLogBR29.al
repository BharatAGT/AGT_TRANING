table 60298 "Credit Limit Log BR 29"
{
    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            caption = 'Entry No.';
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'Customer No.';

        }
        field(3; "Old Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Old Credit Limit';
        }
        field(4; "New Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'New Credit Limit';
        }
        field(5; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            caption = 'User ID';
        }
        field(6; "Changed At"; DateTime)
        {
            DataClassification = ToBeClassified;
            caption = 'Changed At';
        }
    }
}