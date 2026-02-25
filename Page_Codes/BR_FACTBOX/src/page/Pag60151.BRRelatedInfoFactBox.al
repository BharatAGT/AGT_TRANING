page 60151 "BR Related Info FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BR_STUDENT;
    Caption = 'Related Info';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(IsActive; Rec.IsActive)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}