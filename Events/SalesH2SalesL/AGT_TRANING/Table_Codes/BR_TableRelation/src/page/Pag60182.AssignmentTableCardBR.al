page 60182 "Assignment Table Card BR"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Assignment Table BR";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.") { ApplicationArea = All; }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemRec: Record "Master Table BR";
                    begin
                        ItemRec.SetRange("Item Type", ItemRec."Item Type"::Service);

                        if Page.RunModal(Page::"Master Table List BR", ItemRec) = Action::LookupOK then begin
                            Rec."Item No." := ItemRec."Item No.";
                            Rec."Item Name" := ItemRec."Item Name";
                            Rec."Service Cost" := ItemRec."Service Cost";

                            CurrPage.Update();
                        end;

                        exit(true);
                    end;
                }

                field("Item Name"; Rec."Item Name") { ApplicationArea = All; }
                field("Service Cost"; Rec."Service Cost") { ApplicationArea = All; }
                field("Technician Name"; Rec."Technician Name") { ApplicationArea = All; }
                field("Assignment Date"; Rec."Assignment Date") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("View Items")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemRec: Record "Master Table BR";
                begin
                    Page.Run(Page::"Master Table List BR", ItemRec);
                end;
            }
        }
    }
}