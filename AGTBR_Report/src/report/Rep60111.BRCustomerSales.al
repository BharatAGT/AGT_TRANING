report 60111 "BR Customer Sales"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './BrCustomerSales.rdl';
    Caption = 'BR Customer Sales Report';


    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }
            column(CompanyName; COMPANYNAME) { }
            column(CurrentUser; USERID) { }
            column(E_Mail; "E-Mail") { }


            // column(CompanyPicture; CompanyInfo.Picture) { }


            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");
                DataItemTableView = where(Type = const(Item));

                column(ItemNo; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Amount; Amount) { }

            }
        }
    }
}