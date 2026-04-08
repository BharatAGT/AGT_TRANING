// codeunit 60270 "Auto Ship Sales Order23"
// {
//     [EventSubscriber(ObjectType::Page, Page::"sales order",
//         'OnAfterActionEvent', 'Release', false, false)]
//     local procedure AutoShip(var rec: Record "Sales Header")
//     var
//         SalesPost: Codeunit "Sales-Post";
//     begin

//         // Set posting options on header
//         rec.Ship := true;
//         rec.Invoice := false;

//         // Run posting
//         SalesPost.Run(rec);

//     end;
// }