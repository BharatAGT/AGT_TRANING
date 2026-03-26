tableextension 60101 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(60100; "Delivery"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
    }
}