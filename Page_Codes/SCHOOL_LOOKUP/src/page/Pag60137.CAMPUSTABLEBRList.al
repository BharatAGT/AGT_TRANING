page 60137 "CAMPUS TABLE BR List"
{
    PageType = List;
    SourceTable = "CAMPUS TABLE BR";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Campus Id"; Rec."Campus Id") { }
                field("Campus Name"; Rec."Campus Name") { }
                field("Campus City"; Rec."Campus City") { }
                field("IsActive"; Rec."IsActive") { }
                field("Capacity"; Rec."Capacity") { }
                field("Current Enrollment"; Rec."Current Enrollment") { }
            }
        }
    }
}