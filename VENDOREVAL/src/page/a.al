codeunit 60460 "BR Evaluation Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BR EvaluationManagement", 'OnAfterScoreCalculation', '', false, false)]

    local procedure OnAfterScoreCalculation(EvaluationNo: Code[20])
    begin
        Message('Score Calculated Successfully for %1', EvaluationNo);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BR EvaluationManagement", 'OnAfterEvaluationCompleted', '', false, false)]

    local procedure OnAfterEvaluationCompleted(EvaluationNo: Code[20])
    var
        CommentLog: Record "BR Evaluation Comment Log";
    begin
        CommentLog.Init();
        CommentLog."Evaluation No." := EvaluationNo;
        CommentLog.Comments := 'Evaluation Completed';
        CommentLog."Created By" := UserId;
        CommentLog."Created DateTime" := CurrentDateTime();
        CommentLog.Insert();

        Message('Evaluation Completed Successfully');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BR EvaluationManagement", 'OnBeforeCompleteEvaluation', '', false, false)]

    local procedure OnBeforeCompleteEvaluation(EvaluationNo: Code[20])
    begin
        Message('Evaluation is about to complete : %1', EvaluationNo);
    end;
}