codeunit 60265 BRTask30
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
    local procedure TrackingSpec(var rec: Record "Sales Line"; xrec: Record "Sales Line")
    var
        ResEntry: Record "Reservation Entry";
        Item: Record Item;
        EntNo: Integer;
    // Trackingspec: Record "Tracking Specification";
    // Revmgt: Codeunit "Reservation Management"

    begin
        if Item.Get(Rec."No.") then begin
            if Item."Item Tracking Code" = '' then begin
                Error('BR: Please setup item tracking code');
            end;
        end;
        EntNo := ResEntry.GetLastEntryNo() + 1;
        ResEntry.Init();

        ResEntry.Validate("Entry No.", EntNo);
        ResEntry.Validate("Item No.", Rec."No.");
        ResEntry.Validate("Location Code", Rec."Location Code");
        ResEntry.Validate("Quantity (Base)", Rec."Quantity (Base)");
        ResEntry.Validate("Reservation Status", ResEntry."Reservation Status"::Surplus);
        ResEntry.Validate(Description, Rec.Description);
        ResEntry.Validate("Creation Date", Today);
        ResEntry.Validate("Source Type", DATABASE::"Sales Line");
        ResEntry.Validate("Source Subtype", 1);
        ResEntry.Validate("Source ID", Rec."Document No.");
        ResEntry.Validate("Source Ref. No.", Rec."Line No.");
        ResEntry.Validate("Shipment Date", Rec."Shipment Date");
        // ResEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
        //  ResEntry.Validate("Quantity", 0);
        // ResEntry.Validate("Lot No.", Item."Lot Nos.");

        // ResEntry.Validate("Item Tracking", ResEntry."Item Tracking"::"Serial No.");
        // ResEntry.Validate("Serial No.", Item."Serial Nos.");
        // ResEntry.Validate("Lot No.", Item."Lot Nos.");
        ResEntry.Validate("Created By", UserId);

        ResEntry.Insert(true);
        // ReservationMgt.CreateReservation(
        // rec."No.",
        // WorkDate(),
        // rec."Qty. to Ship",
        // rec."Qty. to Ship",
        // TrackingSpec

        Message('BR: %1', ResEntry."Entry No.");
    end;
}

//     var
//         Item: Record Item;
//         TrackingSpec: Record "Tracking Specification" temporary;
//         ReservMgt: Codeunit "Reservation Management";
//     begin
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Rec."Qty. to Ship" <= 0 then
//             exit;

//         if not Item.Get(Rec."No.") then
//             exit;

//         if Item."Item Tracking Code" = '' then
//             Error('BR: Please setup item tracking code');

//         TrackingSpec.Init();

//         TrackingSpec.Validate("Item No.", Rec."No.");
//         TrackingSpec.Validate("Location Code", Rec."Location Code");

//         TrackingSpec.Validate(Quantity, Rec."Qty. to Ship");
//         TrackingSpec.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");

//         TrackingSpec.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
//         TrackingSpec.Validate("Qty. to Invoice (Base)", Rec."Qty. to Ship (Base)");

//         TrackingSpec.Validate("Source Type", Database::"Sales Line");
//         TrackingSpec.Validate("Source Subtype", Rec."Document Type".AsInteger());
//         TrackingSpec.Validate("Source ID", Rec."Document No.");
//         TrackingSpec.Validate("Source Ref. No.", Rec."Line No.");

//         ReservMgt.CreateReservation(
//             Rec."No.",
//             WorkDate(),
//             Rec."Qty. to Ship",
//             Rec."Qty. to Ship",
//             TrackingSpec
//         );

//         Message('BR: Reservation created for item %1', Rec."No.");
//     end;
// }