class file_attribute_matcher : File_attribute_matcher.t ->
  object
    method enumerate_namespace : string -> bool
    method enumerate_next : unit -> string option
    method matches : string -> bool
    method matches_only : string -> bool
    method ref : unit -> File_attribute_matcher.t
    method subtract : File_attribute_matcher.t option -> File_attribute_matcher.t option
    method to_string : unit -> string
    method unref : unit -> unit
    method as_file_attribute_matcher : File_attribute_matcher.t
  end

