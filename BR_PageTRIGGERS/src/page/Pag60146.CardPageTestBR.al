page 60146 "List Page Test_BR"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BHARAT TEST";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Id"; rec."Id")
                {
                    ApplicationArea = all;
                   // TableRelation = "BHARAT TEST";
                }
                field("Name"; rec."Name")
                {
                    ApplicationArea = all;
                }
                field("Age"; rec.Age)
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
            action(CustomAction)
            {
                Caption = 'Click to see message';
                trigger OnAction()
                begin
                    Message('Custom Action Triggered for : %1', rec.Name);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()

    begin
        Message('OnAfterGetRecord : %1 ', rec.Name);

    end;

    trigger OnAfterGetCurrRecord()

    begin
        Message('OnAfterGetCurrRecord : %1 ', rec.Name);
    end;

    var
        myInt: Integer;
}