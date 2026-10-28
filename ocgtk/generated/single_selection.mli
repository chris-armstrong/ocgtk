(** A selection model that allows selecting a single item.

    Note that the selection is {i persistent} -- if the selected item is removed
    and re-added in the same [Gio.ListModel::items-changed] emission, it stays
    selected. In particular, this means that changing the sort order of an
    underlying sort model will preserve the selection.

    Its methods, signals and properties are on {!class-type-single_selection_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Single_selection}. *)

(** The methods, signals and properties of a [SingleSelection]. *)
class type single_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  method get_autoselect : unit -> bool
  (** Checks if autoselect has been enabled or disabled via
      gtk_single_selection_set_autoselect(). *)

  method get_can_unselect : unit -> bool
  (** If [TRUE], gtk_selection_model_unselect_item() is supported and allows
      unselecting the selected item. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that [self] is wrapping. *)

  method get_selected : unit -> int
  (** Gets the position of the selected item.

      If no item is selected, [GTK_INVALID_LIST_POSITION] is returned. *)

  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the selected item.

      If no item is selected, [NULL] is returned. *)

  method set_autoselect : bool -> unit
  (** Enables or disables autoselect.

      If [autoselect] is [TRUE], [self] will enforce that an item is always
      selected. It will select a new item when the currently selected item is
      deleted and it will disallow unselecting the current item. *)

  method set_can_unselect : bool -> unit
  (** If [TRUE], unselecting the current item via
      gtk_selection_model_unselect_item() is supported.

      Note that setting [Gtk.SingleSelection:autoselect] will cause unselecting
      to not work, so it practically makes no sense to set both at the same
      time. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [NULL], [self] will be empty. *)

  method set_selected : int -> unit
  (** Selects the item at the given position.

      If the list does not have an item at [position] or
      [GTK_INVALID_LIST_POSITION] is given, the behavior depends on the value of
      the [Gtk.SingleSelection:autoselect] property: If it is set, no change
      will occur and the old item will stay selected. If it is unset, the
      selection will be unset and no item will be selected. This also applies if
      [Gtk.SingleSelection:can-unselect] is set to [FALSE]. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_single_selection : Raw.Single_selection.t
end

class single_selection : Raw.Single_selection.t -> single_selection_t
(** Wraps a raw handle of {!Ocgtk.Raw.Single_selection.t}. *)

(** {2:constructors Constructors} *)

val new_ : Ocgio.List_model.list_model_t option -> single_selection_t
(** Creates a new selection to handle [model]. *)
