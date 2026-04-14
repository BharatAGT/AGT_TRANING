// //  Stop posting and releasing the sales Order if no 
// // attachment is attached.

// codeunit 60152 "Block Posting"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
//     local procedure BlockPosting(var SalesHeader: Record "Sales Header")
//     var
//         DocAttachment: Record "Document Attachment";
//     begin
//         DocAttachment.Reset();
//         DocAttachment.SetRange("Table ID", Database::"Sales Header");
//         DocAttachment.SetRange("No.", SalesHeader."No.");

//         if not DocAttachment.FindFirst() then
//             Error('Bharat: You cannot post the Sales Order without attachment.');
//     end;
// }
