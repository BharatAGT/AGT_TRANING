pageextension 60100 "CustExt" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Highest Sales <BR>")
            {
                ApplicationArea = All;
                Caption = 'Highest Sales <BR>';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record "Cust. Ledger Entry";
                    CustRec: Record Customer;
                    MaxSales: Decimal;
                    Sales: Decimal;
                    MaxCustNo: Code[20];
                begin

                    Cust.SetRange("Document Type", Cust."Document Type"::Invoice);
                    Cust.SetRange("Posting Date", Today);


                    if Cust.FindSet() then
                        repeat
                            Sales := Cust."Sales (LCY)";

                            if Sales > MaxSales then begin
                                MaxSales := Sales;
                                MaxCustNo := Cust."Customer No.";
                            end;

                        until Cust.Next() = 0;


                    if CustRec.Get(MaxCustNo) then
                        Message(
                        'Customer With Highest Sales Today \ Customer No : %1 \ Customer Name : %2 \ Total Sales : %3',
                        CustRec."No.", CustRec.Name, MaxSales);
                end;
            }
        }
    }
}