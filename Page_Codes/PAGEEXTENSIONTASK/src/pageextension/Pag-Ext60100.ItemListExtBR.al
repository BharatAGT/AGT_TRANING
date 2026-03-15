pageextension 60100 ItemListExtBR extends "Item List"
{
    actions
    {
        addfirst(Processing)
        {
            action(ItemsInventoryGreater3)
            {
                ApplicationArea = All;
                Caption = 'Items Inventory > 3  <BR>';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                    ItemCount: Integer;
                begin
                    ItemRec.SetFilter(Inventory, '>3');
                    ItemCount := ItemRec.Count;

                    Message('Total Items with Inventory > 3 \ : %1', ItemCount);
                end;
            }
        }
    }
}