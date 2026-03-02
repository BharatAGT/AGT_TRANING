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
                    ApplicationArea = All;
                    Caption = 'Project No.';

                }
                field("Project Name"; Rec."Project Name")
                {

                    trigger OnValidate()

                    begin
                        CurrPage.Update();
                        Message('This is Coming from OnValidate trigger of Project Name field');
                    end;
                }
            }
        }
    }
}
