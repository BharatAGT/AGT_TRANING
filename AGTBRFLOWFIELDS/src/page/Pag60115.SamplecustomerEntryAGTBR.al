page 60115 "Sample customer Entry AGTBR"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Customer Summary";
    UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Customer no."; Rec."Customer no.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                }
                field("Total Sales"; Rec."Total Sales")
                {
                    Caption = 'Total sales';
                    ApplicationArea = All;
                }
                field("Total Entries"; Rec."Total Entries")
                {
                    Caption = 'Total Entries';
                    ApplicationArea = All;

                }
                field("Average Sales"; Rec."Average Sales")
                {
                    Caption = 'average sales';
                    ApplicationArea = All;
                }
                field("Minimum Sale"; Rec."Minimum Sale")
                {
                    Caption = 'Minimum sales';
                    ApplicationArea = All;
                }
                field("Maximum Sale"; Rec."Maximum Sale")
                {
                    Caption = 'Maximum sales';
                    ApplicationArea = All;
                }
                field("Has Sale"; Rec."Has Sale")
                {
                    Caption = 'HAS sales';
                    ApplicationArea = All;
                }

            }
        }
    }


}