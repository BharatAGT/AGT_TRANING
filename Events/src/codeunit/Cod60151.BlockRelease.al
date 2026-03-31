// codeunit 60151 "Block Release"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
//     local procedure BlockRelease(var SalesHeader: Record "Sales Header")
//     var
//         DocAttachment: Record "Document Attachment";
//     begin
//         DocAttachment.Reset();
//         DocAttachment.SetRange("Table ID", Database::"Sales Header");
//         DocAttachment.SetRange("No.", SalesHeader."No.");

//         if not DocAttachment.FindFirst() then
//             Error('Bharat: You cannot release the Sales Order without attachment.');
//     end;

// }


