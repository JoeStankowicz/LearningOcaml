#load "str.cma";;
#load "SemVer.cma";;
(*If I load SemVer but don't open it, I get an error
"major was selected from type SemVer.semver. It is not visible in the current scope."*)
open SemVer ;;

(*Test string to semver conversion*)
let str = "100.200.300" in
let semVer = SemVer.semver_of_string str in
assert (semVer.major == 100 && semVer.minor == 200 && semVer.patch == 300) ;
SemVer.print semVer ;

(*test comparison operators*)
let sv123 = { major = 1; minor = 2; patch = 3; } in
let sv223 = { major = 2; minor = 2; patch = 3; } in
let sv124 = { major = 1; minor = 2; patch = 4; } in
let sv132 = { major = 1; minor = 3; patch = 2; } in
(*left.major > right.major*)
assert(SemVer.greater_than sv223 sv123) ;
(*majors are equal, left.minor > right.minor*)
assert(SemVer.greater_than sv132 sv123) ;
(*major and minor match, left.patch > right.patch*)
assert(SemVer.greater_than sv124 sv123)
