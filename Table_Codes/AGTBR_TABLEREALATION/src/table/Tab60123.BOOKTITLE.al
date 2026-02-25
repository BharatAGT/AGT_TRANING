table 60123 "BOOK TITLE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Title"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "BOOK GENRE"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Science Fiction",Fantasy,Romance,Mystery,Other;
        }
        field(3; "Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Author"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Abhishek","Ankita","Kirti","Gautam","Rishabh";
        }
        field(5; "BOOK ID"; Integer)
        {
            DataClassification = ToBeClassified;
            autoIncrement = true;
        }

    }
    keys
    {
        key(PK; "BOOK ID")
        {
            Clustered = true;
        }
    }

}