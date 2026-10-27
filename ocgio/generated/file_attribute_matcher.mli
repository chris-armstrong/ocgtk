(** Determines if a string matches a file attribute.

    Its methods, signals and properties are on
    {!class-type-file_attribute_matcher_t}. The functions it is built on are in
    {!Ocgio.Raw.File_attribute_matcher}. *)

(** The methods, signals and properties of a [GFileAttributeMatcher]. *)
class type file_attribute_matcher_t = object
  method enumerate_namespace : string -> bool
  [@@ocaml.doc
    "Checks if the matcher will match all of the keys in a given namespace.\n\
     This will always return [TRUE] if a wildcard character is in use (e.g. if\n\
     matcher was created with \"standard::{i \" and [ns] is \"standard\", or \
     if matcher was created\n\
     using \"}\" and namespace is anything.)\n\n\
     TODO: this is awkwardly worded."]

  method enumerate_next : unit -> string option
  (** Gets the next matched attribute from a [GFileAttributeMatcher]. *)

  method matches : string -> bool
  [@@ocaml.doc
    "Checks if an attribute will be matched by an attribute matcher. If\n\
     the matcher was created with the \"*\" matching string, this function\n\
     will always return [TRUE]."]

  method matches_only : string -> bool
  [@@ocaml.doc
    "Checks if an attribute matcher only matches a given attribute. Always\n\
     returns [FALSE] if \"*\" was used when creating the matcher."]

  method ref : unit -> Raw.File_attribute_matcher.t
  (** References a file attribute matcher. *)

  method subtract :
    Raw.File_attribute_matcher.t option -> Raw.File_attribute_matcher.t option
  (** Subtracts all attributes of [subtract] from [matcher] and returns a
      matcher that supports those attributes.

      Note that currently it is not possible to remove a single attribute when
      the [matcher] matches the whole namespace - or remove a namespace or
      attribute when the matcher matches everything. This is a limitation of the
      current implementation, but may be fixed in the future. *)

  method to_string : unit -> string
  (** Prints what the matcher is matching against. The format will be equal to
      the format passed to g_file_attribute_matcher_new(). The output however,
      might not be identical, as the matcher may decide to use a different order
      or omit needless parts. *)

  method as_file_attribute_matcher : Raw.File_attribute_matcher.t
end

class file_attribute_matcher :
  Raw.File_attribute_matcher.t ->
  file_attribute_matcher_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_attribute_matcher.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GFileAttributeMatcher], give one already wrapped. *)

val new_ : string -> file_attribute_matcher_t
