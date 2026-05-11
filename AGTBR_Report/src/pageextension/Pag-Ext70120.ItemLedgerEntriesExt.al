pageextension 70120 ItemLedgerEntriesExt extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Reason Code"; Rec."Reason Code")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}