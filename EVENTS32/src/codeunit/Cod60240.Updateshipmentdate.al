// codeunit 60240 "Update shipment date"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post",
//         'OnAfterPostSalesDoc', '', false, false)]
//     local procedure UpdateShipmentDate(SalesHeader: Record "Sales Header")
//     var
//         SalesShipmentHeader: Record "Sales Shipment Header";
//     begin
//         SalesShipmentHeader.Reset();
//         SalesShipmentHeader.SetRange("Order No.", SalesHeader."No.");

//         if SalesShipmentHeader.FindLast() then begin
//             SalesHeader.Validate("Shipment Date", SalesShipmentHeader."Posting Date");
//         end;
//     end;
// }