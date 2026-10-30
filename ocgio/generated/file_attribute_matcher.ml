class type file_attribute_matcher_t = object
  (** {2:methods Methods} *)

  method enumerate_namespace : string -> bool
  [@@ocaml.doc
    "Checks if the matcher will match all of the keys in a given namespace.\n\
     This will always return [true] if a wildcard character is in use (e.g. if\n\
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
     will always return [true]."]

  method matches_only : string -> bool
  [@@ocaml.doc
    "Checks if an attribute matcher only matches a given attribute. Always\n\
     returns [false] if \"*\" was used when creating the matcher."]

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
      the format passed to [g_file_attribute_matcher_new ()]. The output
      however, might not be identical, as the matcher may decide to use a
      different order or omit needless parts. *)

  (** {2:conversions Conversions} *)

  method as_file_attribute_matcher : Raw.File_attribute_matcher.t
end

(* High-level class for FileAttributeMatcher *)
class file_attribute_matcher (obj : Raw.File_attribute_matcher.t) :
  file_attribute_matcher_t =
  object (self)
    method enumerate_namespace : string -> bool =
      fun ns -> Raw.File_attribute_matcher.enumerate_namespace obj ns

    method enumerate_next : unit -> string option =
      fun () -> Raw.File_attribute_matcher.enumerate_next obj

    method matches : string -> bool =
      fun attribute -> Raw.File_attribute_matcher.matches obj attribute

    method matches_only : string -> bool =
      fun attribute -> Raw.File_attribute_matcher.matches_only obj attribute

    method ref : unit -> Raw.File_attribute_matcher.t =
      fun () -> Raw.File_attribute_matcher.ref obj

    method subtract :
        Raw.File_attribute_matcher.t option ->
        Raw.File_attribute_matcher.t option =
      fun subtract -> Raw.File_attribute_matcher.subtract obj subtract

    method to_string : unit -> string =
      fun () -> Raw.File_attribute_matcher.to_string obj

    method as_file_attribute_matcher = obj
  end

let new_ (attributes : string) : file_attribute_matcher_t =
  let obj_ = Raw.File_attribute_matcher.new_ attributes in
  new file_attribute_matcher obj_
