pageextension 60102 "CustCardExtBR" extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action("Invoice Summary")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Invoice Sumaary <BR>';

                trigger OnAction()
                var
                    TotalInvoices: Integer;
                    TotalAmount: Decimal;
                    AvgAmount: Decimal;
                begin

                    CalculateInvoiceSummary(Rec."No.", TotalInvoices, TotalAmount, AvgAmount);

                    Message(
                    'Customer Invoice Summary \ Customer No : %1 \ Total Invoices : %2 \ Total Amount : %3 \ Average Invoice Amount : %4',
                    Rec."No.", TotalInvoices, TotalAmount, AvgAmount);
                end;
            }
        }
    }

    procedure CalculateInvoiceSummary
    (
        CustomerNo: Code[20];
        var TotalInvoices: Integer;
        var TotalAmount: Decimal;
        var AvgAmount: Decimal);
    var
        SaleHeader: Record "Sales Header";
    begin

        SaleHeader.SetRange("Sell-to Customer No.", CustomerNo);
        SaleHeader.SetRange("Document Type", SaleHeader."Document Type"::Invoice);
        SaleHeader.SetRange("Posting Date", 20250313D, 20260313D);



        if SaleHeader.FindSet() then
            repeat
                TotalInvoices := TotalInvoices + 1;
                SaleHeader.CalcFields(Amount);
                TotalAmount := TotalAmount + SaleHeader.Amount;
            until SaleHeader.Next() = 0;

        if TotalInvoices > 0 then
            AvgAmount := Round(TotalAmount / TotalInvoices, 0.01);
    end;
}