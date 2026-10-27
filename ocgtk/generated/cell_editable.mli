(** Interface for widgets that can be used for editing cells

    The [GtkCellEditable] interface must be implemented for widgets to be usable
    to edit the contents of a [GtkTreeView] cell. It provides a way to specify
    how temporary widgets should be configured for editing, get the new value,
    etc.

    Its methods, signals and properties are on {!class-type-cell_editable_t}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_editable}. *)

(** The methods, signals and properties of a [GtkCellEditable]. *)
class type cell_editable_t = object
  method on_editing_done :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_remove_widget :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method editing_done : unit -> unit
  (** Emits the [GtkCellEditable::editing-done] signal. *)

  method remove_widget : unit -> unit
  (** Emits the [GtkCellEditable::remove-widget] signal. *)

  method start_editing : Ocgdk.Event.event_t option -> unit
  (** Begins editing on a [cell_editable].

      The [GtkCellRenderer] for the cell creates and returns a [GtkCellEditable]
      from gtk_cell_renderer_start_editing(), configured for the
      [GtkCellRenderer] type.

      gtk_cell_editable_start_editing() can then set up [cell_editable] suitably
      for editing a cell, e.g. making the Esc key emit
      [GtkCellEditable::editing-done].

      Note that the [cell_editable] is created on-demand for the current edit;
      its lifetime is temporary and does not persist across other edits and/or
      cells. *)

  method editing_canceled : bool
  method set_editing_canceled : bool -> unit
  method as_cell_editable : Raw.Cell_editable.t
end

class cell_editable : Raw.Cell_editable.t -> cell_editable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_editable.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellEditable], give one already wrapped. *)
