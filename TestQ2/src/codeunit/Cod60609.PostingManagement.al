codeunit 60609 "Posting Management"
{
    procedure ValidateBeforePosting(var Header: Record "BR Inventory Adjustment Header")
    var
        LineRec: Record "BR Inventory Adjustment Line";
    begin
        if Header.Status <> Header.Status::Approved then
            Error('Document must be approved');

        if Header.Status = Header.Status::Posted then
            Error('Document already posted');

        LineRec.Reset();
        LineRec.SetRange("Adjustment No.", Header."Adjustment No.");

        if not LineRec.FindFirst() then
            Error('Lines must exist');
    end;

    procedure CalculateTotalQuantity(AdjustmentNo: Code[20]): Decimal
    var
        LineRec: Record "BR Inventory Adjustment Line";
        TotalQty: Decimal;
    begin
        TotalQty := 0;

        LineRec.Reset();
        LineRec.SetRange("Adjustment No.", AdjustmentNo);

        if LineRec.FindSet() then
            repeat
                TotalQty += LineRec.Quantity;
            until LineRec.Next() = 0;

        exit(TotalQty);
    end;

    procedure PostAdjustment(var Header: Record "BR Inventory Adjustment Header")
    var
        LineRec: Record "BR Inventory Adjustment Line";
        TotalQty: Decimal;
    begin
        ValidateBeforePosting(Header);

        OnBeforePosting(Header);

        TotalQty := CalculateTotalQuantity(Header."Adjustment No.");

        LineRec.Reset();
        LineRec.SetRange("Adjustment No.", Header."Adjustment No.");

        if LineRec.FindSet() then
            repeat
            until LineRec.Next() = 0;

        Header.Status := Header.Status::Posted;
        Header."Posting Date" := Today;

        Header.Modify();

        OnAfterPosting(Header);

        Message('Inventory Adjustment %1 Posted Successfully. Total Quantity = %2', Header."Adjustment No.", TotalQty);
    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforePosting(var Header: Record "BR Inventory Adjustment Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterPosting(var Header: Record "BR Inventory Adjustment Header")
    begin
    end;
}