page 60121 "Assignmnet Service BR List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Assignmnet Service BR";
    CardPageId = "Assignmnet Service  CARD BR";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
    trigger OnOpenPage()
    begin
        if (Rec.status = Rec.status::open) then
            Message('Hello');

        if Rec.Status = Rec.Status::Completed then begin
            CurrPage.Editable := false;
            Error('No Modification Allowed');
        end else
            CurrPage.Editable := true;

    end;

    var
        myInt: Integer;
}