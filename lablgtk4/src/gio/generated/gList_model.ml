(* Signal class defined in glist_model_signals.ml *)

(* High-level class for ListModel *)
class list_model (obj : List_model.t) = object (self)
  inherit Glist_model_signals.list_model_signals obj

  method get_n_items : unit -> int =
    fun () ->
      (List_model.get_n_items obj)

  method items_changed : int -> int -> int -> unit =
    fun position removed added ->
      (List_model.items_changed obj position removed added)

    method as_list_model = obj
end

