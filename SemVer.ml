type semver = { major : int; minor : int; patch : int; }

let make_semver major minor patch =
{ major = int_of_string major; minor = int_of_string minor; patch = int_of_string patch; }

