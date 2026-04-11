class type accessible_list_t = object
  method as_accessible_list : Accessible_list.t
end

(* High-level class for AccessibleList *)
class accessible_list (obj : Accessible_list.t) : accessible_list_t =
  object (self)
    method as_accessible_list = obj
  end

let new_from_array (accessibles : At_context_and__accessible.Accessible.t array)
    (n_accessibles : Gsize.t) : accessible_list_t =
  let obj_ = Accessible_list.new_from_array accessibles n_accessibles in
  new accessible_list obj_
