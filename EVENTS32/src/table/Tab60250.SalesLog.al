// table 60250 "Sales Log"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             AutoIncrement = true;
//         }
//         field(2; "Document No."; Code[20]) { }
//         field(3; "User ID"; Code[50]) { }
//         field(4; "Action"; Option)
//         {
//             OptionMembers = Release,Reopen;
//         }
//         field(5; "Date Time"; DateTime) { }
//     }

//     keys
//     {
//         key(PK; "Entry No.")
//         {
//             Clustered = true;
//         }
//     }
// }