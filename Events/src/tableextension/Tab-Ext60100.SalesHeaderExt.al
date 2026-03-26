tableextension 60100 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(60100; "Delivery"; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if Rec.Status = Rec.Status::Released then
                    Error('You cannot modify Delivery after the order is released.');
            end;
        }
    }
}
