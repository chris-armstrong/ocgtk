(* GENERATED CODE - DO NOT EDIT *)
(* SelectionModel: SelectionModel *)

(** An interface that adds support for selection to list models.

    This support is then used by widgets using list models to add the ability to
    select and unselect various items.

    GTK provides default implementations of the most common selection modes such
    as {{!Ocgtk.Raw.Single_selection}[Gtk.SingleSelection]}, so you will only
    need to implement this interface if you want detailed control about how
    selections should be handled.

    A [GtkSelectionModel] supports a single boolean per item indicating if an
    item is selected or not. This can be queried via
    {{!Ocgtk.Raw.Selection_model.val-is_selected}[Gtk.SelectionModel.is_selected]}.
    When the selected state of one or more items changes, the model will emit
    the
    {{!Ocgtk.Raw.Selection_model.val-on_selection_changed}[Gtk.SelectionModel::selection-changed]}
    signal by calling the
    {{!Ocgtk.Raw.Selection_model.val-selection_changed}[Gtk.SelectionModel.selection_changed]}
    function. The positions given in that signal may have their selection state
    changed, though that is not a requirement. If new items added to the model
    via the [Gio.ListModel::items-changed] signal are selected or not is up to
    the implementation.

    Note that items added via [Gio.ListModel::items-changed] may already be
    selected and no
    {{!Ocgtk.Raw.Selection_model.val-on_selection_changed}[Gtk.SelectionModel::selection-changed]}
    will be emitted for them. So to track which items are selected, it is
    necessary to listen to both signals.

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
    selection.

    The class built on this module is in {!Ocgtk.Selection_model}. *)

type t = [ `selection_model ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_selection_model_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_selection_model_from_gobject"

(* Methods *)

external unselect_range : t -> int -> int -> bool
  = "ml_gtk_selection_model_unselect_range"
(** Requests to unselect a range of items in the model. *)

external unselect_item : t -> int -> bool
  = "ml_gtk_selection_model_unselect_item"
(** Requests to unselect an item in the model. *)

external unselect_all : t -> bool = "ml_gtk_selection_model_unselect_all"
(** Requests to unselect all items in the model. *)

external set_selection : t -> Bitset.t -> Bitset.t -> bool
  = "ml_gtk_selection_model_set_selection"
(** Make selection changes.

    This is the most advanced selection updating method that allows the most
    fine-grained control over selection changes. If you can, you should try the
    simpler versions, as implementations are more likely to implement support
    for those.

    Requests that the selection state of all positions set in [mask] be updated
    to the respective value in the [selected] bitmask.

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

external selection_changed : t -> int -> int -> unit
  = "ml_gtk_selection_model_selection_changed"
(** Helper function for implementations of [GtkSelectionModel].

    Call this when the selection changes to emit the
    {{!Ocgtk.Raw.Selection_model.val-on_selection_changed}[Gtk.SelectionModel::selection-changed]}
    signal. *)

external select_range : t -> int -> int -> bool -> bool
  = "ml_gtk_selection_model_select_range"
(** Requests to select a range of items in the model. *)

external select_item : t -> int -> bool -> bool
  = "ml_gtk_selection_model_select_item"
(** Requests to select an item in the model. *)

external select_all : t -> bool = "ml_gtk_selection_model_select_all"
(** Requests to select all items in the model. *)

external is_selected : t -> int -> bool = "ml_gtk_selection_model_is_selected"
(** Checks if the given item is selected. *)

external get_selection_in_range : t -> int -> int -> Bitset.t
  = "ml_gtk_selection_model_get_selection_in_range"
(** Gets the set of selected items in a range.

    This function is an optimization for
    {{!Ocgtk.Raw.Selection_model.val-get_selection}[Gtk.SelectionModel.get_selection]}
    when you are only interested in part of the model's selected state. A common
    use case is in response to the
    {{!Ocgtk.Raw.Selection_model.val-on_selection_changed}[Gtk.SelectionModel::selection-changed]}
    signal. *)

external get_selection : t -> Bitset.t = "ml_gtk_selection_model_get_selection"
(** Gets the set containing all currently selected items in the model.

    This function may be slow, so if you are only interested in single item,
    consider using
    {{!Ocgtk.Raw.Selection_model.val-is_selected}[Gtk.SelectionModel.is_selected]}
    or if you are only interested in a few, consider
    {{!Ocgtk.Raw.Selection_model.val-get_selection_in_range}[Gtk.SelectionModel.get_selection_in_range]}.
*)

val on_selection_changed :
  ?after:bool ->
  t ->
  callback:(position:int -> n_items:int -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the selection state of some of the items in [model] changes.

    Note that this signal does not specify the new selection state of the items,
    they need to be queried manually. It is also not necessary for a model to
    change the selection state of any of the items in the selection model,
    though it would be rather useless to emit such a signal. *)
