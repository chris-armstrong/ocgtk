(* Shared char/string predicates for Doc_parse and Doc_render; see the .mli. *)

let is_upper = CCChar.is_uppercase_ascii
let is_lower = CCChar.is_lowercase_ascii
let is_digit = CCChar.is_digit_ascii
let is_letter = CCChar.is_letter_ascii
let is_ident_char c = is_letter c || is_digit c || c = '_'

let is_escapeable c =
  c = '`' || c = '*' || c = '_' || c = '{' || c = '}' || c = '[' || c = ']'
  || c = '(' || c = ')' || c = '#' || c = '+' || c = '-' || c = '.' || c = '!'
  || c = '|' || c = '>' || c = '<' || c = '~' || c = '@' || c = '\\'

let starts_with s pos prefix = CCString.find ~start:pos ~sub:prefix s = pos
let contains_sub s sub = CCString.mem ~sub s
let is_blank_line line = CCString.is_empty (String.trim line)

let strip_trailing_newline s =
  CCString.chop_suffix ~suf:"\n" s |> Option.value ~default:s
