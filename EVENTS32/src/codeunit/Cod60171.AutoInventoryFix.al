// // when a user adds an item to a 
// // Sales Order, check if quantity is insufficient at the
// //  selected location.  create and post an Item Journal entry to
// //  increase inventory.

// codeunit 60171 "Auto Inventory Fix"
// {
//     // Subscribe to the OnAfterValidate event on the Sales Line table.
//     // This fires every time any field on a Sales Line is validated.
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateevent', 'quantity', false, false)]
//     local procedure CheckInventory(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     var
//         ItemRec: Record Item;
//         ItemJnlLine: Record "Item Journal Line";
//         ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
//         Shortage: Decimal;
//     begin
//         // Only for item line
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Rec."No." = '' then
//             exit;

//         // Must have a location — we need location-specific stock
//         if Rec."Location Code" = '' then
//             exit;

//         // Must have a positive quantity to check against
//         if Rec.Quantity <= 0 then
//             exit;

//         // Read the Item record
//         if not ItemRec.Get(Rec."No.") then
//             exit;

//         // ItemRec.SetRange("Location Filter", Rec."Location Code");
//         ItemRec.CalcFields(Inventory);

//         // Enough Stock do nothing
//         if ItemRec.Inventory >= Rec.Quantity then
//             exit;

//         // total number we need to add to cover
//         Shortage := Rec.Quantity - ItemRec.Inventory;

//         // --- Build the Item Journal Line ---

//         ItemJnlLine.Init();
//         ItemJnlLine."Journal Template Name" := 'ITEM';
//         ItemJnlLine."Journal Batch Name" := 'DEFAULT';

//         // Find the next available Line No. in this batch
//         ItemJnlLine.Reset();
//         ItemJnlLine.SetRange("Journal Template Name", 'ITEM');
//         ItemJnlLine.SetRange("Journal Batch Name", 'DEFAULT');
//         if ItemJnlLine.FindLast() then
//             ItemJnlLine."Line No." := ItemJnlLine."Line No." + 10000
//         else
//             ItemJnlLine."Line No." := 10000;

//         // Validate fields — this triggers BC's own field logic
//         ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
//         ItemJnlLine.Validate("Item No.", Rec."No.");
//         ItemJnlLine.Validate("Location Code", Rec."Location Code");
//         ItemJnlLine.Validate(Quantity, Shortage);
//         ItemJnlLine.Validate("Posting Date", Today);
//         ItemJnlLine.Validate("Document No.", 'AGTBR' + Rec."Document No.");

//         // Save the line to the database
//         ItemJnlLine.Insert(true);
//         ItemJnlPostLine.RunWithCheck(ItemJnlLine);
//         Message('Bharat: Added %1 units of %2 at %3.', Shortage, Rec."No.", Rec."Location Code");
//     end;
// }
