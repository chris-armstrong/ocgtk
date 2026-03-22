(* Signal class defined in gcell_renderer_toggle_signals.ml *)

class type cell_renderer_toggle_t = object
    inherit GCell_renderer.cell_renderer_t
    inherit Gcell_renderer_toggle_signals.cell_renderer_toggle_signals
    method get_activatable : unit -> bool
    method get_active : unit -> bool
    method get_radio : unit -> bool
    method set_activatable : bool -> unit
    method set_active : bool -> unit
    method set_radio : bool -> unit
    method inconsistent : bool
    method set_inconsistent : bool -> unit
    method as_cell_renderer_toggle : Cell_renderer_toggle.t
end

(* High-level class for CellRendererToggle *)
class cell_renderer_toggle (obj : Cell_renderer_toggle.t) : cell_renderer_toggle_t = object (self)
  inherit GCell_renderer.cell_renderer (Obj.magic obj : Cell_renderer.t)
  inherit Gcell_renderer_toggle_signals.cell_renderer_toggle_signals obj

  method get_activatable : unit -> bool =
    fun () ->
      (Cell_renderer_toggle.get_activatable obj)

  method get_active : unit -> bool =
    fun () ->
      (Cell_renderer_toggle.get_active obj)

  method get_radio : unit -> bool =
    fun () ->
      (Cell_renderer_toggle.get_radio obj)

  method set_activatable : bool -> unit =
    fun setting ->
      (Cell_renderer_toggle.set_activatable obj setting)

  method set_active : bool -> unit =
    fun setting ->
      (Cell_renderer_toggle.set_active obj setting)

  method set_radio : bool -> unit =
    fun radio ->
      (Cell_renderer_toggle.set_radio obj radio)

  method inconsistent = Cell_renderer_toggle.get_inconsistent obj
  method set_inconsistent v =  Cell_renderer_toggle.set_inconsistent obj v

    method as_cell_renderer_toggle = obj
end

let new_ () : cell_renderer_toggle_t =
  new cell_renderer_toggle (Cell_renderer_toggle.new_ ())

