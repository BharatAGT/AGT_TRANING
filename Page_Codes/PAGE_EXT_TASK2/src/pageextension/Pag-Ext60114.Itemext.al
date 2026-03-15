pageextension 60114 "Item ext" extends "Item List"
{

    actions
    {
        addlast(processing)
        {
            action("Last available item")
            {
                ApplicationArea = All;
                Caption = 'Last Available Item BR';
                Promoted = true;
                PromotedCategory = new;
                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    if ItemRec.FindLast() then
                        Message('Last Item: %1 - %2', ItemRec."No.", ItemRec.Description);
                end;//
            }
        }




    }
}



