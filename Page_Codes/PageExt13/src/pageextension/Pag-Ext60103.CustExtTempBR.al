pageextension 60103 "CustExtTempBR" extends "Customer List"
{
    actions
    {
        addfirst(Processing)
        {
            action("High Value Customers")
            {
                ApplicationArea = All;
                Caption = 'High Value <BR>';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record Customer;
                    TempCust: Record Customer temporary;
                    CountCust: Integer;
                begin
                    Cust.SetFilter(Balance, '>50');

                    if Cust.FindSet() then
                        repeat
                            TempCust.Init();
                            TempCust := Cust;
                            TempCust.Insert();
                        until Cust.Next() = 0;


                    CountCust := TempCust.Count;


                    if TempCust.FindLast() then
                        Message(
                        'High Value Customers : %1 \ Last Customer in Temp Table : %2 \ Customer Name : %3',
                        CountCust,
                        TempCust."No.",
                        TempCust.Name);
                end;
            }
        }
    }
}