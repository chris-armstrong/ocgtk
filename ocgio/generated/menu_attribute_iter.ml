class type menu_attribute_iter_t = object
  method get_name : unit -> string
  method get_value : unit -> Gvariant.t
  method next : unit -> bool
  method as_menu_attribute_iter : Raw.Menu_attribute_iter.t
end

(* High-level class for MenuAttributeIter *)
class menu_attribute_iter (obj : Raw.Menu_attribute_iter.t) :
  menu_attribute_iter_t =
  object (self)
    method get_name : unit -> string =
      fun () -> Raw.Menu_attribute_iter.get_name obj

    method get_value : unit -> Gvariant.t =
      fun () -> Raw.Menu_attribute_iter.get_value obj

    method next : unit -> bool = fun () -> Raw.Menu_attribute_iter.next obj
    method as_menu_attribute_iter = obj
  end
