#load "str.cma";;
#load "SemVer.cma";;

let str = "100.200.300" in
let r = Str.regexp "\\." in
let semversplit = Str.split r str in
match semversplit with
| [ major ; minor ; patch ] -> SemVer.make_semver major minor patch
| [ major ; minor ] -> SemVer.make_semver major minor "0"
| [ major ] -> SemVer.make_semver major "0" "0"
| [] -> SemVer.make_semver "0" "0" "0"
