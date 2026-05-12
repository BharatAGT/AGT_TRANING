page 60454 "BR Vendor Evaluation List"
{
    PageType = List;
    SourceTable = "BR Vendor Evaluation Header";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "BR Vendor Evaluation Doc. Page";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }

                field("Evaluation Month"; Rec."Evaluation Month")
                {
                    ApplicationArea = All;
                }

                field("Final Score"; Rec."Final Score")
                {
                    ApplicationArea = All;
                }

                field("Rating Status"; Rec."Rating Status")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}