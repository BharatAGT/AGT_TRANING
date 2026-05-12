page 60604 "BR Inv. Adjustment List Page"
{
    PageType = List;
    SourceTable = "BR Inventory Adjustment Header";
    ApplicationArea = All;
    UsageCategory = Administration;
    CardPageId = "BR INV. ADJ. DOCUMENT PAGE";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Adjustment No."; rec."Adjustment No.")
                {
                    ApplicationArea = All;
                }

                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}