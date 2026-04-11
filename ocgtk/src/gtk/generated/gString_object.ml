class type string_object_t = object
    method get_string : unit -> string
    method as_string_object : String_object.t
end

(* High-level class for StringObject *)
class string_object (obj : String_object.t) : string_object_t = object (self)

  method get_string : unit -> string =
    fun () ->
      (String_object.get_string obj)

    method as_string_object = obj
end

let new_ (string : string) : string_object_t =
  let obj_ = String_object.new_ string in
  new string_object obj_

