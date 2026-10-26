class type cell_renderer_progress_t = object
  inherit Cell_renderer.cell_renderer_t
  inherit Orientable.orientable_t
  method inverted : bool
  method set_inverted : bool -> unit
  method pulse : int
  method set_pulse : int -> unit
  method text : string
  method set_text : string -> unit
  method text_xalign : float
  method set_text_xalign : float -> unit
  method text_yalign : float
  method set_text_yalign : float -> unit
  method value : int
  method set_value : int -> unit
  method as_cell_renderer_progress : Raw.Cell_renderer_progress.t
end

(* High-level class for CellRendererProgress *)
class cell_renderer_progress (obj : Raw.Cell_renderer_progress.t) :
  cell_renderer_progress_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)
    method inverted = Raw.Cell_renderer_progress.get_inverted obj
    method set_inverted v = Raw.Cell_renderer_progress.set_inverted obj v
    method pulse = Raw.Cell_renderer_progress.get_pulse obj
    method set_pulse v = Raw.Cell_renderer_progress.set_pulse obj v
    method text = Raw.Cell_renderer_progress.get_text obj
    method set_text v = Raw.Cell_renderer_progress.set_text obj v
    method text_xalign = Raw.Cell_renderer_progress.get_text_xalign obj
    method set_text_xalign v = Raw.Cell_renderer_progress.set_text_xalign obj v
    method text_yalign = Raw.Cell_renderer_progress.get_text_yalign obj
    method set_text_yalign v = Raw.Cell_renderer_progress.set_text_yalign obj v
    method value = Raw.Cell_renderer_progress.get_value obj
    method set_value v = Raw.Cell_renderer_progress.set_value obj v
    method as_cell_renderer_progress = obj
  end

let new_ () : cell_renderer_progress_t =
  new cell_renderer_progress (Raw.Cell_renderer_progress.new_ ())
