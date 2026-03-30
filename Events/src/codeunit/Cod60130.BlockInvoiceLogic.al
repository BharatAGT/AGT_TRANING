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

        CustLedgEntry.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
        CustLedgEntry.SetFilter("Due Date", '<%1', Today);
        CustLedgEntry.SetFilter("Remaining Amount", '>%1', 0);
        CustLedgEntry.SetRange(Open, true);

        OverdueCount := CustLedgEntry.Count();

        if CustLedgEntry.FindSet() then
            repeat
                OverdueAmount := OverdueAmount + CustLedgEntry."Remaining Amount";
            until CustLedgEntry.Next() = 0;

        if (OverdueAmount > 10000) or (OverdueCount > 3) then begin

            if Confirm('Bharat: Customer has overdue invoices. Continue?') then begin

                AccessControl.SetRange("User Security ID", UserSecurityId());
                AccessControl.SetRange("Role ID", 'SUPER');

                if not AccessControl.FindFirst() then
                    Error('Bharat: Only SUPER user can override.');

            end else
                Error('Bharat: Posting cancelled.');
        end;
    end;
}
