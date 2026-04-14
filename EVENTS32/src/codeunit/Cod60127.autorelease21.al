// codeunit 60127 AutoRelease21
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeTestStatusOpen', '', true, true)]
//     local procedure OnBeforeTestStatusOpen(
//         var SalesLine: Record "Sales Line";
//         var SalesHeader: Record "Sales Header";
//         var IsHandled: Boolean)
//     var
//         ReleaseSalesDoc: Codeunit "Release Sales Document";
//     begin
//         if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin


//             if SalesHeader.Status = SalesHeader.Status::Released then begin
//                 IsHandled := true;
//                 ReleaseSalesDoc.Reopen(SalesHeader);


//             end;
//         end;
//     end;


//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
//     local procedure OnAfterModify(var Rec: Record "Sales Line")
//     var
//         SalesHeader: Record "Sales Header";
//         ReleaseSalesDoc: Codeunit "Release Sales Document";
//     begin
//         if not SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
//             exit;

//         if SalesHeader.Status = SalesHeader.Status::Open then begin
//             ReleaseSalesDoc.Run(SalesHeader);
//         end;
//     end;
// }