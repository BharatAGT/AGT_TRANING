table 60147 "BR_STUDENT"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])       // Primary key field
        {
            DataClassification = ToBeClassified;


        }
        field(2; "Name"; Text[50])      // Student's name
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Status"; Option)     //(Draft, Active, Blocked) – Lifecycle state
        {
            DataClassification = ToBeClassified;
            OptionMembers = Draft,Active,Blocked;

        }

        field(4; "IsActive"; Boolean)   //Indicates active state
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Total Marks"; Decimal)       //Range 0–100 
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // 1️⃣ Validate range (0–100)
                if (Rec."Total Marks" < 0) or (Rec."Total Marks" > 100) then begin
                    Rec."Attempt Count" := Rec."Attempt Count" + 1;
                    Error('Total Marks must be between 0 and 100');
                end;

                // 2️⃣ Auto block if Marks < 40
                if Rec."Total Marks" < 40 then begin
                    Rec.Status := Rec.Status::Blocked;
                    Rec."Block Reason" := 'Marks below passing';
                end;
                // 2️⃣ Auto Unblock if Marks > 40
                if (Rec."Total Marks" > 40) and (Rec."Total Marks" < 85) then begin
                    Rec.Status := Rec.Status::Active;
                    Rec."Block Reason" := 'Marks above passing';
                end;

                // 3️⃣ Academic award condition
                if (Rec."Total Marks" >= 85) and (Rec.Status = Rec.Status::Active) then begin

                    Rec."Block Reason" := '';
                    Message('Congratulations! You qualify for academic award - ROYAL PASS');
                end;
            end;

        }
        field(6; "Grade"; Text[10])     //System calculated
        {
            DataClassification = ToBeClassified;


        }
        field(7; "Email"; Text[100])        //Contact email address
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // Only validate  if Status = Active
                if Rec.Status = Rec.Status::Active then begin

                    // Basic email validation check
                    if (StrPos(Rec.Email, '@') = 0) then begin
                        Rec."Attempt Count" := Rec."Attempt Count" + 1;

                        // Auto block after 3 invalid attempts
                        if Rec."Attempt Count" >= 3 then begin
                            Rec.Status := Rec.Status::Blocked;
                            Rec."Block Reason" := 'Invalid email attempts exceeded';
                        end;

                        Error('Invalid email for Active student.');
                    end;
                end;
            end;


        }
        field(8; "Phone"; Text[15])         //Contact numbe
        {
            DataClassification = ToBeClassified;


        }

        field(9; "Block Reason"; Text[250])     //Required when blocked
        {
            DataClassification = ToBeClassified;


        }
        field(10; "Attempt Count"; Integer)         //Validation failure counter
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if (Rec."Attempt Count" = 3) then
                    Rec.Status := Rec.Status::Blocked;
            end;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}