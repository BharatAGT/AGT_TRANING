page 60132 "AGTBR VEHICLE TITLE List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AGTBR VEHICLE TITLE";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Company; rec.Company)
                {
                    ApplicationArea = All;
                }
                field(Wheels; rec.Wheels)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}