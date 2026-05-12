codeunit 60610 "BR2 EventSubscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Management", OnAfterApproval, '', false, false)]
    local procedure OnAfterApproval(var Header: Record "BR Inventory Adjustment Header")
    var
        AuditEntry: Record "BR Adjustment Audit Log";
    begin
        AuditEntry.Init();
        AuditEntry."Adjustment No." := Header."Adjustment No.";
        AuditEntry."Action Type" := 'Approval';
        AuditEntry."User ID" := UserId;
        AuditEntry.Insert();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Posting Management", OnAfterPosting, '', false, false)]
    procedure OnAfterPosting(var Header: Record "BR Inventory Adjustment Header")
    var
        AuditEntry: Record "BR Adjustment Audit Log";

    begin
        AuditEntry.Init();
        AuditEntry."Adjustment No." := Header."Adjustment No.";
        AuditEntry."Action Type" := 'Posting';
        AuditEntry."User ID" := UserId;
        AuditEntry.Insert();

    end;
}