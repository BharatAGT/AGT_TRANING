// codeunit 60251 "Sales Log CU "
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document",
//         'OnAfterReleaseSalesDoc', '', false, false)]
//     local procedure WhenReleased(var SalesHeader: Record "Sales Header")
//     begin
//         InsertLog(SalesHeader, 'Release');
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document",
//         'OnAfterReopenSalesDoc', '', false, false)]
//     local procedure WhenReopen(var SalesHeader: Record "Sales Header")
//     begin
//         InsertLog(SalesHeader, 'Reopen');
//     end;

//     local procedure InsertLog(SalesHeader: Record "Sales Header"; ActionText: Text)
//     var
//         Log: Record "Sales Log";
//     begin
//         Log.Init();
//         Log."Document No." := SalesHeader."No.";
//         Log."User ID" := UserId;
//         Log."Date Time" := CurrentDateTime;

//         if ActionText = 'Release' then
//             Log."Action" := Log."Action"::Release
//         else
//             Log."Action" := Log."Action"::Reopen;

//         Log.Insert();
//     end;
// }