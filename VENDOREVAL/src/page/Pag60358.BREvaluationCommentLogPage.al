page 60458 "BR Evaluation Comment Log Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BR Evaluation Comment Log";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Evaluation No."; rec."Evaluation No.")
                {
                    applicationArea = All;
                }
                field("Comments"; rec."Comments")
                {
                    applicationArea = All;
                }
                field("Created By"; rec."Created By")
                {
                    applicationArea = All;
                }
                field("Created DateTime"; rec."Created DateTime")
                {
                    applicationArea = All;
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