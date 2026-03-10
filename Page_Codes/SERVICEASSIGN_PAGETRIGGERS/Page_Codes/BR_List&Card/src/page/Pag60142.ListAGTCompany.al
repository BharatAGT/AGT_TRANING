page 60142 "List_AGTCompany"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AGT_Company";
    CardPageId = "Card_AGTCompany";


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Employee Id"; rec."Employee Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Id';
                }
                field("Company Name"; rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field("Address"; rec."Address")
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