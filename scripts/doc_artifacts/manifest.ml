type t = {
  key : Artifact_key.t;
  branch : string;
  date : string;
  odoc_version : string;
  dune_version : string;
  byte_size : int;
  html_file_count : int;
  note : string;
  odoc_warning_count : int;
}

let is_dirty = function
  | Artifact_key.Clean _ -> false
  | Artifact_key.Dirty _ -> true

let to_yojson m : Yojson.Safe.t =
  `Assoc
    [
      ("key", `String (Artifact_key.to_string m.key));
      ("sha", `String (Artifact_key.sha m.key));
      ("dirty", `Bool (is_dirty m.key));
      ("branch", `String m.branch);
      ("date", `String m.date);
      ("odoc_version", `String m.odoc_version);
      ("dune_version", `String m.dune_version);
      ("byte_size", `Int m.byte_size);
      ("html_file_count", `Int m.html_file_count);
      ("note", `String m.note);
      ("odoc_warning_count", `Int m.odoc_warning_count);
    ]

let to_json m = Yojson.Safe.pretty_to_string (to_yojson m) ^ "\n"
