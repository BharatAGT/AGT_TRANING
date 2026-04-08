
// codeunit 60131 "Block Invoice"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
//     local procedure CheckOverdue(var SalesHeader: Record "Sales Header")
//     var
//         CustLedgEntry: Record "Cust. Ledger Entry";
//         AccessControl: Record "Access Control";
//         OverdueAmount: Decimal;
//         OverdueCount: Integer;
//         IsSuperUser: Boolean;
//     begin
//         CustLedgEntry.Reset();


//         CustLedgEntry.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
//         CustLedgEntry.SetFilter("Due Date", '<%1', Today);
//         CustLedgEntry.SetRange(Open, true);
//         CustLedgEntry.SetAutoCalcFields("Remaining Amount");
//         OverdueCount := CustLedgEntry.Count();

//         if CustLedgEntry.FindSet() then
//             repeat
//                 OverdueAmount += CustLedgEntry."Remaining Amount";
//             until CustLedgEntry.Next() = 0;


//         AccessControl.Reset();
//         AccessControl.SetRange("User Security ID", UserSecurityId());
//         AccessControl.SetRange("Role ID", 'SUPER');
//         IsSuperUser := AccessControl.FindFirst();


//         if (OverdueAmount > 10000) or (OverdueCount > 3) then begin

//             if not IsSuperUser then
//                 Error('Bharat: Only SUPER user can override posting due to overdue invoices.');


//             if not Confirm('Bharat: Customer has overdue invoices. Do you want to continue posting?') then
//                 Error('Bharat:Posting cancelled by user.');
//         end;
//     end;
// }

