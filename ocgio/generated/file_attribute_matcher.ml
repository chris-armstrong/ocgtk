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
