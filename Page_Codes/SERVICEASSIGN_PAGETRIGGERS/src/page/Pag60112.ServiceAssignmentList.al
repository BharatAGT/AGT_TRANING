page 60112 "Service Assignment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Assignment BR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.")
                {

                }
                field("Customer No."; Rec."Customer No.")
                {

                }
                field("Customer Name"; Rec."Customer Name")
                {

                }
                field("Service Cost"; Rec."Service Cost")
                {

                }
                field("Status"; Rec."Status")
                {

                }
            }
        }
    }

}

