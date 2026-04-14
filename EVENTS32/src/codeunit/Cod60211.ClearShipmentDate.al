// codeunit 60211 "Clear Shipment Date"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Header",
//         'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
//     local procedure ClearShipmentDate(var Rec: Record "Sales Header")
//     begin
//         Rec."Shipment Date" := 0D;
//     end;
// }