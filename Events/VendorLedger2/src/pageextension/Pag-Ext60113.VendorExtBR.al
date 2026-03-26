pageextension 60113 "VendorExtBR" extends "Vendor Ledger Entries"
{
    layout
    {
        // This places your field before the 'General' FastTab
        addafter("Document No.")
        {
            field("Bharat"; Rec."Bharat")
            {
                ApplicationArea = All;

            }
        }
    }
}