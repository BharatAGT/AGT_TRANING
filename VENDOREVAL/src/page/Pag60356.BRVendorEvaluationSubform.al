page 60456 "BR Vendor Evaluation Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BR Vendor Evaluation Line";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Evaluation No."; rec."Evaluation No.")
                {
                    applicationArea = All;
                    TableRelation = "BR Vendor Evaluation Line";
                }
                field("Line No."; rec."Line No.")
                {
                    applicationArea = All;
                    TableRelation = "BR Vendor Evaluation Line";
                }
                field("Criteria Code"; rec."Criteria Code")
                {
                    applicationArea = All;
                }
                field("Criteria Description"; rec."Criteria Description")
                {
                    applicationArea = All;
                }
                field("Score"; rec.Score)
                {
                    applicationArea = All;
                }
                field("Weightage"; rec.Weightage)
                {
                    applicationArea = All;
                }
                field("Weighted Score"; rec."Weighted Score")
                {
                    applicationArea = All;
                }
            }
        }
    }


}