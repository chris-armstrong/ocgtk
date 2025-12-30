(* High-level class for MenuAttributeIter *)
class menu_attribute_iter (obj : Menu_attribute_iter.t) = object (self)

  method get_name : unit -> string =
    fun () ->
      (Menu_attribute_iter.get_name obj)

  method next : unit -> bool =
    fun () ->
      (Menu_attribute_iter.next obj)

    method as_menu_attribute_iter = obj
end

