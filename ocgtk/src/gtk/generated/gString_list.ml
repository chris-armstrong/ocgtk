class type string_list_t = object
    method append : string -> unit
    method get_string : int -> string option
    method remove : int -> unit
    method splice : int -> int -> string array option -> unit
    method take : string -> unit
    method n_items : int
    method as_string_list : String_list.t
end

(* High-level class for StringList *)
class string_list (obj : String_list.t) : string_list_t = object (self)

  method append : string -> unit =
    fun string ->
      (String_list.append obj string)

  method get_string : int -> string option =
    fun position ->
      (String_list.get_string obj position)

  method remove : int -> unit =
    fun position ->
      (String_list.remove obj position)

  method splice : int -> int -> string array option -> unit =
    fun position n_removals additions ->
      (String_list.splice obj position n_removals additions)

  method take : string -> unit =
    fun string ->
      (String_list.take obj string)

  method n_items = String_list.get_n_items obj

    method as_string_list = obj
end

let new_ (strings : string array option) : string_list_t =
  let obj_ = String_list.new_ strings in
  new string_list obj_

