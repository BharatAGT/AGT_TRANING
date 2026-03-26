codeunit 60120 "Salesperson Auto Assign"
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

        if Salesperson.FindSet() then
            repeat
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SetRange("Salesperson Code", Salesperson.Code);
                Count := SalesHeader.Count();

                SalesInvoiceHeader.SetRange("Salesperson Code", Salesperson.Code);
                Count := Count + SalesInvoiceHeader.Count();

                if (SalespersonCode = '') or (Count < Min) then begin
                    Min := Count;
                    SalespersonCode := Salesperson.Code;
                end;

                SalesHeader.Reset();
                SalesInvoiceHeader.Reset();
            until Salesperson.Next() = 0;

        Rec."Salesperson Code" := SalespersonCode;
    end;
}