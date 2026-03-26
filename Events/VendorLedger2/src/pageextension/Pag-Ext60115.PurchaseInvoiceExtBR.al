pageextension 60115 "PurchaseInvoiceExtBR" extends "Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Bharat"; Rec."Bharat")
            {
                ApplicationArea = All;
            }
        }
    }
}
