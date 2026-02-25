// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.SCHOOL_LOOKUP;

using Microsoft.Sales.Customer;

pageextension 60139 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        // Message('App published: Hello world');
    end;
}