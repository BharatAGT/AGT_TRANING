page 60136 "Student Card BR"
{
    PageType = Card;
    SourceTable = "Student BR";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Group1)
            {
                field("Student Id"; Rec."Student Id") { }

                field("Student First Name"; Rec."Student First Name") { }

                field("Student Last Name"; Rec."Student Last Name") { }

                field("Student City"; Rec."Student City") { }

                field("Campus Id"; Rec."Campus Id")
                {
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CampusRec: Record "CAMPUS TABLE BR";
                    begin
                        // Show only active campuses
                        CampusRec.SetRange("IsActive", true);

                        // If city is filled, filter by city
                        if Rec."Student City" <> '' then
                            CampusRec.SetRange("Campus City", Rec."Student City");

                        // Open campus list
                        if Page.RunModal(Page::"CAMPUS TABLE BR List", CampusRec) = Action::LookupOK then
                            Rec.Validate("Campus Id", CampusRec."Campus Id");

                        exit(true);
                    end;
                }
            }
        }
    }
}