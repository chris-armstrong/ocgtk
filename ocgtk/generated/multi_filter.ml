class type multi_filter_t = object
  inherit Filter.filter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  (** {2:methods Methods} *)

  method append : Filter.filter_t -> unit
  (** Adds a filter. *)

  method remove : int -> unit
  (** Removes a filter.

      If [position] is larger than the number of filters, nothing happens. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items.

      See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items.

      See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_multi_filter : Raw.Multi_filter.t
end

(* High-level class for MultiFilter *)
class multi_filter (obj : Raw.Multi_filter.t) : multi_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method append : Filter.filter_t -> unit =
      fun filter ->
        let filter = filter#as_filter in
        Raw.Multi_filter.append obj filter

    method remove : int -> unit =
      fun position -> Raw.Multi_filter.remove obj position

    method item_type = Raw.Multi_filter.get_item_type obj
    method n_items = Raw.Multi_filter.get_n_items obj
    method as_multi_filter = obj
  end
