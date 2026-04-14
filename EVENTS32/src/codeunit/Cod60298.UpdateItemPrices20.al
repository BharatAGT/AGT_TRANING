// codeunit 60298 UpdateItemPrices20
// {
//     // Sales Invoice Line
//     [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", OnAfterInsertEvent, '', false, false)]
//     local procedure UpdateSales(var Rec: Record "Sales Invoice Line")
//     var
//         Item: Record Item;
//     begin
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Item.Get(Rec."No.") then begin
//             Item.Validate("Last Sales Price BR", Rec."Unit Price");
//             Item.Modify();
//         end;
//     end;



//     // Purchase Invoice Line
//     [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Line", OnAfterInsertEvent, '', false, false)]
//     local procedure UpdatePurchase(var Rec: Record "Purch. Inv. Line")
//     var
//         Item: Record Item;
//     begin
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Item.Get(Rec."No.") then begin
//             Item.Validate("Last Purchase Price BR", Rec."Direct Unit Cost");
//             Item.Modify();
//         end;

//     end;
// }