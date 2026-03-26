// codeunit 60110 "BR Copied Item"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Item", OnCopyItemOnBeforeTargetItemInsert, '', false, false)]
//     local procedure MyProcedureBR(SourceItem: Record Item; var TargetItem: Record Item)
//     begin
//         TargetItem.Description := SourceItem.Description + ' Copied BR';
//     end;
// }