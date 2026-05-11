page 60230 "BR Overdue Invoice Setup"
{

    PageType = Card;
    SourceTable = "Overdue Invoice Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Date Filter';

                field("BR:Posting Date From"; Rec."Posting Date From")
                {
                    ApplicationArea = All;
                }
                field("BR:Posting Date To"; Rec."Posting Date To")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        OverdueSetup: Record "Overdue Invoice Setup";
    begin
        if not OverdueSetup.Get('') then begin
            OverdueSetup.Init();
            OverdueSetup."Primary Key" := '';
            OverdueSetup.Insert();
        end;
    end;
}