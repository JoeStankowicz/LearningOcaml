#load "str.cma";;
#load "SemVer.cma";;
(*If I load SemVer but don't open it, I get an error
"major was selected from type SemVer.semver. It is not visible in the current scope."*)
open SemVer ;;

let str = "100.200.300" in
let semVer = SemVer.semver_of_string str in
assert (semVer.major == 100 && semVer.minor == 200 && semVer.patch == 300) ;
SemVer.print semVer ;


