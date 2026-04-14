// codeunit 60252 CheckField32
// {
//     [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'Release', false, false)]
//     local procedure CheckMyField(var Rec: Record "Sales Header")
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         // Filter lines for this order
//         SalesLine.Reset();
//         SalesLine.SetRange("Document Type", Rec."Document Type");
//         SalesLine.SetRange("Document No.", Rec."No.");

//         // Loop through lines
//         if SalesLine.FindSet() then begin
//             repeat
//                 if SalesLine."Bharat32" = '' then
//                     Error('Bharat: Fill custom field before release ');
//             until SalesLine.Next() = 0;
//         end;
//     end;
// }