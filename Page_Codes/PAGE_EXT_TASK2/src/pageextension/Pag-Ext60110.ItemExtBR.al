pageextension 60110 ItemExtBR extends "Item Card"
{
    layout
    {
        addbefore(Item)
        {
            field("Lookup Item No."; LookItem)
            {
                ApplicationArea = All;
                Caption = ' bharat';

                trigger OnValidate()
                var
                    ItemRec: Record Item;
                begin
                    if ItemRec.Get(LookItem) then
                        Message('Item Description: %1', ItemRec.Description)
                    else
                        Message('Item not found');
                end;
            }
        }


    }
    var
        LookItem: Code[20];

}