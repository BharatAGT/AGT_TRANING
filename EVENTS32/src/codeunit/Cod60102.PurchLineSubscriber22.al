// codeunit 60102 PurchLineSubscriber22
// {
//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line",
//         OnAfterAssignHeaderValues, '', false, false)]
//     local procedure OnAfterValidateItemNo(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
//     var
//         Item: Record Item;

//     begin
//         PurchLine.Bharat22 := PurchHeader.Bharat22;
//     end;
// }