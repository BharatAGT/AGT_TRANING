page 60125 "BOOK TITLE LIST"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BOOK TITLE";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field("BOOK GENRE"; Rec."BOOK GENRE")
                {
                    ApplicationArea = All;


                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Author"; Rec."Author")
                {
                    ApplicationArea = All;
                }
                field("BOOK ID"; Rec."BOOK ID")
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