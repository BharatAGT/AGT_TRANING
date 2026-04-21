codeunit 60289 "BRTask 19"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
    local procedure InsertManualReservation(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    var
        ResEntry: Record "Reservation Entry";
        ItemRec: Record Item;
        EntryNo: Integer;
    begin
        if Rec."Qty. to Ship" = xRec."Qty. to Ship" then
            exit;

        if Rec.Type <> Rec.Type::Item then
            exit;

        if not ItemRec.Get(Rec."No.") then
            exit;

        if ItemRec."Item Tracking Code" = '' then
            Error('BR %1', ItemRec."No.");


        ResEntry.Reset();
        ResEntry.SetRange("Source Type", Database::"Sales Line");
        ResEntry.SetRange("Source ID", Rec."Document No.");
        ResEntry.SetRange("Source Ref. No.", Rec."Line No.");
        ResEntry.SetRange("Item No.", Rec."No.");
        ResEntry.SetRange("Location Code", Rec."Location Code");
        ResEntry.SetRange("Reservation Status", ResEntry."Reservation Status"::Surplus);

        if ResEntry.FindFirst() then begin
            ResEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
            ResEntry.Validate("Quantity", Rec."Qty. to Ship");
            ResEntry.Validate("Shipment Date", Rec."Shipment Date");
            ResEntry.Modify(true);
        end else begin

            EntryNo := ResEntry.GetLastEntryNo() + 1;

            ResEntry.Init();
            ResEntry."Entry No." := EntryNo;
            ResEntry.Validate("Item No.", Rec."No.");
            ResEntry.Validate("Location Code", Rec."Location Code");
            ResEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
            ResEntry.Validate("Quantity", Rec."Qty. to Ship");
            ResEntry.Validate("Reservation Status", ResEntry."Reservation Status"::Surplus);
            ResEntry.Validate("Description", Rec.Description);
            ResEntry.Validate("Source Type", Database::"Sales Line");
            ResEntry.Validate("Source Subtype", 1);
            ResEntry.Validate("Source ID", Rec."Document No.");
            ResEntry.Validate("Source Ref. No.", Rec."Line No.");
            ResEntry.Validate("Shipment Date", Rec."Shipment Date");
            ResEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
            ResEntry.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
            ResEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. Invoiced (Base)");
            ResEntry.Validate("Variant Code", Rec."Variant Code");
            ResEntry.Validate("Lot No.", ItemRec."Lot Nos.");
            ResEntry.Validate("Created By", UserId);
            ResEntry.Validate("Creation Date", Today);
            ResEntry.Insert(true);
        end;
        Message(
            'BR: %1', Rec."No.");
    end;
}

// {

//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
//     local procedure InsertReservation(var Rec: Record "Sales Line"; xRec: Record "Sales Line")

//     var

//         ReservEntry: Record "Reservation Entry";
//         ItemRec: Record Item;
//         EntryNo: Integer;
//         ReservMgt: Codeunit "Reservation Management";

//     begin

//         if Rec."Qty. to Ship" = xRec."Qty. to Ship" then
//             exit;

//         if not ItemRec.Get(Rec."No.") then
//             exit;

//         if ItemRec."Item Tracking Code" = '' then
//             Error('BR: Please Enter Item Tracking code %1', ItemRec."No.");




//         ReservEntry.Reset();
//         ReservEntry.SetRange("Source Type", Database::"Sales Line");
//         ReservEntry.SetRange("Source ID", Rec."Document No.");
//         ReservEntry.SetRange("Source Ref. No.", Rec."Line No.");
//         ReservEntry.SetRange("Item No.", Rec."No.");
//         ReservEntry.SetRange("Location Code", Rec."Location Code");
//         ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);

//         if ReservEntry.FindFirst() then begin

//             ReservEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
//             ReservEntry.Validate("Quantity", Rec."Qty. to Ship");
//             ReservEntry.Validate("Shipment Date", Rec."Shipment Date");
//             ReservEntry.Modify();
//             exit;

//         end;

//         EntryNo := ReservEntry.GetLastEntryNo() + 1;
//         ReservEntry.Init();
//         ReservEntry.Validate("Entry No.", EntryNo);
//         ReservEntry.Validate("Item No.", Rec."No.");
//         ReservEntry.Validate("Location Code", Rec."Location Code");
//         ReservEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
//         ReservEntry.Validate("Quantity", Rec."Qty. to Ship");
//         ReservEntry.Validate("Reservation Status", ReservEntry."Reservation Status"::Surplus);
//         ReservEntry.Validate("Description", Rec.Description);
//         ReservEntry.Validate("Source Type", Database::"Sales Line");
//         ReservEntry.Validate("Source Subtype", 1);
//         ReservEntry.Validate("Source ID", Rec."Document No.");
//         ReservEntry.Validate("Source Ref. No.", Rec."Line No.");
//         ReservEntry.Validate("Shipment Date", Rec."Shipment Date");
//         ReservEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
//         ReservEntry.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
//         ReservEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. Invoiced (Base)");
//         ReservEntry.Validate("Variant Code", Rec."Variant Code");
//         ReservEntry.Validate("Created By", UserId);
//         ReservEntry.Validate("Creation Date", Today);
//         ReservEntry.Insert(true);
//         Message(
//           'BR: %1', ReservEntry."Entry No.");

//     end;

// }


// codeunit 60278 BRTask30
// {
//     [EventSubscriber(ObjectType::Table, Database::"sales Line", 'OnAfterValidateEvent', 'Qty. to Ship', false, false)]
//     local procedure TrackSpeci(var Rec: Record "sales Line"; var xRec: Record "sales Line")
//     var

//         reservEntry: Record "Reservation Entry";
//         item: Record Item;
//         EntryNo: Integer;


//     begin
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if item.Get(Rec."No.") then begin
//             if item."Item Tracking Code" = '' then
//                 exit
//         end;

//         reservEntry.SetRange("Source Type", Database::"Sales Line");
//         reservEntry.SetRange("Source Subtype", rec."Document Type");
//         reservEntry.SetRange("Source ID", rec."Document No.");
//         reservEntry.SetRange("Source Ref. No.", rec."Line No.");
//         if reservEntry.FindFirst() then begin
//             reservEntry.Validate("Item No.", Rec."No.");
//             reservEntry.Validate("Location Code", Rec."Location Code");
//             reservEntry.Validate("Quantity", Rec."Qty. to ship");
//             reservEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
//             reservEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
//             reservEntry.Validate("Qty. to Handle (Base)", rec."Quantity (Base)");
//             reservEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. to Invoice (Base)");
//             reservEntry.Validate("Lot No.", 'BNKDEPOSIT');
//             reservEntry.Modify(true);

//         end else begin


//             EntryNo := reservEntry.GetLastEntryNo() + 1;
//             reservEntry.Init();
//             reservEntry.Validate("Entry No.", EntryNo);
//             reservEntry.Validate("Location Code", rec."Location Code");
//             reservEntry.Validate("Item No.", rec."No.");
//             reservEntry.Validate("Reservation Status", reservEntry."Reservation Status"::Surplus);
//             reservEntry.Validate(Description, rec.Description);
//             reservEntry.Validate("Creation Date", Today);
//             reservEntry.Validate("Created By", UserId);
//             reservEntry.Validate("Source Type", Database::"Sales Line");
//             reservEntry.Validate("Source Subtype", rec."Document Type");
//             reservEntry.Validate("Source ID", rec."Document No.");
//             reservEntry.Validate("Source Ref. No.", rec."Line No.");
//             reservEntry.Validate("Quantity", rec."Qty. to ship");
//             reservEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
//             reservEntry.Validate("Quantity (Base)", rec."Qty. to Ship (Base)");
//             reservEntry.Validate("Qty. to Handle (Base)", rec."Quantity (Base)");
//             reservEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. to Invoice (Base)");
//             reservEntry.Validate("Item Tracking", reservEntry."Item Tracking"::"Lot No.");
//             reservEntry.Validate("Lot No.", 'BNKDEPOSIT');
//             reservEntry.Insert(true);

//         end
//     end;
// }
// codeunit 60265 BRTask30
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
//     local procedure AutoReserveOnQtyChange(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     var
//         Item: Record Item;
//         ReservMgt: Codeunit "Reservation Management";
//         FullAuto: Boolean;
//     begin
//         // Step 1: Only Item lines
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         // Step 2: Skip if no change in quantity
//         if Rec."Qty. to Ship" = xRec."Qty. to Ship" then
//             exit;

//         // Step 3: Validate quantity
//         if Rec."Qty. to Ship" <= 0 then
//             exit;

//         // Step 4: Check item
//         if not Item.Get(Rec."No.") then
//             exit;

//         if Item."Item Tracking Code" = '' then
//             exit;

//         // Step 5: Set reservation source
//         ReservMgt.SetReservSource(Rec);

//         // Step 6: Clear previous reservation
//         ReservMgt.DeleteReservEntries(true, 0);

//         // Step 7: Recreate reservation
//         FullAuto := true;

//         ReservMgt.AutoReserve(
//             FullAuto,
//             Rec.Description,
//             WorkDate(),
//             Rec."Qty. to Ship",
//             Rec."Qty. to Ship (Base)"
//         );

//         // 🔥 YOUR MESSAGE
//         Message('BR: Reservation updated successfully for Item %1, Qty %2',
//             Rec."No.",
//             Rec."Qty. to Ship");
//     end;
// }
// codeunit 60265 BRTask30
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
//     local procedure TrackingSpec(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     var
//         Item: Record Item;
//         ReservMgt: Codeunit "Reservation Management";
//         FullAuto: Boolean;
//     begin
//         // Step 1: Validations
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Rec."Qty. to Ship" <= 0 then
//             exit;

//         if not Item.Get(Rec."No.") then
//             exit;

//         if Item."Item Tracking Code" = '' then
//             Error('BR: Please setup item tracking code');

//         // Step 2: Clear old reservation
//         ReservMgt.SetReservSource(Rec);
//         ReservMgt.DeleteReservEntries(true, 0);

//         // Step 3: Recreate reservation
//         FullAuto := true;
//         ReservMgt.AutoReserve(
//             FullAuto,
//             Rec.Description,
//             WorkDate(),
//             Rec."Qty. to Ship",
//             Rec."Qty. to Ship (Base)"
//         );

//         // 🔥 Step 4: Refresh UI
//         Rec.Find(); // reload record

//         // 🔥 Step 5: Open Item Tracking Lines page
//         PAGE.Run(PAGE::"Item Tracking Lines", Rec);
//     end;
// }


// codeunit 60265 BRTask30
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
//     local procedure TrackingSpec(var rec: Record "Sales Line"; xrec: Record "Sales Line")
//     var
//         ResEntry: Record "Reservation Entry";
//         Item: Record Item;
//         EntNo: Integer;
//     // Trackingspec: Record "Tracking Specification";
//     // Revmgt: Codeunit "Reservation Management"

//     begin
//         if Item.Get(Rec."No.") then begin
//             if Item."Item Tracking Code" = '' then begin
//                 Error('BR: Please setup item tracking code');
//             end;
//         end;
//         EntNo := ResEntry.GetLastEntryNo() + 1;
//         ResEntry.Init();

//         ResEntry.Validate("Entry No.", EntNo);
//         ResEntry.Validate("Item No.", Rec."No.");
//         ResEntry.Validate("Location Code", Rec."Location Code");
//         ResEntry.Validate("Quantity (Base)", Rec."Quantity (Base)");
//         ResEntry.Validate("Reservation Status", ResEntry."Reservation Status"::Surplus);
//         ResEntry.Validate(Description, Rec.Description);
//         ResEntry.Validate("Creation Date", Today);
//         ResEntry.Validate("Source Type", DATABASE::"Sales Line");
//         ResEntry.Validate("Source Subtype", 1);
//         ResEntry.Validate("Source ID", Rec."Document No.");
//         ResEntry.Validate("Source Ref. No.", Rec."Line No.");
//         ResEntry.Validate("Shipment Date", Rec."Shipment Date");
//         // ResEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
//         //  ResEntry.Validate("Quantity", 0);
//         // ResEntry.Validate("Lot No.", Item."Lot Nos.");

//         // ResEntry.Validate("Item Tracking", ResEntry."Item Tracking"::"Serial No.");
//         // ResEntry.Validate("Serial No.", Item."Serial Nos.");
//         // ResEntry.Validate("Lot No.", Item."Lot Nos.");
//         ResEntry.Validate("Created By", UserId);

//         ResEntry.Insert(true);
//         // ReservationMgt.CreateReservation(
//         // rec."No.",
//         // WorkDate(),
//         // rec."Qty. to Ship",
//         // rec."Qty. to Ship",
//         // TrackingSpec

//         Message('BR: %1', ResEntry."Entry No.");
//     end;
// }

// //     var
// //         Item: Record Item;
// //         TrackingSpec: Record "Tracking Specification" temporary;
// //         ReservMgt: Codeunit "Reservation Management";
// //     begin
// //         if Rec.Type <> Rec.Type::Item then
// //             exit;

// //         if Rec."Qty. to Ship" <= 0 then
// //             exit;

// //         if not Item.Get(Rec."No.") then
// //             exit;

// //         if Item."Item Tracking Code" = '' then
// //             Error('BR: Please setup item tracking code');

// //         TrackingSpec.Init();

// //         TrackingSpec.Validate("Item No.", Rec."No.");
// //         TrackingSpec.Validate("Location Code", Rec."Location Code");

// //         TrackingSpec.Validate(Quantity, Rec."Qty. to Ship");
// //         TrackingSpec.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");

//         TrackingSpec.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
//         TrackingSpec.Validate("Qty. to Invoice (Base)", Rec."Qty. to Ship (Base)");

// //         TrackingSpec.Validate("Source Type", Database::"Sales Line");
// //         TrackingSpec.Validate("Source Subtype", Rec."Document Type".AsInteger());
// //         TrackingSpec.Validate("Source ID", Rec."Document No.");
// //         TrackingSpec.Validate("Source Ref. No.", Rec."Line No.");

// //         ReservMgt.CreateReservation(
// //             Rec."No.",
// //             WorkDate(),
// //             Rec."Qty. to Ship",
// //             Rec."Qty. to Ship",
// //             TrackingSpec
// //         );

// //         Message('BR: Reservation created for item %1', Rec."No.");
// //     end;
// // }