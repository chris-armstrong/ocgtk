(** An interface that adds support for selection to list models.

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
    selection.

    Its methods, signals and properties are on {!class-type-selection_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Selection_model}. *)

(** The methods, signals and properties of a [GtkSelectionModel]. *)
class type selection_model_t = object
  method on_selection_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_selection : unit -> Raw.Bitset.t
  method get_selection_in_range : int -> int -> Raw.Bitset.t
  method is_selected : int -> bool
  method select_all : unit -> bool
  method select_item : int -> bool -> bool
  method select_range : int -> int -> bool -> bool
  method selection_changed : int -> int -> unit
  method set_selection : Raw.Bitset.t -> Raw.Bitset.t -> bool
  method unselect_all : unit -> bool
  method unselect_item : int -> bool
  method unselect_range : int -> int -> bool
  method as_selection_model : Raw.Selection_model.t
end

class selection_model : Raw.Selection_model.t -> selection_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Selection_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkSelectionModel], give one already wrapped. *)
