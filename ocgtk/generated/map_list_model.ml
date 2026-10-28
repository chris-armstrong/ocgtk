class type map_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that is currently being mapped or [NULL] if none. *)

  method has_map : unit -> bool
  (** Checks if a map function is currently set on [self]. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to be mapped.

      GTK makes no effort to ensure that [model] conforms to the item type
      expected by the map function. It assumes that the caller knows what they
      are doing and have set up an appropriate map function. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_map_list_model : Raw.Map_list_model.t
end

(* High-level class for MapListModel *)
class map_list_model (obj : Raw.Map_list_model.t) : map_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Map_list_model.get_model obj)

    method has_map : unit -> bool = fun () -> Raw.Map_list_model.has_map obj

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Map_list_model.set_model obj model

    method item_type = Raw.Map_list_model.get_item_type obj
    method n_items = Raw.Map_list_model.get_n_items obj
    method as_map_list_model = obj
  end
