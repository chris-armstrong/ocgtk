(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type menu_link_iter_t = object
  (** {2:methods Methods} *)

  method get_name : unit -> string
  (** Gets the name of the link at the current iterator position.

      The iterator is not advanced. *)

  method get_value : unit -> menu_model_t
  (** Gets the linked [GMenuModel] at the current iterator position.

      The iterator is not advanced. *)

  method next : unit -> bool
  (** Attempts to advance the iterator to the next (possibly first) link.

      [TRUE] is returned on success, or [FALSE] if there are no more links.

      You must call this function when you first acquire the iterator to advance
      it to the first link (and determine if the first link exists at all). *)

  (** {2:conversions Conversions} *)

  method as_menu_link_iter : Raw.Menu_link_iter.t
end

and menu_model_t = object
  (** {2:signals Signals} *)

  method on_items_changed :
    ?after:bool ->
    callback:(position:int -> removed:int -> added:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a change has occurred to the menu.

      The only changes that can occur to a menu is that items are removed or
      added. Items may not change (except by being removed and added back in the
      same location). This signal is capable of describing both of those changes
      (at the same time).

      The signal means that starting at the index [position], [removed] items
      were removed and [added] items were added in their place. If [removed] is
      zero then only items were added. If [added] is zero then only items were
      removed.

      As an example, if the menu contains items a, b, c, d (in that order) and
      the signal (2, 1, 3) occurs then the new composition of the menu will be
      a, b, _, _, _, d (with each _ representing some new item).

      Signal handlers may query the model (particularly the added items) and
      expect to see the results of the modification that is being reported. The
      signal is emitted after the modification. *)

  (** {2:methods Methods} *)

  method get_item_attribute_value :
    int -> string -> Gvariant_type.t option -> Gvariant.t option
  (** Queries the item at position [item_index] in [model] for the attribute
      specified by [attribute].

      If [expected_type] is non-[NULL] then it specifies the expected type of
      the attribute. If it is [NULL] then any type will be accepted.

      If the attribute exists and matches [expected_type] (or if the expected
      type is unspecified) then the value is returned.

      If the attribute does not exist, or does not match the expected type then
      [NULL] is returned. *)

  method get_item_link : int -> string -> menu_model_t option
  (** Queries the item at position [item_index] in [model] for the link
      specified by [link].

      If the link exists, the linked [GMenuModel] is returned. If the link does
      not exist, [NULL] is returned. *)

  method get_n_items : unit -> int
  (** Query the number of items in [model]. *)

  method is_mutable : unit -> bool
  (** Queries if [model] is mutable.

      An immutable [GMenuModel] will never emit the [GMenuModel::items]-changed
      signal. Consumers of the model may make optimisations accordingly. *)

  method items_changed : int -> int -> int -> unit
  (** Requests emission of the [GMenuModel::items]-changed signal on [model].

      This function should never be called except by [GMenuModel] subclasses.
      Any other calls to this function will very likely lead to a violation of
      the interface of the model.

      The implementation should update its internal representation of the menu
      before emitting the signal. The implementation should further expect to
      receive queries about the new state of the menu (and particularly added
      menu items) while signal handlers are running.

      The implementation must dispatch this call directly from a mainloop entry
      and not in response to calls -- particularly those from the [GMenuModel]
      API. Said another way: the menu must not change while user code is running
      without returning to the mainloop. *)

  method iterate_item_attributes :
    int -> Menu_attribute_iter.menu_attribute_iter_t
  (** Creates a [GMenuAttributeIter] to iterate over the attributes of the item
      at position [item_index] in [model].

      You must free the iterator with g_object_unref() when you are done. *)

  method iterate_item_links : int -> menu_link_iter_t
  (** Creates a [GMenuLinkIter] to iterate over the links of the item at
      position [item_index] in [model].

      You must free the iterator with g_object_unref() when you are done. *)

  (** {2:conversions Conversions} *)

  method as_menu_model : Raw.Menu_model.t
end

class menu_link_iter (obj : Raw.Menu_link_iter.t) : menu_link_iter_t =
  object (self)
    method get_name : unit -> string = fun () -> Raw.Menu_link_iter.get_name obj

    method get_value : unit -> menu_model_t =
      fun () -> new menu_model (Raw.Menu_link_iter.get_value obj)

    method next : unit -> bool = fun () -> Raw.Menu_link_iter.next obj
    method as_menu_link_iter = obj
  end

and menu_model (obj : Raw.Menu_model.t) : menu_model_t =
  object (self)
    method on_items_changed ?(after = false) ~callback () =
      Raw.Menu_model.on_items_changed ~after self#as_menu_model ~callback

    method get_item_attribute_value :
        int -> string -> Gvariant_type.t option -> Gvariant.t option =
      fun item_index attribute expected_type ->
        Raw.Menu_model.get_item_attribute_value obj item_index attribute
          expected_type

    method get_item_link : int -> string -> menu_model_t option =
      fun item_index link ->
        Option.map
          (fun ret -> new menu_model ret)
          (Raw.Menu_model.get_item_link obj item_index link)

    method get_n_items : unit -> int = fun () -> Raw.Menu_model.get_n_items obj
    method is_mutable : unit -> bool = fun () -> Raw.Menu_model.is_mutable obj

    method items_changed : int -> int -> int -> unit =
      fun position removed added ->
        Raw.Menu_model.items_changed obj position removed added

    method iterate_item_attributes :
        int -> Menu_attribute_iter.menu_attribute_iter_t =
      fun item_index ->
        new Menu_attribute_iter.menu_attribute_iter
          (Raw.Menu_model.iterate_item_attributes obj item_index)

    method iterate_item_links : int -> menu_link_iter_t =
      fun item_index ->
        new menu_link_iter (Raw.Menu_model.iterate_item_links obj item_index)

    method as_menu_model = obj
  end
