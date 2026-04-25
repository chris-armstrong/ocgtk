(** S-expression parser for GIR override files.

    Reads override files in the custom sexp format and produces
    {!Override_types.library_overrides} values. *)

(** Parse errors with context. *)
type parse_error =
  | Invalid_format of { location : string; message : string }
  | Unknown_entity_kind of string
  | Unknown_component_kind of {
      entity_name : string;
      kind : string;
      valid_kinds : string list;
    }
  | Duplicate_entity of { kind : string; name : string }
  | Duplicate_component of {
      entity : string;
      component_kind : string;
      name : string;
    }
  | Invalid_version of { name : string; version : string; reason : string }

val format_error : parse_error -> string
(** Format a parse error as a human-readable message. *)

val parse_overrides :
  string -> (Override_types.library_overrides, parse_error) result
(** [parse_overrides filename] reads and parses the override file. Returns
    [Error] with context on any parse failure. *)

val parse_overrides_from_string :
  string -> (Override_types.library_overrides, parse_error) result
(** [parse_overrides_from_string content] parses overrides from a string. Useful
    for testing. *)
