// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ALProject1;

using Microsoft.Sales.Customer;
using Microsoft.Purchases.Document;

pageextension 60138 CustomerListExt extends "Purchase Order List"
{
    //AGTBR100226++
    trigger OnOpenPage();
    begin
        //Message('App published: Bharat Ranjan');
    end;
    //AGTBR100226--
}