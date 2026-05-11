codeunit 70116 TransferReasonCodeOnILE
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line",
    'OnAfterInitItemLedgEntry', '', false, false)]

    local procedure OnAfterInitItemLedgEntry(
        var NewItemLedgEntry: Record "Item Ledger Entry";
        ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."Reason Code" :=
            ItemJournalLine."Reason Code";
    end;
}