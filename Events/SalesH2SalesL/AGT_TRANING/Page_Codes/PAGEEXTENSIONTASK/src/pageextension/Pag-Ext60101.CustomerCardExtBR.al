pageextension 60101 CustomerCardExtBR extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action(LastInvoice)
            {
                ApplicationArea = All;
                Caption = 'Last Invoice <BR>';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    Amount: Decimal;
                    Amount2: Decimal;
                begin
                    SalesHeader.SetRange("Sell-to Customer No.", Rec."No.");
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);

                    if SalesHeader.FindLast() then begin
                        SalesHeader.CalcFields(Amount);
                        Amount := Round(SalesHeader.Amount);
                        Amount2 := SalesHeader.Amount;
                        Message(
                        'Last Invoice No : %1\Posting Date : %2\Amount : %3  BR',
                        SalesHeader."No.",
                        SalesHeader."Posting Date", Amount, Amount2);
                    end
                    else
                        Message('no invoice for this customer');
                end;
            }
        }
    }
}