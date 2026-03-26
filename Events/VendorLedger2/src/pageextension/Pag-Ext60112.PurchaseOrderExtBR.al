pageextension 60112 "PurchaseOrderExtBR" extends "Purchase Order"
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