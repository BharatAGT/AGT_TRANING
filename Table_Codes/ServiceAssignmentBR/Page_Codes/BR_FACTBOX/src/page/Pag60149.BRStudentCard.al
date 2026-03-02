page 60149 "BR Student Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BR_STUDENT;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field(IsActive; Rec."IsActive")
                {
                    ApplicationArea = All;
                }
            }
            group(Contact)
            {
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }

            }
            group(Personal)
            {
                field("Total Marks"; Rec."Total Marks")
                {
                    ApplicationArea = All;
                }
                field(Grade; Rec."Grade")
                {
                    ApplicationArea = All;
                }
                field("Block Reason"; Rec."Block Reason")
                {
                    ApplicationArea = All;
                }
                field("Attempt Count"; Rec."Attempt Count")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part("Related Info(BR)"; "BR Related Info FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");

            }

        }
    }


    actions
    {
        area(Processing)
        {
            action("Make Inactive")

            {
                Caption = 'Make Inactive';
                ApplicationArea = All;
                Image = Report;

                Promoted = true;


                trigger OnAction()
                begin
                    rec.IsActive := false;
                    rec.Modify();
                    Message('Student %1 has been made inactive.', rec."No.");

                end;
            }
            action("Summary")
            {
                Caption = 'Summary';
                ApplicationArea = All;
                Image = Info;

                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('Student %1 - Name: %2, Total Marks: %3, Grade: %4',
                    rec."No.",
                    rec.Name,
                    rec."Total Marks",
                    rec.Grade);

                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        ConfirmDelete: Boolean;
    begin
        if (rec.Status = rec.Status::Draft) or (rec."Total Marks" = 0) then begin
            Message('Proceed with deletion');
            exit(true);
        end;
        // Prevent deletion if Status = Active OR Marks > 0
        if (Rec.Status = Rec.Status::Active) or (Rec."Total Marks" > 0) then
            Message('Cannot delete active students or those with marks greater than 0');
        exit(false);

        // Ask confirmation if Attempt Count >= 5
        if Rec."Attempt Count" >= 5 then begin
            Message('Attempt Count is %1. Are you sure you want to delete?', Rec."Attempt Count");

            if ConfirmDelete = false then
                Message('Deletion cancelled by user.');
            exit(false);
        end;

        exit(true);
    end;
}