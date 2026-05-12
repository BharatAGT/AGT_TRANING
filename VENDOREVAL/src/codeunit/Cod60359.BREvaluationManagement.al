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

    procedure CalculateWeightedScore(var EvaluationLine: Record "BR Vendor Evaluation Line")
    begin
        if EvaluationLine.Weightage = 0 then
            Error('Weightage cannot be zero.');

        EvaluationLine."Weighted Score" := (EvaluationLine.Score * EvaluationLine.Weightage) / 100;

        EvaluationLine.Modify();
    end;

    procedure CalculateFinalScore(EvaluationNo: Code[20]): Decimal
    var
        EvaluationLine: Record "BR Vendor Evaluation Line";
        FinalScore: Decimal;
    begin
        EvaluationLine.Reset();
        EvaluationLine.SetRange("Evaluation No.", EvaluationNo);

        if EvaluationLine.FindSet() then begin
            repeat
                FinalScore := FinalScore + EvaluationLine."Weighted Score";
            until EvaluationLine.Next() = 0;
        end;

        OnAfterScoreCalculation(EvaluationNo);

        exit(FinalScore);
    end;

    procedure AssignRating(var VendorEvaluationHeader: Record "BR Vendor Evaluation Header")
    begin
        if VendorEvaluationHeader."Final Score" >= 90 then VendorEvaluationHeader."Rating Status" :=
            VendorEvaluationHeader."Rating Status"::Excellent
        else
            if VendorEvaluationHeader."Final Score" >= 75 then VendorEvaluationHeader."Rating Status" :=
                VendorEvaluationHeader."Rating Status"::Good
            else
                if VendorEvaluationHeader."Final Score" >= 50 then VendorEvaluationHeader."Rating Status" :=
                    VendorEvaluationHeader."Rating Status"::Average
                else
                    VendorEvaluationHeader."Rating Status" := VendorEvaluationHeader."Rating Status"::Poor;

        VendorEvaluationHeader.Modify();
    end;

    procedure CompleteEvaluation(var VendorEvaluationHeader: Record "BR Vendor Evaluation Header")
    var
        EvaluationLine: Record "BR Vendor Evaluation Line";
    begin
        OnBeforeCompleteEvaluation(VendorEvaluationHeader."Evaluation No.");

        EvaluationLine.Reset();
        EvaluationLine.SetRange("Evaluation No.", VendorEvaluationHeader."Evaluation No.");

        if not EvaluationLine.FindFirst() then
            Error('Cannot complete evaluation without lines.');

        VendorEvaluationHeader.Status := VendorEvaluationHeader.Status::Completed;

        VendorEvaluationHeader.Modify();

        OnAfterEvaluationCompleted(VendorEvaluationHeader."Evaluation No.");

        Message('Evaluation completed successfully.');
    end;
}