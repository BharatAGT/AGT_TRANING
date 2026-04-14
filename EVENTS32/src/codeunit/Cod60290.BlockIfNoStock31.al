// codeunit 60290 "Block If No Stock"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
//     local procedure CheckInventory(var Rec: Record "Purchase Line")
//     var
//         Item: Record Item;
//     begin
//         // checking only for item type 
//         if Rec.Type = Rec.Type::Item then begin

//             // getting item record to check inventory based on primary key
//             if Item.Get(Rec."No.") then begin

//                 // because inventory is a flow field we need to calculate it before using
//                 item.CalcFields(Inventory);

//                 // inventory check
//                 if Rec.Quantity > Item.Inventory then
//                     Error('Bharat: Not enough stock for Item');
//             end;

//         end;
//     end;
// }