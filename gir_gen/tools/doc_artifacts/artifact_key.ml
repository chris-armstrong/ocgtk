type t = Clean of string | Dirty of string

let dirty_suffix = "-dirty"

let is_full_sha s =
  String.length s = 40
  && String.for_all (function '0' .. '9' | 'a' .. 'f' -> true | _ -> false) s

let of_tree ~sha ~is_dirty =
  if not (is_full_sha sha) then
    Error (Printf.sprintf "not a full commit sha: %S" sha)
  else if is_dirty then Ok (Dirty sha)
  else Ok (Clean sha)

let of_string s =
  let suffix_len = String.length dirty_suffix in
  let len = String.length s in
  if len > suffix_len && String.ends_with ~suffix:dirty_suffix s then
    of_tree ~sha:(String.sub s 0 (len - suffix_len)) ~is_dirty:true
  else of_tree ~sha:s ~is_dirty:false

let to_string = function Clean sha -> sha | Dirty sha -> sha ^ dirty_suffix
let sha = function Clean sha | Dirty sha -> sha

let resolve ~available query =
  let is_query = String.equal query in
  let has_prefix key = String.starts_with ~prefix:query key in
  match List.find_opt is_query available with
  | Some key -> of_string key
  | None -> (
      match List.filter has_prefix available with
      | [ key ] -> of_string key
      | [] -> Error (Printf.sprintf "no artifact for %S" query)
      | keys ->
          Error
            (Printf.sprintf "%S matches %d artifacts: %s" query
               (List.length keys) (String.concat ", " keys)))
