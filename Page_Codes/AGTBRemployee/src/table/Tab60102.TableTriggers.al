table 60102 TableTriggers
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Task; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Task ID';


        }
        field(2; TaskName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Name';


        }
        field(3; CreationDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Creation Date';

        }
        field(4; Status; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';

        }

    }

    keys
    {
        key(Key1; Task)
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
        CreationDate := WorkDate();
        Status := true;
    end;

    trigger OnModify()
    begin

        if TaskName <> xRec.TaskName then
            Status := True;
        Message('Task Name has been modified. Status set to True.');

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}