(* Signal class defined in glist_model_signals.ml *)

class type list_model_t = object
    inherit Glist_model_signals.list_model_signals
    method get_n_items : unit -> int
    method items_changed : int -> int -> int -> unit
    method as_list_model : List_model.t
end

(* High-level class for ListModel *)
class list_model (obj : List_model.t) : list_model_t = object (self)
  inherit Glist_model_signals.list_model_signals obj

  method get_n_items : unit -> int =
    fun () ->
      (List_model.get_n_items obj)

  method items_changed : int -> int -> int -> unit =
    fun position removed added ->
      (List_model.items_changed obj position removed added)

    method as_list_model = obj
end

