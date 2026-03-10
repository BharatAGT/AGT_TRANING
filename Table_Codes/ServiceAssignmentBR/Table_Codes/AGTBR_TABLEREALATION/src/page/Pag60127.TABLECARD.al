page 60127 "TABLE CARD"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BOOK TABLE";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                }
                field("Book Publisher"; Rec."Book Publisher")
                {
                    ApplicationArea = All;
                }
                field("Book Title"; Rec."Book Title")
                {
                    ApplicationArea = All;
                }
                field("Book Genre"; Rec."Book Genre")
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