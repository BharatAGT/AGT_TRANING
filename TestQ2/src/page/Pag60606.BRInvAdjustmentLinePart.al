page 60606 "BR Inv. Adjustment Line Part"
{
    PageType = ListPart;
    SourceTable = "BR Inventory Adjustment Line";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }

                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field("Unit Cost"; rec."Unit Cost")
                {
                    ApplicationArea = All;
                }

                field("Total Cost"; rec."Total Cost")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}