page 60126 "BOOK CARD"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BOOK TITLE";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }



            }
        }
    }

}