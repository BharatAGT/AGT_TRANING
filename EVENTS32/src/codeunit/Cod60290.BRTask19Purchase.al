codeunit 60290 "BRTask 19 Purchase"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, "Qty. to Receive", true, true)]
    local procedure TrackingSpecificationTable(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    var
        ResEntry: Record "Reservation Entry";
        ItemRec: Record Item;
        EntryNo: Integer;
    begin
        if Rec."Qty. to Receive" = xRec."Qty. to Receive" then
            exit;

        if Rec.Type <> Rec.Type::Item then
            exit;

        if not ItemRec.Get(Rec."No.") then
            exit;

        if ItemRec."Item Tracking Code" = '' then
            Error('BR %1', ItemRec."No.");

        ResEntry.Reset();
        ResEntry.SetRange("Source Type", Database::"Purchase Line");
        ResEntry.SetRange("Source ID", Rec."Document No.");
        ResEntry.SetRange("Source Ref. No.", Rec."Line No.");
        ResEntry.SetRange("Item No.", Rec."No.");
        ResEntry.SetRange("Location Code", Rec."Location Code");
        ResEntry.SetRange("Reservation Status", ResEntry."Reservation Status"::Surplus);

        if ResEntry.FindFirst() then begin
            ResEntry.Validate("Quantity (Base)", Rec."Qty. to Receive (Base)");
            ResEntry.Validate("Quantity", Rec."Qty. to Receive");
            ResEntry.Validate("Expected Receipt Date", Rec."Expected Receipt Date");
            ResEntry.Modify(true);
        end else begin
            EntryNo := ResEntry.GetLastEntryNo() + 1;

            ResEntry.Init();
            ResEntry."Entry No." := EntryNo;

            ResEntry.Validate("Item No.", Rec."No.");
            ResEntry.Validate("Location Code", Rec."Location Code");
            ResEntry.Validate("Quantity (Base)", Rec."Qty. to Receive (Base)");
            ResEntry.Validate("Quantity", Rec."Qty. to Receive");
            ResEntry.Validate("Reservation Status", ResEntry."Reservation Status"::Surplus);
            ResEntry.Validate("Description", Rec.Description);

            ResEntry.Validate("Source Type", Database::"Purchase Line");
            ResEntry.Validate("Source Subtype", Rec."Document Type".AsInteger());
            ResEntry.Validate("Source ID", Rec."Document No.");
            ResEntry.Validate("Source Ref. No.", Rec."Line No.");
            ResEntry.Validate("Lot No.", ItemRec."Lot Nos.");

            ResEntry.Validate("Expected Receipt Date", Rec."Expected Receipt Date");
            ResEntry.Validate("Variant Code", Rec."Variant Code");
            ResEntry.Positive := true;
            ResEntry.Validate("Created By", UserId);
            ResEntry.Validate("Creation Date", Today);

            ResEntry.Insert(true);
        end;

        Message('BR Purchase: %1', Rec."No.");
    end;
}