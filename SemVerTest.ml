#load "str.cma";;
#load "SemVer.cmo";;


let str = "100.200.300" in
let r = Str.regexp "\\." in
let semversplit = Str.split r str in
match semversplit with
| [ major ; minor ; patch ] -> make_semver major minor patch
| [ major ; minor ] -> make_semver major minor "0"
| [ major ] -> make_semver major "0" "0"
| [] -> make_semver "0" "0" "0"
