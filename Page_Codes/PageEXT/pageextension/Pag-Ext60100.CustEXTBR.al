pageextension 60192 "CustEXT_Bharat" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("Service Information Bharat")
            {
                Caption = 'Service Information';
            }
        }

        move(Contact; "Service Information BR");
        move("Phone No."; "Service Information BR");
        move("E-Mail"; "Service Information BR");

        modify(Name)
        {
            Editable = IsEditable;
        }

        modify("Credit Limit (LCY)")
        {
            Editable = IsEditable;
        }

        modify("Phone No.")
        {
            Editable = IsEditable;
        }
    }

    trigger OnAfterGetRecord()
    begin
        IsEditable := Rec.Blocked <> Rec.Blocked::All;
    end;

    var
        IsEditable: Boolean;
}