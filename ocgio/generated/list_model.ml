class type list_model_t = object
  method on_items_changed :
    ?after:bool ->
    callback:(position:int -> removed:int -> added:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_item_type : unit -> Gobject.Type.t
  (** Gets the type of the items in [list].

      All items returned from g_list_model_get_item() are of the type returned
      by this function, or a subtype, or if the type is an interface, they are
      an implementation of that interface.

      The item type of a [GListModel] can not change during the life of the
      model. *)

  method get_n_items : unit -> int
  (** Gets the number of items in [list].

      Depending on the model implementation, calling this function may be less
      efficient than iterating the list with increasing values for [position]
      until g_list_model_get_item() returns [NULL]. *)

  method get_object : int -> [ `object_ ] Gobject.obj option
  (** Get the item at [position].

      If [position] is greater than the number of items in [list], [NULL] is
      returned.

      [NULL] is never returned for an index that is smaller than the length of
      the list.

      This function is meant to be used by language bindings in place of
      g_list_model_get_item().

      See also: g_list_model_get_n_items() *)

  method items_changed : int -> int -> int -> unit
  (** Emits the [GListModel::items]-changed signal on [list].

      This function should only be called by classes implementing [GListModel].
      It has to be called after the internal representation of [list] has been
      updated, because handlers connected to this signal might query the new
      state of the list.

      Implementations must only make changes to the model (as visible to its
      consumer) in places that will not cause problems for that consumer. For
      models that are driven directly by a write API (such as [GListStore]),
      changes can be reported in response to uses of that API. For models that
      represent remote data, changes should only be made from a fresh mainloop
      dispatch. It is particularly not permitted to make changes in response to
      a call to the [GListModel] consumer API.

      Stated another way: in general, it is assumed that code making a series of
      accesses to the model via the API, without returning to the mainloop, and
      without calling other code, will continue to view the same contents of the
      model. *)

  method as_list_model : Raw.List_model.t
end

(* High-level class for ListModel *)
class list_model (obj : Raw.List_model.t) : list_model_t =
  object (self)
    method on_items_changed ?(after = false) ~callback () =
      Raw.List_model.on_items_changed ~after self#as_list_model ~callback

    method get_item_type : unit -> Gobject.Type.t =
      fun () -> Raw.List_model.get_item_type obj

    method get_n_items : unit -> int = fun () -> Raw.List_model.get_n_items obj

    method get_object : int -> [ `object_ ] Gobject.obj option =
      fun position -> Raw.List_model.get_object obj position

    method items_changed : int -> int -> int -> unit =
      fun position removed added ->
        Raw.List_model.items_changed obj position removed added

    method as_list_model = obj
  end
