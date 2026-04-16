// codeunit 60110 "My Custom Field Transfer"
// {
//     // From purchase header to gen journal line
//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
//     local procedure PurToGen(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
//     begin
//         GenJournalLine.Bharat := purchaseHeader.Bharat;
//     end;

//     // from  Gen. Journal to Vendor Ledger entry
//     [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", OnAfterCopyVendLedgerEntryFromGenJnlLine, '', false, false)]
//     local procedure GenToVendor(
//    var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
//     begin
//         VendorLedgerEntry."Bharat" := GenJournalLine."Bharat";
//     end;
// }

