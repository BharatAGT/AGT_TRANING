page 60116 "Assignmnet Service  CARD BR"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Assignmnet Service BR";


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Tax Amount"; Rec."Tax Amount")
                {
                    ApplicationArea = all;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = all;
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
    trigger OnAfterGetRecord()
    var

    begin
        if Rec."Service Cost" > 1000 then
            Message('High value service assignment');

    end;




    var
        myInt: Integer;
}