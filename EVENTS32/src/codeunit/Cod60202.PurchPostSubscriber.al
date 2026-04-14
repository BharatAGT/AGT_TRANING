// // purchase order to purchase line 

// // codeunit 60223 "Purch Post Flow"
// // {
// //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", , '', false, false)]
// //     local procedure CopyHeaderToItemJnlLine(
// //      var ItemJnlLine: Record "Item Journal Line";
// //      PurchHeader: Record "Purchase Header";
// //     PurchLine: Record "Purchase Line")

// //     var
// //         ItemJnlLine: Record "Item Journal Line";

// //     begin
// //         ItemJnlLine."Bharat" := PurchaseHeader."Bharat";
// //     end;

// // }

// codeunit 60202 "Purch Line to ItemJou."
// {

//     // Subscriber: Purchase Post → Item Journal Line
//     [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', false, false)]
//     local procedure CopyToItemJnlLine(
//         var ItemJnlLine: Record "Item Journal Line";
//         PurchLine: Record "Purchase Line")

//     begin
//         ItemJnlLine."Bharat" := PurchLine."Bharat";
//     end;

// }

// codeunit 60221 "Item Jnl to ILE Flow"
// {

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
//     local procedure CopyToILE(
//         var NewItemLedgEntry: Record "Item Ledger Entry";
//         var ItemJournalLine: Record "Item Journal Line";
//         var ItemLedgEntryNo: Integer)

//     begin
//         NewItemLedgEntry."Bharat" := ItemJournalLine."Bharat";
//     end;

// }