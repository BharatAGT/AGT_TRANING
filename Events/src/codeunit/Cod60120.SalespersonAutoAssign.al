codeunit 60140 "Salesperson Auto Assign"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignSalesperson(var Rec: Record "Sales Header")
    var
        Salesperson: Record "Salesperson/Purchaser";
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Min: Integer;
        Count: Integer;
        SalespersonCode: Code[20];
    begin
        // Only for Orders
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;

        min := 100;
        if Salesperson.FindSet() then
            repeat
                //filter order type 
                count := 0;
                SalesHeader.Reset();
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SetRange("Salesperson Code", Salesperson.Code);
                Count := SalesHeader.Count();
                // filter invoice type
                SalesInvoiceHeader.Reset();
                SalesInvoiceHeader.SetRange("Salesperson Code", Salesperson.Code);
                Count := Count + SalesInvoiceHeader.Count();

                if (Count < Min) then begin
                    Min := Count;
                    SalespersonCode := Salesperson.Code;
                end;


            until Salesperson.Next() = 0;

        Rec."Salesperson Code" := SalespersonCode;
        Rec.Modify();
    end;
}