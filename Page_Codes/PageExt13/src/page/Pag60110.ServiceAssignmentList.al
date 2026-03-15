page 60110 "Service Assignment List"
{
    PageType = List;
    SourceTable = "Service Assignment";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Assignment No."; rec."Assignment No.") { }
                field("Customer Name"; rec."Customer Name") { }
                field("Service Cost"; rec."Service Cost") { }
                field(Status; rec.Status) { }
                field("Created Date"; rec."Created Date") { }
                field("Modified Date"; rec."Modified Date") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action("Create Assignment Automatically")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    Serv.Init();
                    Serv."Assignment No." := 'A001';
                    Serv."Customer Name" := 'Customer One';
                    Serv."Service Cost" := 100;

                    Serv.Insert(true); // OnInsert trigger runs
                end;
            }


            action("Create Assignment Without Trigger")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    Serv.Init();
                    Serv."Assignment No." := 'A002';
                    Serv."Customer Name" := 'Customer Two';
                    Serv."Service Cost" := 200;

                    Serv.Insert(false); // OnInsert will NOT run
                end;
            }


            action("Increase Service Cost")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    if Serv.FindFirst() then begin
                        Serv."Service Cost" := Serv."Service Cost" + 50;
                        Serv.Modify(true); // OnModify runs
                    end;
                end;
            }


            action("Modify Without Trigger")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    if Serv.FindFirst() then begin
                        Serv."Service Cost" := Serv."Service Cost" + 20;
                        Serv.Modify(false); // OnModify will NOT run
                    end;
                end;
            }


            action("Delete Assignment")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    if Serv.FindFirst() then
                        Serv.Delete(true);
                end;
            }


            action("Rename Assignment")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Serv: Record "Service Assignment";
                begin
                    if Serv.FindFirst() then
                        Serv.Rename('A100');
                end;
            }

        }
    }
}