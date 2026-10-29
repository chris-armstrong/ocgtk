(* GENERATED CODE - DO NOT EDIT *)
(* FileAttributeMatcher: FileAttributeMatcher *)

(** Determines if a string matches a file attribute.

    The class built on this module is in {!Ocgio.File_attribute_matcher}. *)

type t = [ `file_attribute_matcher ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_file_attribute_matcher_get_type"

external new_ : string -> t = "ml_g_file_attribute_matcher_new"
[@@ocaml.doc
  "Creates a new file attribute matcher, which matches attributes\n\
   against a given string. [GFileAttributeMatchers] are reference\n\
   counted structures, and are created with a reference count of 1. If\n\
   the number of references falls to 0, the [GFileAttributeMatcher] is\n\
   automatically destroyed.\n\n\
   The [attributes] string should be formatted with specific keys separated\n\
   from namespaces with a double colon. Several \"namespace::key\" strings may \
   be\n\
   concatenated with a single comma (e.g. \
   \"standard::type,standard::is-hidden\").\n\
   The wildcard \"{i \" may be used to match all keys and namespaces, or\n\
   \"namespace::}\" will match all keys in a given namespace.\n\n\
   {b Examples of file attribute matcher strings and results}\n\n\
   - [\"*\"]: matches all attributes.\n\
   - [\"standard::is-hidden\"]: matches only the key is-hidden in the\n\
   standard namespace.\n\
   - [\"standard::type,unix::*\"]: matches the type key in the standard\n\
   namespace and all keys in the unix namespace."]

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
   returns [false] if \"*\" was used when creating the matcher."]

external matches : t -> string -> bool = "ml_g_file_attribute_matcher_matches"
[@@ocaml.doc
  "Checks if an attribute will be matched by an attribute matcher. If\n\
   the matcher was created with the \"*\" matching string, this function\n\
   will always return [true]."]

external enumerate_next : t -> string option
  = "ml_g_file_attribute_matcher_enumerate_next"
(** Gets the next matched attribute from a [GFileAttributeMatcher]. *)

external enumerate_namespace : t -> string -> bool
  = "ml_g_file_attribute_matcher_enumerate_namespace"
[@@ocaml.doc
  "Checks if the matcher will match all of the keys in a given namespace.\n\
   This will always return [true] if a wildcard character is in use (e.g. if\n\
   matcher was created with \"standard::{i \" and [ns] is \"standard\", or if \
   matcher was created\n\
   using \"}\" and namespace is anything.)\n\n\
   TODO: this is awkwardly worded."]
