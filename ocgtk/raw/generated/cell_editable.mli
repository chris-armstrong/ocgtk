(* GENERATED CODE - DO NOT EDIT *)
(* CellEditable: CellEditable *)

(** Interface for widgets that can be used for editing cells

    The [GtkCellEditable] interface must be implemented for widgets to be usable
    to edit the contents of a [GtkTreeView] cell. It provides a way to specify
    how temporary widgets should be configured for editing, get the new value,
    etc.

    The class built on this module is in {!Ocgtk.Cell_editable}. *)

type t = [ `cell_editable ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_editable_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_cell_editable_from_gobject"

(* Methods *)

external start_editing : t -> Ocgdk_raw.Event.t option -> unit
  = "ml_gtk_cell_editable_start_editing"
(** Begins editing on a [cell_editable].

    The [GtkCellRenderer] for the cell creates and returns a [GtkCellEditable]
    from
    {{!Ocgtk.Raw.Cell_renderer.val-start_editing}[gtk_cell_renderer_start_editing
                                                  ()]}, configured for the
    [GtkCellRenderer] type.

    {{!Ocgtk.Raw.Cell_editable.val-start_editing}[gtk_cell_editable_start_editing
                                                  ()]} can then set up
    [cell_editable] suitably for editing a cell, e.g. making the Esc key emit
    [GtkCellEditable::editing-done].

    Note that the [cell_editable] is created on-demand for the current edit; its
    lifetime is temporary and does not persist across other edits and/or cells.
*)

external remove_widget : t -> unit = "ml_gtk_cell_editable_remove_widget"
(** Emits the [GtkCellEditable::remove-widget] signal. *)

external editing_done : t -> unit = "ml_gtk_cell_editable_editing_done"
(** Emits the [GtkCellEditable::editing-done] signal. *)

(* Properties *)

external get_editing_canceled : t -> bool
  = "ml_gtk_cell_editable_get_editing_canceled"
(** Indicates whether editing on the cell has been canceled. *)

external set_editing_canceled : t -> bool -> unit
  = "ml_gtk_cell_editable_set_editing_canceled"
(** Indicates whether editing on the cell has been canceled. *)

val on_editing_done :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** This signal is a sign for the cell renderer to update its value from the
    [cell_editable].

    Implementations of [GtkCellEditable] are responsible for emitting this
    signal when they are done editing, e.g. [GtkEntry] emits this signal when
    the user presses Enter. Typical things to do in a handler for ::editing-done
    are to capture the edited value, disconnect the [cell_editable] from signals
    on the [GtkCellRenderer], etc.

    {{!Ocgtk.Raw.Cell_editable.val-editing_done}[gtk_cell_editable_editing_done
                                                 ()]} is a convenience method
    for emitting [GtkCellEditable::editing-done]. *)

val on_remove_widget :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** This signal is meant to indicate that the cell is finished editing, and the
    [cell_editable] widget is being removed and may subsequently be destroyed.

    Implementations of [GtkCellEditable] are responsible for emitting this
    signal when they are done editing. It must be emitted after the
    [GtkCellEditable::editing-done] signal, to give the cell renderer a chance
    to update the cell's value before the widget is removed.

    {{!Ocgtk.Raw.Cell_editable.val-remove_widget}[gtk_cell_editable_remove_widget
                                                  ()]} is a convenience method
    for emitting [GtkCellEditable::remove-widget]. *)
