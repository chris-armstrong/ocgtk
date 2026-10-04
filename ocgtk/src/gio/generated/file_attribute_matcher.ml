(* GENERATED CODE - DO NOT EDIT *)
(* FileAttributeMatcher: FileAttributeMatcher *)

(** Determines if a string matches a file attribute. *)

type t = [ `file_attribute_matcher ] Gobject.obj

external new_ : string -> t = "ml_g_file_attribute_matcher_new"
(** Create a new FileAttributeMatcher *)

(* Methods *)

external to_string : t -> string = "ml_g_file_attribute_matcher_to_string"
(** Prints what the matcher is matching against. The format will be equal to the
    format passed to g_file_attribute_matcher_new(). The output however, might
    not be identical, as the matcher may decide to use a different order or omit
    needless parts. *)

external subtract : t -> t option -> t option
  = "ml_g_file_attribute_matcher_subtract"
(** Subtracts all attributes of [subtract] from [matcher] and returns a matcher
    that supports those attributes.

    Note that currently it is not possible to remove a single attribute when the
    [matcher] matches the whole namespace - or remove a namespace or attribute
    when the matcher matches everything. This is a limitation of the current
    implementation, but may be fixed in the future. *)

external ref : t -> t = "ml_g_file_attribute_matcher_ref"
(** References a file attribute matcher. *)

external matches_only : t -> string -> bool
  = "ml_g_file_attribute_matcher_matches_only"
[@@ocaml.doc
  "Checks if an attribute matcher only matches a given attribute. Always\n\
   returns [FALSE] if \"*\" was used when creating the matcher."]

external matches : t -> string -> bool = "ml_g_file_attribute_matcher_matches"
[@@ocaml.doc
  "Checks if an attribute will be matched by an attribute matcher. If\n\
   the matcher was created with the \"*\" matching string, this function\n\
   will always return [TRUE]."]

external enumerate_next : t -> string option
  = "ml_g_file_attribute_matcher_enumerate_next"
(** Gets the next matched attribute from a [GFileAttributeMatcher]. *)

external enumerate_namespace : t -> string -> bool
  = "ml_g_file_attribute_matcher_enumerate_namespace"
[@@ocaml.doc
  "Checks if the matcher will match all of the keys in a given namespace.\n\
   This will always return [TRUE] if a wildcard character is in use (e.g. if\n\
   matcher was created with \"standard::{i \" and [ns] is \"standard\", or if \
   matcher was created\n\
   using \"}\" and namespace is anything.)\n\n\
   TODO: this is awkwardly worded."]

external get_type : unit -> Gobject.Type.t
  = "ml_gio_file_attribute_matcher_get_type"
