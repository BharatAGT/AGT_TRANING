// codeunit 60171 "Auto Inventory Fix"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
//     local procedure CheckInventory(var Rec: Record "Sales Line")
//     var
//         ItemRec: Record Item;
//         ItemJnlLine: Record "Item Journal Line";
//         Shortage: Decimal;
//     begin
//         // Only Item lines
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         // Ensure Location exists
//         if Rec."Location Code" = '' then
//             exit;

//         // Get Item
//         if not ItemRec.Get(Rec."No.") then
//             exit;

//         // Check stock at location
//         if ItemRec.Inventory >= Rec.Quantity then
//             exit;

//         // Calculate shortage
//         Shortage := Rec.Quantity - ItemRec.Inventory;

//         // Create Item Journal Line
//         ItemJnlLine.Init();
//         ItemJnlLine."Journal Template Name" := 'ITEM';
//         ItemJnlLine."Journal Batch Name" := 'DEFAULT';

//         ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
//         ItemJnlLine.Validate("Item No.", Rec."No.");
//         ItemJnlLine.Validate("Location Code", Rec."Location Code");
//         ItemJnlLine.Validate("Quantity", Shortage);
//         ItemJnlLine.Validate("Posting Date", Today);
//         ItemJnlLine.Validate("Document No.", 'AUTO-' + Rec."Document No.");

//         ItemJnlLine.Insert(true);

//         // Post journal
//         Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemJnlLine);
//     end;
// }