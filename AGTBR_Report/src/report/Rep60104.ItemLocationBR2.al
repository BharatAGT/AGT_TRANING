// report 60104 "ItemLocationBR2"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './BrItemLocation.rdl';
//     Caption = 'BR Item Location Report';

//     dataset
//     {
//         dataitem(Item; Item)
//         {
//             RequestFilterFields = "No.";
//             // PrintOnlyIfDetail = true;

//             column(ItemNo; "No.") { }
//             column(Description; Description) { }

//             column(EastQty; SumEastQuantity) { }
//             column(WestQty; SumWestQuantity) { }
//             column(MainQty; SumMainQuantity) { }

//             column(TotalInventory; TotalInventory) { }

//             column(SalesQty; TotalSalesQty) { }
//             column(PurchaseQty; TotalPurchaseQty) { }

//             trigger OnAfterGetRecord()
//             begin

//                 SumEastQuantity := 0;
//                 SumWestQuantity := 0;
//                 SumMainQuantity := 0;
//                 TotalInventory := 0;
//                 TotalSalesQty := 0;
//                 TotalPurchaseQty := 0;


//                 recILE.Reset();
//                 recILE.SetRange("Item No.", Item."No.");

//                 if recILE.FindSet() then
//                     repeat

//                         TotalInventory += recILE."Remaining Quantity";


//                         if recILE."Location Code" = 'EAST' then
//                             SumEastQuantity += recILE."Remaining Quantity";

//                         if recILE."Location Code" = 'WEST' then
//                             SumWestQuantity += recILE."Remaining Quantity";

//                         if recILE."Location Code" = 'MAIN' then
//                             SumMainQuantity += recILE."Remaining Quantity";

//                     until recILE.Next() = 0;


//                 recSales.Reset();
//                 recSales.SetRange("No.", Item."No.");
//                 recSales.SetRange("Document Type", recSales."Document Type"::Order);
//                 recSales.SetFilter("Location Code", 'EAST|WEST|MAIN');

//                 if recSales.FindSet() then
//                     repeat
//                         TotalSalesQty += recSales.Quantity;
//                     until recSales.Next() = 0;


//                 recPurchase.Reset();
//                 recPurchase.SetRange("No.", Item."No.");
//                 recPurchase.SetRange("Document Type", recPurchase."Document Type"::Order);
//                 recPurchase.SetFilter("Location Code", 'EAST|WEST|MAIN');

//                 if recPurchase.FindSet() then
//                     repeat
//                         TotalPurchaseQty += recPurchase.Quantity;
//                     until recPurchase.Next() = 0;
//             end;
//         }
//     }

//     var
//         recILE: Record "Item Ledger Entry";
//         recSales: Record "Sales Line";
//         recPurchase: Record "Purchase Line";

//         SumEastQuantity: Decimal;
//         SumWestQuantity: Decimal;
//         SumMainQuantity: Decimal;

//         TotalInventory: Decimal;

//         TotalSalesQty: Decimal;
//         TotalPurchaseQty: Decimal;
// }