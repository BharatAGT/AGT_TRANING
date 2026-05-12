codeunit 60460 "BR Evaluation Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BR EvaluationManagement", 'OnAfterScoreCalculation', '', false, false)]

    local procedure OnAfterScoreCalculation(EvaluationNo: Code[20])
    var
        CommentLog: Record "BR Evaluation Comment Log";
    begin
        CommentLog.Init();
        CommentLog."Evaluation No." := EvaluationNo;
        CommentLog.Comments := 'Score calculated successfully.';
        CommentLog."Created By" := UserId;
        CommentLog."Created Date Time" := CurrentDateTime;
        CommentLog.Insert();

        Message('Score calculation completed.');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BR EvaluationManagement", 'OnAfterEvaluationCompleted', '', false, false)]

    local procedure OnAfterEvaluationCompleted(EvaluationNo: Code[20])
    var
        CommentLog: Record "BR Evaluation Comment Log";
    begin
        CommentLog.Init();
        CommentLog."Evaluation No." := EvaluationNo;
        CommentLog.Comments := 'Evaluation completed successfully.';
        CommentLog."Created By" := UserId;
        CommentLog."Created Date Time" := CurrentDateTime;
        CommentLog.Insert();

        Message('Evaluation completed successfully.');
    end;
}