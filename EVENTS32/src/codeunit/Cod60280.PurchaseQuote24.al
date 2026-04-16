// codeunit 60280 "Purchase Quote24"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document",
//         'OnAfterReleaseSalesDoc', '', false, false)]
//     local procedure CreateQuote(SalesHeader: Record "Sales Header")
//     var
//         PurchHeader: Record "Purchase Header";
//         PurchLine: Record "Purchase Line";
//         SalesLine: Record "Sales Line";
//         Item: Record Item;
//     begin
//         // Create header
//         PurchHeader.Init();
//         PurchHeader."Document Type" := PurchHeader."Document Type"::Quote;
//         if Item.Get(SalesLine."No.") then
//             if Item."Vendor No." <> '' then
//                 PurchHeader.Validate("Buy-from Vendor No.", Item."Vendor No.");
//         PurchHeader.Insert(true);

//         // Get sales lines
//         SalesLine.Reset();
//         SalesLine.SetRange("Document Type", SalesHeader."Document Type");
//         SalesLine.SetRange("Document No.", SalesHeader."No.");

//         if SalesLine.FindSet() then
//             repeat
//                 if SalesLine.Type = SalesLine.Type::Item then begin
//                     PurchLine.Init();
//                     PurchLine."Document Type" := PurchHeader."Document Type";
//                     PurchLine."Document No." := PurchHeader."No.";

//                     PurchLine.Validate("No.", SalesLine."No.");
//                     PurchLine.Validate(Quantity, SalesLine.Quantity);

//                     PurchLine.Insert(true);
//                 end;
//             until SalesLine.Next() = 0;
//     end;
// }