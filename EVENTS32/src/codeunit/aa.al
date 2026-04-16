tableextension 60200 EmployeeExt extends Employee
{
    fields
    {
        field(60100; "BR Dimension Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Dimension Code BR';
        }
    }
}