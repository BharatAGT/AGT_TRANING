report 60112 "Sales Confirmation"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './BrSalesConfirmation.rdl';
    Caption = 'BR Sales Confirmation Report';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";

            column(CompanyNameLbl; CompanyNameLbl) { }
            column(CompanyAddressLbl; CompanyAddressLbl) { }
            column(CompanyAddress2Lbl; CompanyAddress2Lbl) { }
            column(CompanyCityLbl; CompanyCityLbl) { }
            column(CompanyPostCodeLbl; CompanyPostCodeLbl) { }
            column(CompanyCountryLbl; CompanyCountryLbl) { }
            column(CompanyPhoneNoLbl; CompanyPhoneNoLbl) { }
            column(CompanyEmailLbl; CompanyEmailLbl) { }
            column(CompanyHomePageLbl; CompanyHomePageLbl) { }
            column(TaxRegistrationNoLbl; TaxRegistrationNoLbl) { }
            column(WorldWideWebLbl; WorldWideWebLbl) { }
            column(GiroNoLbl; GiroNoLbl) { }

            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyCountry; CompanyInfo."Country/Region Code") { }
            column(CompanyPhoneNo; CompanyInfo."Phone No.") { }
            column(CompanyEmail; CompanyInfo."E-Mail") { }
            column(CompanyHomePage; CompanyInfo."Home Page") { }
            column(TaxRegistrationNo; CompanyInfo."VAT Registration No.") { }
            column(GiroNo; CompanyInfo."Giro No.") { }

            column(CustomerPostalBarCodeLbl; CustomerPostalBarCodeLbl) { }
            column(BillToCustomerNoLbl; BillToCustomerNoLbl) { }
            column(BillToNameLbl; BillToNameLbl) { }
            column(BillToAddressLbl; BillToAddressLbl) { }
            column(BillToAddress2Lbl; BillToAddress2Lbl) { }
            column(BillToCityLbl; BillToCityLbl) { }
            column(BillToPostCodeLbl; BillToPostCodeLbl) { }
            column(BillToCountryLbl; BillToCountryLbl) { }
            column(PhoneNoLbl; PhoneNoLbl) { }
            column(EmailLbl2; EmailLbl2) { }

            column(CustomerPostalBarCode; '') { }
            column(BillToCustomerNo; "Bill-to Customer No.") { }
            column(BillToName; "Bill-to Name") { }
            column(BillToAddress; "Bill-to Address") { }
            column(BillToAddress2; "Bill-to Address 2") { }
            column(BillToCity; "Bill-to City") { }
            column(BillToPostCode; "Bill-to Post Code") { }
            column(BillToCountry; "Bill-to Country/Region Code") { }
            column(PhoneNo; "Sell-to Phone No.") { }
            column(Email; "Sell-to E-Mail") { }

            column(OrderNoLbl; OrderNoLbl) { }
            column(ExternalDocumentNoLbl; ExternalDocumentNoLbl) { }
            column(DocumentDateLbl; DocumentDateLbl) { }
            column(DueDateLbl; DueDateLbl) { }
            column(PaymentTermsLbl; PaymentTermsLbl) { }
            column(PaymentMethodLbl; PaymentMethodLbl) { }
            column(QuoteNoLbl; QuoteNoLbl) { }
            column(SalespersonCodeLbl; SalespersonCodeLbl) { }
            column(SalespersonNameLbl; SalespersonNameLbl) { }

            column(OrderNo; "No.") { }
            column(ExternalDocumentNo; "External Document No.") { }
            column(DocumentDate; "Document Date") { }
            column(DueDate; "Due Date") { }
            column(PaymentTerms; "Payment Terms Code") { }
            column(PaymentMethod; "Payment Method Code") { }
            column(QuoteNo; "Quote No.") { }
            column(SalespersonCode; "Salesperson Code") { }
            column(SalespersonName; SalespersonName) { }

            column(BankNameLbl; BankNameLbl) { }
            column(BankAccountNoLbl; BankAccountNoLbl) { }
            column(IBANLbl; IBANLbl) { }
            column(SWIFTCodeLbl; SWIFTCodeLbl) { }

            column(BankName; CompanyBankAccount.Name) { }
            column(BankAccountNo; CompanyBankAccount."Bank Account No.") { }
            column(IBAN; CompanyInfo.IBAN) { }
            column(SWIFTCode; CompanyInfo."SWIFT Code") { }
            column(CompanyBankName; CompanyBankAccount.Name) { }
            column(CompanyBankBranchNo; CompanyBankAccount."Bank Branch No.") { }

            column(TaxLbl; TaxLbl) { }
            column(SubtotalLbl; SubtotalLbl) { }
            column(TotalInclTaxLbl; TotalInclTaxLbl) { }
            column(Tax; Tax) { }
            column(Subtotal; Amount) { }
            column(TotalInclTax; "Amount Including VAT") { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Header";

                column(ItemNoLbl; ItemNoLbl) { }
                column(DescriptionLbl; DescriptionLbl) { }
                column(Description2Lbl; Description2Lbl) { }
                column(QuantityLbl; QuantityLbl) { }
                column(UnitOfMeasureLbl; UnitOfMeasureLbl) { }
                column(UnitPriceLbl; UnitPriceLbl) { }
                column(VATPercentLbl; VATPercentLbl) { }
                column(LineDiscountPercentLbl; LineDiscountPercentLbl) { }
                column(LineAmountLbl; LineAmountLbl) { }
                column(AmountLbl; AmountLbl) { }
                column(AmountIncludingVATLbl; AmountIncludingVATLbl) { }

                column(ItemNo; "No.") { }
                column(Description; Description) { }
                column(Description2; "Description 2") { }
                column(Quantity; Quantity) { }
                column(UnitOfMeasure; "Unit of Measure") { }
                column(UnitPrice; "Unit Price") { }
                column(VATPercent; "VAT %") { }
                column(LineDiscountPercent; "Line Discount %") { }
                column(LineAmount; "Line Amount") { }
                column(Amount; Amount) { }
                column(AmountIncludingVAT; "Amount Including VAT") { }
                // column(LegalEntityType; Cust.GetLegalEntityType())
                // {
                // }
                // column(LegalEntityType_Lbl; Cust.GetLegalEntityTypeLbl())
                // {
                // }
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Amount, "Amount Including VAT");
                Tax := "Amount Including VAT" - Amount;


                SalespersonName := '';
                if "Salesperson Code" <> '' then
                    if SalespersonPurchaser.Get("Salesperson Code") then
                        SalespersonName := SalespersonPurchaser.Name
                    else
                        SalespersonName := "Salesperson Code";
            end;
        }
    }

    trigger OnPreReport()
    begin
        if CompanyInfo.Get() then;


        CompanyBankAccount.Reset();
        if CompanyBankAccount.FindFirst() then;
    end;

    var
        CompanyInfo: Record "Company Information";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        SalespersonName: Text[100];
        Tax: Decimal;
        CompanyBankAccount: Record "Bank Account";

        CompanyNameLbl: Label 'Company Name';
        CompanyAddressLbl: Label 'Company Address';
        CompanyAddress2Lbl: Label 'Address 2';
        CompanyCityLbl: Label 'City';
        CompanyPostCodeLbl: Label 'Post Code';
        CompanyCountryLbl: Label 'Country';
        CompanyPhoneNoLbl: Label 'Phone No.';
        CompanyEmailLbl: Label 'Email';
        CompanyHomePageLbl: Label 'Home Page';
        TaxRegistrationNoLbl: Label 'Tax Registration No.';
        WorldWideWebLbl: Label 'World Wide Web';
        GiroNoLbl: Label 'Giro No.';

        CustomerPostalBarCodeLbl: Label 'Postal Bar Code';
        BillToCustomerNoLbl: Label 'Customer No.';
        BillToNameLbl: Label 'Customer Name';
        BillToAddressLbl: Label 'Address';
        BillToAddress2Lbl: Label 'Address 2';
        BillToCityLbl: Label 'City';
        BillToPostCodeLbl: Label 'Post Code';
        BillToCountryLbl: Label 'Country';
        PhoneNoLbl: Label 'Phone No.';
        EmailLbl2: Label 'Email';

        OrderNoLbl: Label 'Order No.';
        ExternalDocumentNoLbl: Label 'External Document No.';
        DocumentDateLbl: Label 'Document Date';
        DueDateLbl: Label 'Due Date';
        PaymentTermsLbl: Label 'Payment Terms';
        PaymentMethodLbl: Label 'Payment Method';
        QuoteNoLbl: Label 'Quote No.';
        SalespersonCodeLbl: Label 'Salesperson Code';
        SalespersonNameLbl: Label 'Salesperson Name';

        BankNameLbl: Label 'Bank Name';
        BankAccountNoLbl: Label 'Bank Account No.';
        IBANLbl: Label 'IBAN';
        SWIFTCodeLbl: Label 'SWIFT Code';

        ItemNoLbl: Label 'Item No.';
        DescriptionLbl: Label 'Description';
        Description2Lbl: Label 'Description 2';
        QuantityLbl: Label 'Quantity';
        UnitOfMeasureLbl: Label 'Unit Of Measure';
        UnitPriceLbl: Label 'Unit Price';
        VATPercentLbl: Label 'VAT %';
        LineDiscountPercentLbl: Label 'Line Discount %';
        LineAmountLbl: Label 'Line Amount';
        AmountLbl: Label 'Amount';
        AmountIncludingVATLbl: Label 'Amount Including VAT';

        TaxLbl: Label 'Tax Amount';
        SubtotalLbl: Label 'Subtotal';
        TotalInclTaxLbl: Label 'Total Incl. Tax';
}