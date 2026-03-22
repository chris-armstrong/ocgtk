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

(* High-level class for CellRendererSpinner *)
class cell_renderer_spinner (obj : Cell_renderer_spinner.t) : cell_renderer_spinner_t = object (self)
  inherit GCell_renderer.cell_renderer (Obj.magic obj : Cell_renderer.t)

  method active = Cell_renderer_spinner.get_active obj
  method set_active v =  Cell_renderer_spinner.set_active obj v

  method pulse = Cell_renderer_spinner.get_pulse obj
  method set_pulse v =  Cell_renderer_spinner.set_pulse obj v

  method size = Cell_renderer_spinner.get_size obj
  method set_size v =  Cell_renderer_spinner.set_size obj v

    method as_cell_renderer_spinner = obj
end

let new_ () : cell_renderer_spinner_t =
  new cell_renderer_spinner (Cell_renderer_spinner.new_ ())

