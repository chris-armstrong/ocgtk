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

val new_ : string -> file_attribute_matcher_t
