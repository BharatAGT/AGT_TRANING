table 60126 "BOOK TABLE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book ID"; Integer)
        {

            DataClassification = ToBeClassified;
            autoIncrement = true;

        }
        field(2; "Book Publisher"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Book Title"; Text[100])
        {
            DataClassification = ToBeClassified;
            // tableRelation = "BOOK TITLE"."Title" where("BOOK GENRE" = field("Book Genre"));
        }
        field(4; "Book Genre"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Science Fiction",Fantasy,Romance,Mystery,Other;
        }

    }

    keys
    {
        key(PK; "Book ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}