pageextension 60112 "Vendor ext BR" extends "Vendor List"
{
    actions
    {
        addlast(Processing)
        {
            action(CheckVendorBalance)
            {
                ApplicationArea = All;
                Caption = 'Vendor Balance > 0 BR';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Vend: Record Vendor;
                begin
                    Vend.SetFilter(Balance, '>0');

                    if Vend.FindFirst() then
                        Message('Vendor with Balance > 0 : %1', Vend.Name)
                    else
                        Message('No Vendor Found');
                end;
            }
        }
    }
}