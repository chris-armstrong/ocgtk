(* GENERATED CODE - DO NOT EDIT *)
(* FileAttributeMatcher: FileAttributeMatcher *)

(** Determines if a string matches a file attribute. *)
type t = [`file_attribute_matcher] Gobject.obj

(** Create a new FileAttributeMatcher *)
external new_ : string -> t = "ml_g_file_attribute_matcher_new"

(* Methods *)
(** Unreferences @matcher. If the reference count falls below 1,
the @matcher is automatically freed. *)
external unref : t -> unit = "ml_g_file_attribute_matcher_unref"

(** Prints what the matcher is matching against. The format will be
equal to the format passed to g_file_attribute_matcher_new().
The output however, might not be identical, as the matcher may
decide to use a different order or omit needless parts. *)
external to_string : t -> string = "ml_g_file_attribute_matcher_to_string"

(** Subtracts all attributes of @subtract from @matcher and returns
a matcher that supports those attributes.

Note that currently it is not possible to remove a single
attribute when the @matcher matches the whole namespace - or remove
a namespace or attribute when the matcher matches everything. This
is a limitation of the current implementation, but may be fixed
in the future. *)
external subtract : t -> t option -> t option = "ml_g_file_attribute_matcher_subtract"

(** References a file attribute matcher. *)
external ref : t -> t = "ml_g_file_attribute_matcher_ref"

(** Checks if an attribute matcher only matches a given attribute. Always
returns %FALSE if "*" was used when creating the matcher. *)
external matches_only : t -> string -> bool = "ml_g_file_attribute_matcher_matches_only"

(** Checks if an attribute will be matched by an attribute matcher. If
the matcher was created with the "*" matching string, this function
will always return %TRUE. *)
external matches : t -> string -> bool = "ml_g_file_attribute_matcher_matches"

(** Gets the next matched attribute from a #GFileAttributeMatcher. *)
external enumerate_next : t -> string option = "ml_g_file_attribute_matcher_enumerate_next"

(** Checks if the matcher will match all of the keys in a given namespace.
This will always return %TRUE if a wildcard character is in use (e.g. if
matcher was created with "standard::*" and @ns is "standard", or if matcher was created
using "*" and namespace is anything.)

TODO: this is awkwardly worded. *)
external enumerate_namespace : t -> string -> bool = "ml_g_file_attribute_matcher_enumerate_namespace"

