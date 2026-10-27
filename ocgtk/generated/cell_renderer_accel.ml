class type cell_renderer_accel_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  method on_accel_cleared :
    ?after:bool ->
    callback:(path_string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user has removed the accelerator. *)

  method on_accel_edited :
    ?after:bool ->
    callback:
      (path_string:string ->
      accel_key:int ->
      accel_mods:Ocgdk.Enums.modifiertype ->
      hardware_keycode:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user has selected a new accelerator. *)

  method accel_key : int
  method set_accel_key : int -> unit
  method accel_mode : Enums.cellrendereraccelmode
  method set_accel_mode : Enums.cellrendereraccelmode -> unit
  method accel_mods : Ocgdk.Enums.modifiertype
  method set_accel_mods : Ocgdk.Enums.modifiertype -> unit
  method keycode : int
  method set_keycode : int -> unit
  method as_cell_renderer_accel : Raw.Cell_renderer_accel.t
end

(* High-level class for CellRendererAccel *)
class cell_renderer_accel (obj : Raw.Cell_renderer_accel.t) :
  cell_renderer_accel_t =
  object (self)
    inherit
      Cell_renderer_text.cell_renderer_text (obj :> Raw.Cell_renderer_text.t)

    method on_accel_cleared ?(after = false) ~callback () =
      Raw.Cell_renderer_accel.on_accel_cleared ~after
        self#as_cell_renderer_accel ~callback

    method on_accel_edited ?(after = false) ~callback () =
      Raw.Cell_renderer_accel.on_accel_edited ~after self#as_cell_renderer_accel
        ~callback

    method accel_key = Raw.Cell_renderer_accel.get_accel_key obj
    method set_accel_key v = Raw.Cell_renderer_accel.set_accel_key obj v
    method accel_mode = Raw.Cell_renderer_accel.get_accel_mode obj
    method set_accel_mode v = Raw.Cell_renderer_accel.set_accel_mode obj v
    method accel_mods = Raw.Cell_renderer_accel.get_accel_mods obj
    method set_accel_mods v = Raw.Cell_renderer_accel.set_accel_mods obj v
    method keycode = Raw.Cell_renderer_accel.get_keycode obj
    method set_keycode v = Raw.Cell_renderer_accel.set_keycode obj v
    method as_cell_renderer_accel = obj
  end

let new_ () : cell_renderer_accel_t =
  new cell_renderer_accel (Raw.Cell_renderer_accel.new_ ())
