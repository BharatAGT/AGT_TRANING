pageextension 60104 "SalesOrderExtBR" extends "Sales Order List"
{
    actions
    {
        addlast(Processing)
        {
            action("Future Posting Orders")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesHdr: Record "Sales Header";
                    FutureCount: Integer;
                begin
                    // Filter Sales Orders
                    SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::Order);

                    // Loop through orders
                    if SalesHdr.FindSet() then
                        repeat
                            // Check Posting Date > WorkDate
                            if SalesHdr."Posting Date" > WorkDate() then
                                FutureCount := FutureCount + 1;

                        until SalesHdr.Next() = 0;

                    // Get last order
                    if SalesHdr.FindLast() then
                        Message(
                        'Orders with Future Posting Date : %1 \ Last Order No : %2',
                        FutureCount,
                        SalesHdr."No.");
                end;
            }
        }
    }
}