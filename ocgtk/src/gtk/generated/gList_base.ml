(* High-level class for ListBase *)
class list_base (obj : List_base.t) = object (self)

  method orientation = List_base.get_orientation obj
  method set_orientation v =  List_base.set_orientation obj v

    method as_list_base = obj
end

