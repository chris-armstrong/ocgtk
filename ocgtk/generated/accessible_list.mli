class type accessible_list_t = object
  method get_objects : unit -> At_context_and__accessible.accessible_t list
  method as_accessible_list : Raw.Accessible_list.t
end

class accessible_list : Raw.Accessible_list.t -> accessible_list_t

val new_from_array : Raw.Accessible.t array -> Gsize.t -> accessible_list_t
val new_from_list : Raw.Accessible.t list -> accessible_list_t
