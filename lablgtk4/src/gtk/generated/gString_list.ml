(* High-level class for StringList *)
class string_list (obj : String_list.t) = object (self)

  method n_items = String_list.get_n_items obj

  method append : string -> unit = fun string -> (String_list.append obj string)

  method get_string : int -> string option = fun position -> (String_list.get_string obj position)

  method remove : int -> unit = fun position -> (String_list.remove obj position)

    method as_string_list = obj
end

