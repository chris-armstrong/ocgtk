class type file_attribute_matcher_t = object
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

(* High-level class for FileAttributeMatcher *)
class file_attribute_matcher (obj : File_attribute_matcher.t) : file_attribute_matcher_t = object (self)

  method enumerate_namespace : string -> bool =
    fun ns ->
      (File_attribute_matcher.enumerate_namespace obj ns)

  method enumerate_next : unit -> string option =
    fun () ->
      (File_attribute_matcher.enumerate_next obj)

  method matches : string -> bool =
    fun attribute ->
      (File_attribute_matcher.matches obj attribute)

  method matches_only : string -> bool =
    fun attribute ->
      (File_attribute_matcher.matches_only obj attribute)

  method ref : unit -> File_attribute_matcher.t =
    fun () ->
      (File_attribute_matcher.ref obj)

  method subtract : File_attribute_matcher.t option -> File_attribute_matcher.t option =
    fun subtract ->
      (File_attribute_matcher.subtract obj subtract)

  method to_string : unit -> string =
    fun () ->
      (File_attribute_matcher.to_string obj)

  method unref : unit -> unit =
    fun () ->
      (File_attribute_matcher.unref obj)

    method as_file_attribute_matcher = obj
end

