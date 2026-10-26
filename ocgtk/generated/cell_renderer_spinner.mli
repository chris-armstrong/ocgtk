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

class cell_renderer_spinner :
  Raw.Cell_renderer_spinner.t ->
  cell_renderer_spinner_t

val new_ : unit -> cell_renderer_spinner_t
