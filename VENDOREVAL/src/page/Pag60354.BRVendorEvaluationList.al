page 60454 "BR Vendor Evaluation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BR Vendor Evaluation Line";

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
                field("Line No."; rec."Line No.")
                {
                    applicationArea = All;
                }
                field("Criteria Code"; rec."Criteria Code")
                {
                    applicationArea = All;
                }
                field("Criteria Description"; rec."Criteria Description")
                {
                    applicationArea = All;
                }
                field("Score"; rec.Score)
                {
                    applicationArea = All;
                }
                field("Weightage"; rec.Weightage)
                {
                    applicationArea = All;
                }
                field("Weighted Score"; rec."Weighted Score")
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