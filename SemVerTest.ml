(*in a real program, do this on the command line*)
#load "str.cma";;
#load "SemVer.cma";;
(*If I load SemVer but don't open it, I get an error
"major was selected from type SemVer.semver. It is not visible in the current scope."*)

(*this is a problem with how Ocaml does records.*)

(*should not have to open without operators, but will with operators*)
open SemVer ;;

(*Test string to semver conversion*)
let str = "100.200.300" in
let semVer = SemVer.semver_of_string str in
assert (semVer.SemVer.major == 100 && semVer.minor == 200 && semVer.patch == 300) ;
SemVer.print semVer ;

(*test comparison operators*)
let sv123 = { SemVer.major = 1; minor = 2; patch = 3; } in
let sv223 = { SemVer.major = 2; minor = 2; patch = 3; } in
let sv124 = { SemVer.major = 1; minor = 2; patch = 4; } in
let sv132 = { SemVer.major = 1; minor = 3; patch = 2; } in
(*left.major > right.major*)
assert(sv223 > sv123) ;
(*majors are equal, left.minor > right.minor*)
assert(sv132 > sv123) ;
(*major and minor match, left.patch > right.patch*)
assert(sv124 > sv123)
