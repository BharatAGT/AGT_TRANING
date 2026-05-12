page 60605 "BR INV. ADJ. DOCUMENT PAGE"
{
    PageType = Document;
    SourceTable = "BR Inventory Adjustment Header";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Adjustment No."; Rec."Adjustment No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }

                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            part(Lines; "BR Inv. Adjustment Line Part")
            {
                SubPageLink = "Adjustment No." = field("Adjustment No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send for Approval")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgmt: Codeunit "Approval Management";
                begin
                    ApprovalMgmt.SendForApproval(Rec);
                    Message('BR Document sent for approval');
                end;
            }

            action(Approve)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgmt: Codeunit "Approval Management";
                begin
                    ApprovalMgmt.ApproveDocument(Rec);
                    Message('BR Document approved');
                end;
            }

            action(Reject)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgmt: Codeunit "Approval Management";
                begin
                    ApprovalMgmt.RejectDocument(Rec);
                    Message('BR Document rejected');
                end;
            }

            action("Post Adjustment")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    PostingMgmt: Codeunit "Posting Management";
                begin
                    PostingMgmt.PostAdjustment(Rec);
                    Message('BR Document posted');
                end;
            }
        }
    }
}