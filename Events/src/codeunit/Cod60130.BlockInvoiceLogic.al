<<<<<<< HEAD
/-- 1. Block invoice  only if:
The overdue amount exceeds  (₹10,000).
OR the number of overdue invoices is more than a limit (3 overdue invoices).
Also:
If a invoice is blocked, show a confirmation dialog.
Only users with a  SUPER user should be allowed to override and continue posting. --/


codeunit 60131 "Block Invoice"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure CheckOverdue(var SalesHeader: Record "Sales Header")
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        AccessControl: Record "Access Control";
        OverdueAmount: Decimal;
        OverdueCount: Integer;
    begin
=======
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
>>>>>>> 4291dc2 (initial commit with Events)

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

<<<<<<< HEAD
            end else
                Error('Bharat: Posting cancelled.');
        end;
    end;
}
=======
//             if not Confirm('Bharat: Customer has overdue invoices. Do you want to continue posting?') then
//                 Error('Bharat:Posting cancelled by user.');
//         end;
//     end;
// }
>>>>>>> 4291dc2 (initial commit with Events)
