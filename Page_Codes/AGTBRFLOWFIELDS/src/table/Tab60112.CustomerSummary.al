table 60112 "Customer Summary"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer no."; code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer no.';
        }
        field(2; "Total Sales"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Sum("Sales Entry".Amount
                    where("Customer no." = field("Customer no.")));
        }
        field(3; "Total Entries"; Integer)
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Count("Sales Entry"
                  where("Customer no." = field("Customer no.")));
                  
        }
        field(4; "Average Sales"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Average("Sales Entry".Amount
                  WHERE("Customer no." = FIELD("Customer no.")));
        }
        field(5; "Minimum Sale"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Min("Sales Entry".Amount
                  WHERE("Customer no." = FIELD("Customer no.")));
        }
        field(6; "Maximum Sale"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Max("Sales Entry".Amount
                  WHERE("Customer no." = FIELD("Customer no.")));
        }
        field(7; "Has Sale"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("Sales Entry"
                  WHERE("Customer no." = FIELD("Customer no.")));
        }
    }


}

