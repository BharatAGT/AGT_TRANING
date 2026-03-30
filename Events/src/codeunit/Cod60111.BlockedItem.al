
// codeunit 60112 "Blocked Item"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
//     local procedure PreventForbiddenItemPost(var SalesHeader: Record "Sales Header")
//     var
//         salesline: Record "Sales Line";
//     begin
//         // Loop through all lines of the sales order
//         SalesLine.SetRange("Document Type", SalesHeader."Document Type");
//         SalesLine.SetRange("Document No.", SalesHeader."No.");

//         if SalesLine.FindSet() then
//             repeat
//                 if SalesLine."No." = '1896-S' then
//                     Error('Bharat You cannot post a sales order containing item %1.', SalesLine."No.");
//             until SalesLine.Next() = 0;
//     end;
// }

