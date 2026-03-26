table 60130 STUDENT
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Number';

        }
        field(2; "Student Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';
        }
        field(3; "Student Age"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Age';
            editable = false;
        }
        field(4; "Status"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Active Status';
            InitValue = true;
        }
        field(5; "DOB"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date of Birth';
            trigger OnValidate()
            begin
                if "DOB" <> 0D then
                    "Student Age" := (Today - "DOB") div 365; // This calculation estimates the student's age by dividing the difference between today's date and the date of birth by 365. Note that this is a simplified calculation and does not account for leap years or the exact day of the year, but it provides a general age estimation.
            end;

        }
        field(6; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';
            tableRelation = "Course";
        }
        field(8; "Date"; Date)
        {
            FieldClass = FlowFilter; // This field is used as a filter in the flow field calculation
            Caption = 'Date Filter';
        }
        field(7; "Total Courses"; Integer)
        {

            FieldClass = FlowField;

            CalcFormula = Count("Enrollment"
             WHERE
             ("Student No." = FIELD("Student No."), // This part of the formula filters the Enrollment table to count only records related to the current student
             "Enrollment Date" = FIELD("Date")));   // This part of the formula further filters the Enrollment records to count only those that match the date specified in the "Date" field of the STUDENT table. This allows for dynamic counting based on the selected date.
        }


    }

    keys
    {
        key(PK; "Student No.")
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
        Status := true;

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
//hi prince and devansh how are you doing in your life , guys focus on your work and do not waste time on useless things, you are doing great in your life and you will achieve all the success in your life, just keep working hard and never give up on your dreams.