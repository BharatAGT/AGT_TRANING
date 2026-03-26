codeunit 60117 BharatEXTVndor
{
    [EventSubscriber(ObjectType::Table, database::customer, OnAfterValidateEvent, 'name', false, false)]
    local procedure MyProcedure()
    begin
        Message('This is coming from Bharat :');
    end;
}