// tableextension 60252 SalesLineExt extends "Sales Line"
// {
//     fields
//     {
//         field(60252; "Bharat32"; Text[50])
//         {
//             trigger OnValidate()
//             var
//                 SalesHeader: Record "Sales Header";
//             begin
//                 // Get related header
//                 SalesHeader.Get("Document Type", "Document No.");

//                 // Block change after release
//                 if SalesHeader.Status = SalesHeader.Status::Released then
//                     Error('Bharat: Cannot modify custom field after release');
//             end;
//         }
//     }
// }