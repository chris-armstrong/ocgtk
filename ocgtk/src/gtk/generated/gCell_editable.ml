(* Signal class defined in gcell_editable_signals.ml *)

(* High-level class for CellEditable *)
class cell_editable (obj : Cell_editable.t) = object (self)
  inherit Gcell_editable_signals.cell_editable_signals obj

  method editing_done : unit -> unit =
    fun () ->
      (Cell_editable.editing_done obj)

  method remove_widget : unit -> unit =
    fun () ->
      (Cell_editable.remove_widget obj)

  method start_editing : 'p1. (#Ocgtk_gdk.Gdk.event as 'p1) option -> unit =
    fun event ->
      let event = Option.map (fun (c) -> c#as_event) event in
      (Cell_editable.start_editing obj event)

  method editing_canceled = Cell_editable.get_editing_canceled obj
  method set_editing_canceled v =  Cell_editable.set_editing_canceled obj v

    method as_cell_editable = obj
end

