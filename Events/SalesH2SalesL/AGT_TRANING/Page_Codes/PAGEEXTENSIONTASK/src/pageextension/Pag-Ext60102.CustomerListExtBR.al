pageextension 60102 CustomerListExtBR extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action(LatestCustomerToday)
            {
                ApplicationArea = All;
                Caption = 'Latest Customer Today  <BR>';
                Promoted = true;




                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    //Cust.SetFilter(SystemCreatedAt, '%1', CreateDateTime(Today, 0T));

                    cust.SetRange("Date Filter", Today);

                    if Cust.FindLast() then
                        Message(
                        'Latest Customer Created Today \Customer No : %1 \Name : %2',
                        Cust."No.",
                        Cust.Name);
                end;
            }
        }
    }
}