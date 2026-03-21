class type cell_editable_t = object
    inherit Gcell_editable_signals.cell_editable_signals
    method editing_done : unit -> unit
    method remove_widget : unit -> unit
    method start_editing : Ocgtk_gdk.Gdk.event_t option -> unit
    method editing_canceled : bool
    method set_editing_canceled : bool -> unit
    method as_cell_editable : Cell_editable.t
end

class cell_editable : Cell_editable.t -> cell_editable_t

