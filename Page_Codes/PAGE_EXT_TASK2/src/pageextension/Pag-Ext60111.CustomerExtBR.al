pageextension 60111 CustomerExtBR extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Search Country"; Bharat)
            {
                ApplicationArea = All;
                Caption = 'Country/Region : BR';

                trigger OnValidate()
                var
                    Cust: Record Customer;
                begin
                    Cust.SetRange("Country/Region Code", bharat);

                    if Cust.FindFirst() then
                        Message('First Customer: %1 BR', Cust.Name)
                    else
                        Message('No customer found');
                end;
            }
        }
    }
    var
        bharat: Text[20];
}