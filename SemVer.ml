open Printf

type semver = { major : int; minor : int; patch : int; }

let make_semver major minor patch =
{ major = int_of_string major; minor = int_of_string minor; patch = int_of_string patch; }

let semver_of_string str =
let r = Str.regexp "\\." in
let semversplit = Str.split r str in
match semversplit with
| [ major ; minor ; patch ] -> make_semver major minor patch
| [ major ; minor ] -> make_semver major minor "0"
| [ major ] -> make_semver major "0" "0"
| [] -> make_semver "0" "0" "0"

let print sv =
Printf.printf "%d.%d.%d" sv.major sv.minor sv.patch