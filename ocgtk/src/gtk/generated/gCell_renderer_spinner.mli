class type cell_renderer_spinner_t = object
    inherit GCell_renderer.cell_renderer_t
    method active : bool
    method set_active : bool -> unit
    method pulse : int
    method set_pulse : int -> unit
    method size : Gtk_enums.iconsize
    method set_size : Gtk_enums.iconsize -> unit
    method as_cell_renderer_spinner : Cell_renderer_spinner.t
end

class cell_renderer_spinner : Cell_renderer_spinner.t -> cell_renderer_spinner_t

