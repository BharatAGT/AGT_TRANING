page 60102 "Employee Card BR"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("EMP no."; Rec."EMP no.")
                {

                    ApplicationArea = All;
                    Caption = 'Employee No.';
                }
                field("EMP Name"; Rec."EMP Name")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    Caption = 'Project No.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Caption = 'Project Name';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Lookup: Record "Project";
                    begin
                        // if Page.RunModal(Page::"Project List BR", Lookup) = Action::Cancel then begin
                        //     Rec."Project No." := Lookup."Project No.";
                        //     Rec."Project Name" := Lookup."Project Name";

                        // end;


                        // if Page.RunModal(Page::"Project List BR", Lookup) = Action::OK then begin
                        //     Rec."Project No." := Lookup."Project No.";
                        //     Rec."Project Name" := Lookup."Project Name";

                        // end;

                        // if Page.RunModal(Page::"Project List BR", Lookup) = Action::None then begin
                        //     Rec."Project No." := Lookup."Project No.";
                        //     Rec."Project Name" := Lookup."Project Name";

                        // end;

                        if Page.RunModal(Page::"Project List BR", Lookup) = Action::LookupOK then begin
                            Rec."Project No." := Lookup."Project No.";
                            Rec."Project Name" := Lookup."Project Name";

                        end;



                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin
                    page.Run(Page::"Project List BR");
                    Message('Action triggered');

                end;
            }
        }
    }

    // trigger OnOpenPage()

    // begin
    //     CurrPage.Update();
    //     Message('This is Coming from OnOpenPage trigger');

    // end;

    var
        myInt: Integer;
}