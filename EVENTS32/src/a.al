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




// codeunit 60280 "Purchase Quote24"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document",
//         'OnAfterReleaseSalesDoc', '', false, false)]
//     local procedure CreateQuote(SalesHeader: Record "Sales Header")
//     var
//         PurchHeader: Record "Purchase Header";
//         PurchLine: Record "Purchase Line";
//         SalesLine: Record "Sales Line";
//     begin
//         // create purchase quote header
//         PurchHeader.Init();
//         PurchHeader."Document Type" := PurchHeader."Document Type"::Quote;
//         PurchHeader.Validate("Buy-from Vendor No.", ''); 
//         PurchHeader.Insert(true);

//         SalesLine.SetRange("Document Type", SalesHeader."Document Type");
//         SalesLine.SetRange("Document No.", SalesHeader."No.");

//         if SalesLine.FindSet() then begin
//             repeat
//                 // only item lines
//                 if SalesLine.Type = SalesLine.Type::Item then begin

//                     // create purchase line
//                     PurchLine.Init();
//                     PurchLine."Document Type" := PurchHeader."Document Type";
//                     PurchLine."Document No." := PurchHeader."No.";

//                     PurchLine.Validate(Type, PurchLine.Type::Item);
//                     PurchLine.Validate("No.", SalesLine."No.");
//                     PurchLine.Validate(Quantity, SalesLine.Quantity);

//                     PurchLine.Insert(true);
//                 end;

//             until SalesLine.Next() = 0;
//         end;
//     end;
// }