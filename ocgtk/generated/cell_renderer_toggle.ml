class type cell_renderer_toggle_t = object
  inherit Cell_renderer.cell_renderer_t

  method on_toggled :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_activatable : unit -> bool
  method get_active : unit -> bool
  method get_radio : unit -> bool
  method set_activatable : bool -> unit
  method set_active : bool -> unit
  method set_radio : bool -> unit
  method inconsistent : bool
  method set_inconsistent : bool -> unit
  method as_cell_renderer_toggle : Raw.Cell_renderer_toggle.t
end

(* High-level class for CellRendererToggle *)
class cell_renderer_toggle (obj : Raw.Cell_renderer_toggle.t) :
  cell_renderer_toggle_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)

    method on_toggled ?(after = false) ~callback () =
      Raw.Cell_renderer_toggle.on_toggled ~after self#as_cell_renderer_toggle
        ~callback

    method get_activatable : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_activatable obj

    method get_active : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_active obj

    method get_radio : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_radio obj

    method set_activatable : bool -> unit =
      fun setting -> Raw.Cell_renderer_toggle.set_activatable obj setting

    method set_active : bool -> unit =
      fun setting -> Raw.Cell_renderer_toggle.set_active obj setting

    method set_radio : bool -> unit =
      fun radio -> Raw.Cell_renderer_toggle.set_radio obj radio

    method inconsistent = Raw.Cell_renderer_toggle.get_inconsistent obj
    method set_inconsistent v = Raw.Cell_renderer_toggle.set_inconsistent obj v
    method as_cell_renderer_toggle = obj
  end

let new_ () : cell_renderer_toggle_t =
  new cell_renderer_toggle (Raw.Cell_renderer_toggle.new_ ())
