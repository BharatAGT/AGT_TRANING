codeunit 60299 "Credit Limit Logger29"
{
    [EventSubscriber(ObjectType::Table, Database::Customer,
    'OnAfterValidateEvent', 'Credit Limit (LCY)', false, false)]
    local procedure LogCreditLimitChange(var Rec: Record Customer; var xRec: Record Customer)
    var
        LogRec: Record "Credit Limit Log BR 29";
    begin
        // If there is a change in credit limit, then log the change
        if Rec."Credit Limit (LCY)" <> xRec."Credit Limit (LCY)" then begin

            LogRec.Init();
            LogRec.Validate("Customer No.", Rec."No.");
            LogRec.Validate("Old Credit Limit", xRec."Credit Limit (LCY)");
            LogRec.Validate("New Credit Limit", Rec."Credit Limit (LCY)");
            LogRec.Validate("User ID", UserId);
            LogRec.Validate("Changed At", CurrentDateTime);
            LogRec.Insert();
        end;
    end;
}