page 60153 "Project List BR"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Project";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Project No."; Rec."Project No.")
                {

                }
                field("Project Name"; Rec."Project Name")
                {

                }
            }
        }
    }
}
