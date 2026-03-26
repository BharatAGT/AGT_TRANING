codeunit 60130 "Block Invoice Logic"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure CheckOverdue(var SalesHeader: Record "Sales Header")
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        OverdueAmount: Decimal;
        OverdueCount: Integer;
    begin

        CustLedgEntry.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
        CustLedgEntry.SetFilter("Due Date", '<%1', Today);
        CustLedgEntry.SetFilter("Remaining Amount", '>%1', 0);

        OverdueCount := CustLedgEntry.Count();

        if CustLedgEntry.FindSet() then
            repeat
                OverdueAmount := OverDueAmount + CustLedgEntry."Remaining Amount";
            until CustLedgEntry.Next() = 0;

        if (OverdueAmount > 10000) or (OverdueCount > 3) then begin

            if Confirm('BHARAT: Customer has overdue invoices. Do you want to continue?') then begin

                // Allow only SUPER user
                if UserId <> 'SUPER' then
                    Error('BHARAT: Only SUPER user can override.');

            end else
                Error('Posting cancelled.');
        end;
    end;
}