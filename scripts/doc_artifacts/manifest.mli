(** The JSON file stored next to each artifact. *)

type t = {
  key : Artifact_key.t;
  branch : string;
  date : string;  (** ISO 8601, UTC. *)
  odoc_version : string;
  dune_version : string;
  byte_size : int;  (** Of the gzipped tar. *)
  html_file_count : int;
  note : string;
  odoc_warning_count : int;
}

val to_yojson : t -> Yojson.Safe.t
(** One object, fields in the order above with [sha] and [dirty] after [key]. *)

val to_json : t -> string
(** {!to_yojson}, pretty-printed, ending with a newline. *)
