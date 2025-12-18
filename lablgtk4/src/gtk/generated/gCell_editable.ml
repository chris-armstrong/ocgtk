(* Signal class defined in gcell_editable_signals.ml *)

(* High-level class for CellEditable *)
class cell_editable (obj : Cell_editable.t) = object (self)
  inherit Gcell_editable_signals.cell_editable_signals obj

  method editing_canceled = Cell_editable.get_editing_canceled obj
  method set_editing_canceled v = Cell_editable.set_editing_canceled obj v

  method editing_done : unit -> unit = fun () -> (Cell_editable.editing_done obj )

  method remove_widget : unit -> unit = fun () -> (Cell_editable.remove_widget obj )

  method start_editing : 'a. 'a Gdk.event option -> unit = fun event -> (Cell_editable.start_editing obj event)

    method as_cell_editable = obj
end

