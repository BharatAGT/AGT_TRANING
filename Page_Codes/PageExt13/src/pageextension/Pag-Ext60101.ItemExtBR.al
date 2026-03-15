pageextension 60101 "ItemExtBR" extends "Item List"
{
    actions
    {
        addlast(Processing)
        {
            action("Inventory Check <BR>")
            {
                ApplicationArea = All;
                Caption = 'Low Inventory <BR>';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                    LowCount: Integer;
                    LowestInventory: Decimal;
                    LowestItemNo: Code[20];
                begin
                    ItemRec.SetRange(Blocked, false);
                    if ItemRec.FindSet() then
                        repeat

                            if ItemRec.Inventory < 5 then begin
                                LowCount := LowCount + 1;
                                if (LowestInventory = 0) or (ItemRec.Inventory < LowestInventory) then begin
                                    LowestInventory := ItemRec.Inventory;
                                    LowestItemNo := ItemRec."No.";
                                end;
                            end;

                        until ItemRec.Next() = 0;
                    Message(
                    'Total Low Inventory Items : %1 \ Lowest Inventory Item : %2 \ Inventory : %3',
                    LowCount, LowestItemNo, LowestInventory);
                end;
            }
        }
    }
}