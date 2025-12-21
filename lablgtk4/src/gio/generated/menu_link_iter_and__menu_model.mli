(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Menu_link_iter : sig
  type t = [`menu_link_iter | `object_] Gobject.obj

  (* Methods *)
  (** Attempts to advance the iterator to the next (possibly first)
  link.

  %TRUE is returned on success, or %FALSE if there are no more links.

  You must call this function when you first acquire the iterator to
  advance it to the first link (and determine if the first link exists
  at all). *)
  external next : t -> bool = "ml_g_menu_link_iter_next"

  (** Gets the linked #GMenuModel at the current iterator position.

  The iterator is not advanced. *)
  external get_value : t -> Menu_model.t = "ml_g_menu_link_iter_get_value"

  (** This function combines g_menu_link_iter_next() with
  g_menu_link_iter_get_name() and g_menu_link_iter_get_value().

  First the iterator is advanced to the next (possibly first) link.
  If that fails, then %FALSE is returned and there are no other effects.

  If successful, @out_link and @value are set to the name and #GMenuModel
  of the link that has just been advanced to.  At this point,
  g_menu_link_iter_get_name() and g_menu_link_iter_get_value() will return the
  same values again.

  The value returned in @out_link remains valid for as long as the iterator
  remains at the current position.  The value returned in @value must
  be unreffed using g_object_unref() when it is no longer in use. *)
  external get_next : t -> bool * string * Menu_model.t = "ml_g_menu_link_iter_get_next"

  (** Gets the name of the link at the current iterator position.

  The iterator is not advanced. *)
  external get_name : t -> string = "ml_g_menu_link_iter_get_name"


end

and Menu_model
 : sig
  type t = [`menu_model | `object_] Gobject.obj

  (* Methods *)
  (** Creates a #GMenuLinkIter to iterate over the links of the item at
  position @item_index in @model.

  You must free the iterator with g_object_unref() when you are done. *)
  external iterate_item_links : t -> int -> Menu_link_iter.t = "ml_g_menu_model_iterate_item_links"

  (** Creates a #GMenuAttributeIter to iterate over the attributes of
  the item at position @item_index in @model.

  You must free the iterator with g_object_unref() when you are done. *)
  external iterate_item_attributes : t -> int -> Menu_attribute_iter.t = "ml_g_menu_model_iterate_item_attributes"

  (** Requests emission of the #GMenuModel::items-changed signal on @model.

  This function should never be called except by #GMenuModel
  subclasses.  Any other calls to this function will very likely lead
  to a violation of the interface of the model.

  The implementation should update its internal representation of the
  menu before emitting the signal.  The implementation should further
  expect to receive queries about the new state of the menu (and
  particularly added menu items) while signal handlers are running.

  The implementation must dispatch this call directly from a mainloop
  entry and not in response to calls -- particularly those from the
  #GMenuModel API.  Said another way: the menu must not change while
  user code is running without returning to the mainloop. *)
  external items_changed : t -> int -> int -> int -> unit = "ml_g_menu_model_items_changed"

  (** Queries if @model is mutable.

  An immutable #GMenuModel will never emit the #GMenuModel::items-changed
  signal. Consumers of the model may make optimisations accordingly. *)
  external is_mutable : t -> bool = "ml_g_menu_model_is_mutable"

  (** Query the number of items in @model. *)
  external get_n_items : t -> int = "ml_g_menu_model_get_n_items"

  (** Queries the item at position @item_index in @model for the link
  specified by @link.

  If the link exists, the linked #GMenuModel is returned.  If the link
  does not exist, %NULL is returned. *)
  external get_item_link : t -> int -> string -> t option = "ml_g_menu_model_get_item_link"


end
