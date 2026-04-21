codeunit 60231 "Overdue Invoice Mgt."
{
    procedure ApplyFilters(var CustLedgEntry: Record "Cust. Ledger Entry")
    var
        OverdueSetup: Record "Overdue Invoice Setup";
    begin
        OverdueSetup.Get('1');

        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SetRange(Open, true);
        CustLedgEntry.SetRange("Posting Date", OverdueSetup."Posting Date From", OverdueSetup."Posting Date To");
        CustLedgEntry.SetFilter("Due Date", '<%1', Today());
    end;

    procedure SendReminderEmails(var CustLedgEntry: Record "Cust. Ledger Entry")
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
    begin
        if CustLedgEntry.FindSet() then
            repeat
                Customer.Get(CustLedgEntry."Customer No.");

                if Customer."E-Mail" <> '' then begin
                    Subject := 'Reminder: Overdue Invoice ' + CustLedgEntry."Document No.";

                    Body := 'Dear ' + Customer.Name + ',' + '<br><br>' +
        'This is just a reminder that invoice ' + CustLedgEntry."Document No." + ' is still pending.' + '<br>' +
        'Due Date: ' + Format(CustLedgEntry."Due Date") + '<br>' +
        'Amount: ' + Format(CustLedgEntry."Remaining Amt. (LCY)") + '<br><br>' +
        'Kindly clear it as soon as possible.' + '<br><br>' +
        'Thanks & Regards,' + '<br>' +
        'Accounts Team';

                    EmailMsg.Create(Customer."E-Mail", Subject, Body, true);
                    Email.Send(EmailMsg);
                end;

            until CustLedgEntry.Next() = 0;

        Message('BR: Emails sent successfully.');
    end;
}