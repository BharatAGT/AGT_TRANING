// codeunit 60275 FieldFlowHeaderToShip28
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post",
//     'OnInsertShipmentHeaderOnAfterTransferfieldsToSalesShptHeader', '', false, false)]

//     local procedure CopyField(
//         SalesHeader: Record "Sales Header";
//         var SalesShptHeader: Record "Sales Shipment Header")
//     begin
//         SalesShptHeader."Bharat30" := SalesHeader."Bharat30";
//     end;
// }