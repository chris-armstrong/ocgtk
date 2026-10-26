class type cell_renderer_spinner_t = object
  inherit Cell_renderer.cell_renderer_t
  method active : bool
  method set_active : bool -> unit
  method pulse : int
  method set_pulse : int -> unit
  method size : Enums.iconsize
  method set_size : Enums.iconsize -> unit
  method as_cell_renderer_spinner : Raw.Cell_renderer_spinner.t
end

(* High-level class for CellRendererSpinner *)
class cell_renderer_spinner (obj : Raw.Cell_renderer_spinner.t) :
  cell_renderer_spinner_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)
    method active = Raw.Cell_renderer_spinner.get_active obj
    method set_active v = Raw.Cell_renderer_spinner.set_active obj v
    method pulse = Raw.Cell_renderer_spinner.get_pulse obj
    method set_pulse v = Raw.Cell_renderer_spinner.set_pulse obj v
    method size = Raw.Cell_renderer_spinner.get_size obj
    method set_size v = Raw.Cell_renderer_spinner.set_size obj v
    method as_cell_renderer_spinner = obj
  end

let new_ () : cell_renderer_spinner_t =
  new cell_renderer_spinner (Raw.Cell_renderer_spinner.new_ ())
