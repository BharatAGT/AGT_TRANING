// codeunit 60359 "BR EvaluationManagement"
// {
//     procedure CalculateWeightedScore(Score: Decimal; Weightage: Decimal): Decimal
//     var
//         EvaluationLine: Record "BR Vendor Evaluation Line";
//         WeightedScore: Decimal;
//     begin
//         WeightedScore := (Score * Weightage) / 100;

//     end;

//     procedure CalculateFinalScore(vendorNo: Code[20]): Decimal
//     var
//         EvaluationLine: Record "BR Vendor Evaluation Line";
//         FinalScore: Decimal;
//     begin
//         EvaluationLine.SetRange("Evaluation No.", vendorNo);

//         if EvaluationLine.FindSet() then
//             repeat
//                 FinalScore += EvaluationLine.Score * EvaluationLine.Weightage / 100;
//             until EvaluationLine.Next() = 0;

//     end;

//     procedure AssignRating(FinalScore: Decimal): Text[20]

//     begin

//         if FinalScore >= 90 then
//             Message('Excellent')
//         else
//             if FinalScore >= 75 then
//                 Message('Good')
//             else
//                 if FinalScore >= 50 then
//                     Message('Average')
//                 else
//                     Message('Poor');
//     end;
// }