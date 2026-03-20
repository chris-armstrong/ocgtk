class type cell_renderer_spinner_t = object
    method active : bool
    method set_active : bool -> unit
    method pulse : int
    method set_pulse : int -> unit
    method size : Gtk_enums.iconsize
    method set_size : Gtk_enums.iconsize -> unit
    method as_cell_renderer_spinner : Cell_renderer_spinner.t
end

(* High-level class for CellRendererSpinner *)
class cell_renderer_spinner (obj : Cell_renderer_spinner.t) : cell_renderer_spinner_t = object (self)

  method active = Cell_renderer_spinner.get_active obj
  method set_active v =  Cell_renderer_spinner.set_active obj v

  method pulse = Cell_renderer_spinner.get_pulse obj
  method set_pulse v =  Cell_renderer_spinner.set_pulse obj v

  method size = Cell_renderer_spinner.get_size obj
  method set_size v =  Cell_renderer_spinner.set_size obj v

    method as_cell_renderer_spinner = obj
end

