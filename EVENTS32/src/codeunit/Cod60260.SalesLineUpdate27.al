// codeunit 60260 "Sales Line Update 27"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post",
//         'OnBeforePostSalesDoc', '', false, false)]
//     local procedure AddNameInLastLine(var SalesHeader: Record "Sales Header")
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         // Filter lines for this document
//         SalesLine.Reset();
//         SalesLine.SetRange("Document Type", SalesHeader."Document Type");
//         SalesLine.SetRange("Document No.", SalesHeader."No.");

//         // Get LAST line
//         if SalesLine.FindLast() then begin
//             // Modify description
//             //SalesLine.Description := SalesLine.Description + ' - Bharat Ranjan';
//             SalesLine.Validate("Description", SalesLine.Description + ' - Bharat Ranjan');
//             SalesLine.Modify(true);

//         end;
//     end;
// }