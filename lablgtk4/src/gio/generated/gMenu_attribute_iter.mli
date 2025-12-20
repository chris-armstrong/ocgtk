class menu_attribute_iter : Menu_attribute_iter.t ->
  object
    method get_name : unit -> string
    method next : unit -> bool
    method as_menu_attribute_iter : Menu_attribute_iter.t
  end

