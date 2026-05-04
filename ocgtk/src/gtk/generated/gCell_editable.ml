class type cell_editable_t = object
  method on_editing_done : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_remove_widget : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method editing_done : unit -> unit
  method remove_widget : unit -> unit
  method start_editing : Ocgtk_gdk.Gdk.Event.event_t option -> unit
  method editing_canceled : bool
  method set_editing_canceled : bool -> unit
  method as_cell_editable : Cell_editable.t
end

(* High-level class for CellEditable *)
class cell_editable (obj : Cell_editable.t) : cell_editable_t =
  object (self)
    method on_editing_done ~callback =
      Cell_editable.on_editing_done self#as_cell_editable ~callback

    method on_remove_widget ~callback =
      Cell_editable.on_remove_widget self#as_cell_editable ~callback

    method editing_done : unit -> unit =
      fun () -> Cell_editable.editing_done obj

    method remove_widget : unit -> unit =
      fun () -> Cell_editable.remove_widget obj

    method start_editing : Ocgtk_gdk.Gdk.Event.event_t option -> unit =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Cell_editable.start_editing obj event

    method editing_canceled = Cell_editable.get_editing_canceled obj
    method set_editing_canceled v = Cell_editable.set_editing_canceled obj v
    method as_cell_editable = obj
  end
