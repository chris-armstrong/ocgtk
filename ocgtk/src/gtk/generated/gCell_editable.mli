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

class cell_editable : Cell_editable.t -> cell_editable_t
