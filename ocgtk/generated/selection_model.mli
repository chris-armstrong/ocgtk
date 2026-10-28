(** An interface that adds support for selection to list models.

    Its methods, signals and properties are on {!class-type-selection_model_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Selection_model}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SelectionModel].}

    Requires:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}

    An interface that adds support for selection to list models.

    This support is then used by widgets using list models to add the ability to
    select and unselect various items.

    GTK provides default implementations of the most common selection modes such
    as [Gtk.SingleSelection], so you will only need to implement this interface
    if you want detailed control about how selections should be handled.

    A [GtkSelectionModel] supports a single boolean per item indicating if an
    item is selected or not. This can be queried via
    [Gtk.SelectionModel.is_selected]. When the selected state of one or more
    items changes, the model will emit the
    [Gtk.SelectionModel::selection-changed] signal by calling the
    [Gtk.SelectionModel.selection_changed] function. The positions given in that
    signal may have their selection state changed, though that is not a
    requirement. If new items added to the model via the
    [Gio.ListModel::items-changed] signal are selected or not is up to the
    implementation.

    Note that items added via [Gio.ListModel::items-changed] may already be
    selected and no [Gtk.SelectionModel::selection-changed] will be emitted for
    them. So to track which items are selected, it is necessary to listen to
    both signals.

    Additionally, the interface can expose functionality to select and unselect
    items. If these functions are implemented, GTK's list widgets will allow
    users to select and unselect items. However, [GtkSelectionModel]s are free
    to only implement them partially or not at all. In that case the widgets
    will not support the unimplemented operations.

    When selecting or unselecting is supported by a model, the return values of
    the selection functions do {i not} indicate if selection or unselection
    happened. They are only meant to indicate complete failure, like when this
    mode of selecting is not supported by the model.

    Selections may happen asynchronously, so the only reliable way to find out
    when an item was selected is to listen to the signals that indicate
    selection. *)
class type selection_model_t = object
  (** {2:signals Signals} *)

  method on_selection_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the selection state of some of the items in [model] changes.

      Note that this signal does not specify the new selection state of the
      items, they need to be queried manually. It is also not necessary for a
      model to change the selection state of any of the items in the selection
      model, though it would be rather useless to emit such a signal. *)

  (** {2:methods Methods} *)

  method get_selection : unit -> Raw.Bitset.t
  (** Gets the set containing all currently selected items in the model.

      This function may be slow, so if you are only interested in single item,
      consider using [Gtk.SelectionModel.is_selected] or if you are only
      interested in a few, consider [Gtk.SelectionModel.get_selection_in_range].
  *)

  method get_selection_in_range : int -> int -> Raw.Bitset.t
  (** Gets the set of selected items in a range.

      This function is an optimization for [Gtk.SelectionModel.get_selection]
      when you are only interested in part of the model's selected state. A
      common use case is in response to the
      [Gtk.SelectionModel::selection-changed] signal. *)

  method is_selected : int -> bool
  (** Checks if the given item is selected. *)

  method select_all : unit -> bool
  (** Requests to select all items in the model. *)

  method select_item : int -> bool -> bool
  (** Requests to select an item in the model. *)

  method select_range : int -> int -> bool -> bool
  (** Requests to select a range of items in the model. *)

  method selection_changed : int -> int -> unit
  (** Helper function for implementations of [GtkSelectionModel].

      Call this when the selection changes to emit the
      [Gtk.SelectionModel::selection-changed] signal. *)

  method set_selection : Raw.Bitset.t -> Raw.Bitset.t -> bool
  (** Make selection changes.

      This is the most advanced selection updating method that allows the most
      fine-grained control over selection changes. If you can, you should try
      the simpler versions, as implementations are more likely to implement
      support for those.

      Requests that the selection state of all positions set in [mask] be
      updated to the respective value in the [selected] bitmask.

      In pseudocode, it would look something like this:

      {[
      for (i = 0; i < n_items; i++)
        {
          // don't change values not in the mask
          if (!gtk_bitset_contains (mask, i))
            continue;

          if (gtk_bitset_contains (selected, i))
            select_item (i);
          else
            unselect_item (i);
        }

      gtk_selection_model_selection_changed (model,
                                             first_changed_item,
                                             n_changed_items);
      ]}

      [mask] and [selected] must not be modified. They may refer to the same
      bitset, which would mean that every item in the set should be selected. *)

  method unselect_all : unit -> bool
  (** Requests to unselect all items in the model. *)

  method unselect_item : int -> bool
  (** Requests to unselect an item in the model. *)

  method unselect_range : int -> int -> bool
  (** Requests to unselect a range of items in the model. *)

  (** {2:conversions Conversions} *)

  method as_selection_model : Raw.Selection_model.t
end

class selection_model : Raw.Selection_model.t -> selection_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Selection_model.t}. *)

(** {1:description Description}

    An interface that adds support for selection to list models.

    This support is then used by widgets using list models to add the ability to
    select and unselect various items.

    GTK provides default implementations of the most common selection modes such
    as [Gtk.SingleSelection], so you will only need to implement this interface
    if you want detailed control about how selections should be handled.

    A [GtkSelectionModel] supports a single boolean per item indicating if an
    item is selected or not. This can be queried via
    [Gtk.SelectionModel.is_selected]. When the selected state of one or more
    items changes, the model will emit the
    [Gtk.SelectionModel::selection-changed] signal by calling the
    [Gtk.SelectionModel.selection_changed] function. The positions given in that
    signal may have their selection state changed, though that is not a
    requirement. If new items added to the model via the
    [Gio.ListModel::items-changed] signal are selected or not is up to the
    implementation.

    Note that items added via [Gio.ListModel::items-changed] may already be
    selected and no [Gtk.SelectionModel::selection-changed] will be emitted for
    them. So to track which items are selected, it is necessary to listen to
    both signals.

    Additionally, the interface can expose functionality to select and unselect
    items. If these functions are implemented, GTK's list widgets will allow
    users to select and unselect items. However, [GtkSelectionModel]s are free
    to only implement them partially or not at all. In that case the widgets
    will not support the unimplemented operations.

    When selecting or unselecting is supported by a model, the return values of
    the selection functions do {i not} indicate if selection or unselection
    happened. They are only meant to indicate complete failure, like when this
    mode of selecting is not supported by the model.

    Selections may happen asynchronously, so the only reliable way to find out
    when an item was selected is to listen to the signals that indicate
    selection. *)
