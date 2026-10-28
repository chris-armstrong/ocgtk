class type string_object_t = object
  method get_string : unit -> string
  (** Returns the string contained in a [GtkStringObject]. *)

  method as_string_object : Raw.String_object.t
end

(* High-level class for StringObject *)
class string_object (obj : Raw.String_object.t) : string_object_t =
  object (self)
    method get_string : unit -> string =
      fun () -> Raw.String_object.get_string obj

    method as_string_object = obj
  end

let new_ (string : string) : string_object_t =
  let obj_ = Raw.String_object.new_ string in
  new string_object obj_
