(** Determines if a string matches a file attribute.

    Its methods, signals and properties are on
    {!class-type-file_attribute_matcher_t}. The functions it is built on are in
    {!Ocgio.Raw.File_attribute_matcher}. *)

(** The methods, signals and properties of a [GFileAttributeMatcher]. *)
class type file_attribute_matcher_t = object
  method enumerate_namespace : string -> bool
  method enumerate_next : unit -> string option
  method matches : string -> bool
  method matches_only : string -> bool
  method ref : unit -> Raw.File_attribute_matcher.t

  method subtract :
    Raw.File_attribute_matcher.t option -> Raw.File_attribute_matcher.t option

  method to_string : unit -> string
  method as_file_attribute_matcher : Raw.File_attribute_matcher.t
end

class file_attribute_matcher :
  Raw.File_attribute_matcher.t ->
  file_attribute_matcher_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_attribute_matcher.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GFileAttributeMatcher], give one already wrapped. *)

val new_ : string -> file_attribute_matcher_t
