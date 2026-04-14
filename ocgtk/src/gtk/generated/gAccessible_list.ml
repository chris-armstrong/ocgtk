class type accessible_list_t = object
    method get_objects : unit -> GAt_context_and__accessible.accessible_t list
    method as_accessible_list : Accessible_list.t
end

(* High-level class for AccessibleList *)
class accessible_list (obj : Accessible_list.t) : accessible_list_t = object (self)

  method get_objects : unit -> GAt_context_and__accessible.accessible_t list =
    fun () ->
      (List.map (fun ret -> new GAt_context_and__accessible.accessible ret))(Accessible_list.get_objects obj)

    method as_accessible_list = obj
end

let new_from_array (accessibles : At_context_and__accessible.Accessible.t array) (n_accessibles : Gsize.t) : accessible_list_t =
  let obj_ = Accessible_list.new_from_array accessibles n_accessibles in
  new accessible_list obj_

let new_from_list (list : At_context_and__accessible.Accessible.t list) : accessible_list_t =
  let obj_ = Accessible_list.new_from_list list in
  new accessible_list obj_

