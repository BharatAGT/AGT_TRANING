page 60133 "AGTBR VEHICLE Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AGTBR VEHICLE";
    Editable = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; rec."Vehicle Name")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Company"; rec."Vehicle Company")
                {
                    ApplicationArea = All;
                }
                field(Wheels; rec."Vehicle Wheels")
                {
                    ApplicationArea = All;
                }
                field(VehicleID; rec."Vehicle ID")
                {
                    ApplicationArea = All;
                }
            }
        }


    }

    var
        myInt: Integer;
}