class type cell_renderer_progress_t = object
    inherit GCell_renderer.cell_renderer_t
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
    method as_cell_renderer_progress : Cell_renderer_progress.t
end

(* High-level class for CellRendererProgress *)
class cell_renderer_progress (obj : Cell_renderer_progress.t) : cell_renderer_progress_t = object (self)
  inherit GCell_renderer.cell_renderer (Obj.magic obj : Cell_renderer.t)

  method inverted = Cell_renderer_progress.get_inverted obj
  method set_inverted v =  Cell_renderer_progress.set_inverted obj v

  method pulse = Cell_renderer_progress.get_pulse obj
  method set_pulse v =  Cell_renderer_progress.set_pulse obj v

  method text = Cell_renderer_progress.get_text obj
  method set_text v =  Cell_renderer_progress.set_text obj v

  method text_xalign = Cell_renderer_progress.get_text_xalign obj
  method set_text_xalign v =  Cell_renderer_progress.set_text_xalign obj v

  method text_yalign = Cell_renderer_progress.get_text_yalign obj
  method set_text_yalign v =  Cell_renderer_progress.set_text_yalign obj v

  method value = Cell_renderer_progress.get_value obj
  method set_value v =  Cell_renderer_progress.set_value obj v

    method as_cell_renderer_progress = obj
end

