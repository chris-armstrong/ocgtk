class type cell_editable_t = object
  (** {2:signals Signals} *)

  method on_editing_done :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is a sign for the cell renderer to update its value from the
      [cell_editable].

      Implementations of [GtkCellEditable] are responsible for emitting this
      signal when they are done editing, e.g. [GtkEntry] emits this signal when
      the user presses Enter. Typical things to do in a handler for
      ::editing-done are to capture the edited value, disconnect the
      [cell_editable] from signals on the [GtkCellRenderer], etc.

      gtk_cell_editable_editing_done() is a convenience method for emitting
      [GtkCellEditable::editing-done]. *)

  method on_remove_widget :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is meant to indicate that the cell is finished editing, and
      the [cell_editable] widget is being removed and may subsequently be
      destroyed.

      Implementations of [GtkCellEditable] are responsible for emitting this
      signal when they are done editing. It must be emitted after the
      [GtkCellEditable::editing-done] signal, to give the cell renderer a chance
      to update the cell's value before the widget is removed.

      gtk_cell_editable_remove_widget() is a convenience method for emitting
      [GtkCellEditable::remove-widget]. *)

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method editing_canceled : bool
  (** Indicates whether editing on the cell has been canceled. *)

  method set_editing_canceled : bool -> unit
  (** Indicates whether editing on the cell has been canceled. *)

  (** {2:conversions Conversions} *)

  method as_cell_editable : Raw.Cell_editable.t
end

(* High-level class for CellEditable *)
class cell_editable (obj : Raw.Cell_editable.t) : cell_editable_t =
  object (self)
    method on_editing_done ?(after = false) ~callback () =
      Raw.Cell_editable.on_editing_done ~after self#as_cell_editable ~callback

    method on_remove_widget ?(after = false) ~callback () =
      Raw.Cell_editable.on_remove_widget ~after self#as_cell_editable ~callback

    method editing_done : unit -> unit =
      fun () -> Raw.Cell_editable.editing_done obj

    method remove_widget : unit -> unit =
      fun () -> Raw.Cell_editable.remove_widget obj

    method start_editing : Ocgdk.Event.event_t option -> unit =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Raw.Cell_editable.start_editing obj event

    method editing_canceled = Raw.Cell_editable.get_editing_canceled obj
    method set_editing_canceled v = Raw.Cell_editable.set_editing_canceled obj v
    method as_cell_editable = obj
  end
