page 60114 "Sample Sales Entry AGTBR"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry no."; Rec."Entry no.")
                {
                    ApplicationArea = ALL;
                }
                field("Customer no."; Rec."Customer no.")
                {
                    ApplicationArea = ALL;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }


}