pageextension 60103 CustomerCardExt2BR extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action(TotalSales)
            {
                ApplicationArea = All;
                Caption = 'Total Sales <BR>';
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;

                trigger OnAction()
                var
                    CustLedger: Record "Cust. Ledger Entry";
                    TotalAmount: Decimal;
                begin
                    CustLedger.SetRange("Customer No.", Rec."No.");
                    CustLedger.SetRange("Document Type", CustLedger."Document Type"::Invoice);
                    CustLedger.CalcSums("Sales (LCY)");
                    TotalAmount := CustLedger."Sales (LCY)";
                    Message('Total Sales Amount = %1', TotalAmount);
                end;
            }
        }
    }
}