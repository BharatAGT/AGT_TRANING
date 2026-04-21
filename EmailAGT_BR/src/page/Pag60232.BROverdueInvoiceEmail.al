page 60232 "BR Overdue Invoice Email"
{

    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Invoice No.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Amount';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendEmails)
            {
                ApplicationArea = All;
                Caption = 'Send Reminder Emails';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    OverdueMgt: Codeunit "Overdue Invoice Mgt.";
                begin
                    OverdueMgt.SendReminderEmails(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        OverdueMgt: Codeunit "Overdue Invoice Mgt.";
    begin
        OverdueMgt.ApplyFilters(Rec);
    end;
}