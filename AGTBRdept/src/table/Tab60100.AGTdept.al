table 60100 AGTdept
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Table';
            AutoIncrement = true;

        }
        field(2; DepartmentCode; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Code';
            Editable = false;

            // trigger OnValidate()
            // begin
            //     if DepartmentCode <> 0 then begin
            //     end else
            //         Error('Department does not exist.');
            //     //gjfjhfjgj
            // end;



        }
        field(3; DepartmentName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Name';


        }
        field(4; ActiveFlag; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Active';

            trigger OnValidate()
            begin
                if ActiveFlag = true then begin
                end else
                    Error('Department is not curently Not Active');
            end;




        }
    }

    keys
    {
        key(Key1; PK)
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