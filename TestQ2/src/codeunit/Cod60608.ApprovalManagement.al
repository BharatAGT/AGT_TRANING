codeunit 60608 "Approval Management"
{
    procedure SendForApproval(var Header: Record "BR Inventory Adjustment Header")
    var
        UserSetup: Record "User Setup";
        LineRec: Record "BR Inventory Adjustment Line";
    begin
        if Header.Status <> Header.Status::Open then
            Error('Document must be Open');

        LineRec.Reset();
        LineRec.SetRange("Adjustment No.", Header."Adjustment No.");

        if not LineRec.FindFirst() then
            Error('Lines must exist');

        if not UserSetup.Get(UserId) then
            Error('User Setup not found');

        Header."Approver ID" := UserSetup."Approver ID";
        Header.Status := Header.Status::"Pending Approval";

        Header.Modify();

        Message('Document sent for approval to %1', Header."Approver ID");
    end;

    procedure ApproveDocument(var Header: Record "BR Inventory Adjustment Header")
    begin
        if Header.Status <> Header.Status::"Pending Approval" then
            Error('Document is not pending approval');

        Header.Status := Header.Status::Approved;
        Header."Approved By" := Header."Approver ID";

        Header.Modify();

        Message('Document approved successfully');
    end;

    procedure RejectDocument(var Header: Record "BR Inventory Adjustment Header")
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforeApproval(var Header: Record "BR Inventory Adjustment Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterApproval(var Header: Record "BR Inventory Adjustment Header")
    begin
    end;
}