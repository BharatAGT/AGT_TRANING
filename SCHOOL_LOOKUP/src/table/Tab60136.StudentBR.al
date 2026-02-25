table 60136 "Student BR"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student Id"; Code[20]) { }

        field(2; "Student First Name"; Text[100]) { }

        field(3; "Student Last Name"; Text[50]) { }

        field(4; "Student City"; Text[50]) { }

        field(5; "Campus Id"; Code[20])
        {
            TableRelation = "CAMPUS TABLE BR"."Campus Id";

            trigger OnValidate()
            var
                CampusRec: Record "CAMPUS TABLE BR";
                OldCampusRec: Record "CAMPUS TABLE BR";
            begin
                if "Campus Id" = '' then
                    exit;

                // Get new campus
                if CampusRec.Get("Campus Id") then begin

                    // Check capacity
                    if CampusRec."Current Enrollment" >= CampusRec."Capacity" then
                        Error('This campus is full.');

                    // Reduce old campus count
                    if xRec."Campus Id" <> '' then
                        if OldCampusRec.Get(xRec."Campus Id") then begin
                            OldCampusRec."Current Enrollment" :=
                                OldCampusRec."Current Enrollment" - 1;
                            OldCampusRec.Modify();
                        end;

                    // Increase new campus count
                    CampusRec."Current Enrollment" :=
                        CampusRec."Current Enrollment" + 1;

                    CampusRec.Modify();
                end;
            end;
        }
    }

    keys
    {
        key(PK; "Student Id")
        {
            Clustered = true;
        }
    }
}