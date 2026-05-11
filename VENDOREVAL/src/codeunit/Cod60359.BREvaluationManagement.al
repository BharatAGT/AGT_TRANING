codeunit 60459 "BR EvaluationManagement"
{
    [IntegrationEvent(false, false)]
    procedure OnBeforeCompleteEvaluation(EvaluationNo: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterScoreCalculation(EvaluationNo: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterEvaluationCompleted(EvaluationNo: Code[20])
    begin
    end;

    procedure CalculateWeightedScore(Score: Decimal; Weightage: Decimal): Decimal
    var
        WeightedScore: Decimal;
    begin
        if Weightage = 0 then
            Error('Weightage cannot be zero');

        WeightedScore := (Score * Weightage) / 100;

        exit(WeightedScore);
    end;

    procedure CalculateFinalScore(EvaluationNo: Code[20]): Decimal
    var
        EvaluationLine: Record "BR Vendor Evaluation Line";
        FinalScore: Decimal;
    begin
        EvaluationLine.Reset();
        EvaluationLine.SetRange("Evaluation No.", EvaluationNo);

        if EvaluationLine.FindSet() then
            repeat
                FinalScore += EvaluationLine."Weighted Score";
            until EvaluationLine.Next() = 0;

        exit(FinalScore);
    end;

    procedure AssignRating(FinalScore: Decimal): Text[20]
    begin
        if FinalScore >= 90 then
            exit('Excellent')
        else
            if FinalScore >= 75 then
                exit('Good')
            else
                if FinalScore >= 50 then
                    exit('Average')
                else
                    exit('Poor');
    end;

    procedure CompleteEvaluation(var VendorEvaluationHeader: Record "BR Vendor Evaluation Header")
    var
        EvaluationLine: Record "BR Vendor Evaluation Line";
    begin
        OnBeforeCompleteEvaluation(VendorEvaluationHeader."Evaluation No.");

        EvaluationLine.Reset();
        EvaluationLine.SetRange("Evaluation No.", VendorEvaluationHeader."Evaluation No.");

        if not EvaluationLine.FindFirst() then
            Error('Cannot complete evaluation without lines');

        VendorEvaluationHeader.Status := VendorEvaluationHeader.Status::Completed;
        VendorEvaluationHeader.Modify();

        OnAfterEvaluationCompleted(VendorEvaluationHeader."Evaluation No.");
    end;
}