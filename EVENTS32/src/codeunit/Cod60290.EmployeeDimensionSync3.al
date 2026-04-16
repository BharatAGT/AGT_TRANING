// codeunit 60290 EmployeeDimensionSync3
// {
//     // INSERT
//     [EventSubscriber(ObjectType::Table, Database::"Default Dimension",
//         'OnAfterInsertEvent', '', false, false)]
//     local procedure OnInsert(var Rec: Record "Default Dimension")
//     var
//         Employee: Record Employee;
//     begin
//         if Rec."Table ID" <> Database::Employee then
//             exit;

//         if Employee.Get(Rec."No.") then begin
//             Employee.Validate("BR Dimension Code", Rec."Dimension Value Code");
//             Employee.Modify(true);
//         end;
//     end;

//     // MODIFY
//     [EventSubscriber(ObjectType::Table, Database::"Default Dimension",
//         'OnAfterModifyEvent', '', false, false)]
//     local procedure OnModify(var Rec: Record "Default Dimension")
//     var
//         Employee: Record Employee;
//     begin
//         if Rec."Table ID" <> Database::Employee then
//             exit;

//         if Employee.Get(Rec."No.") then begin
//             Employee.Validate("BR Dimension Code", Rec."Dimension Value Code");
//             Employee.Modify(true);
//         end;
//     end;

//     // DELETE
//     [EventSubscriber(ObjectType::Table, Database::"Default Dimension",
//         'OnAfterDeleteEvent', '', false, false)]
//     local procedure OnDelete(var Rec: Record "Default Dimension")
//     var
//         Employee: Record Employee;
//     begin
//         if Rec."Table ID" <> Database::Employee then
//             exit;

//         if Employee.Get(Rec."No.") then begin
//             Employee."BR Dimension Code" := '';
//             Employee.Modify(true);
//         end;
//     end;
// }