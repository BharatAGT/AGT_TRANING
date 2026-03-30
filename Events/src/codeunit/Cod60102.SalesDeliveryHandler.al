// codeunit 60102 "Sales Delivery Handler"
// {
//     // 🔹 Copy Delivery from Header to Line
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignHeaderValues, '', false, false)]
//     local procedure CopyFromSalesHeader(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")

//     begin

//         SalesLine."Delivery" := SalesHeader."Delivery";

//     end;
// }

// codeunit 60110 "BR Copied Item"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Item", OnCopyItemOnBeforeTargetItemInsert, '', false, false)]
//     local procedure MyProcedureBR(SourceItem: Record Item; var TargetItem: Record Item)
//     begin
//         TargetItem.Description := SourceItem.Description + ' Copied BR';
//     end;
// }










