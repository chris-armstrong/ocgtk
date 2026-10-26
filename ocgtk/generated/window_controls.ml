class type window_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_decoration_layout : unit -> string option
  method get_empty : unit -> bool
  method get_side : unit -> Enums.packtype
  method get_use_native_controls : unit -> bool
  method set_decoration_layout : string option -> unit
  method set_side : Enums.packtype -> unit
  method set_use_native_controls : bool -> unit
  method as_window_controls : Raw.Window_controls.t
end

(* High-level class for WindowControls *)
class window_controls (obj : Raw.Window_controls.t) : window_controls_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_decoration_layout : unit -> string option =
      fun () -> Raw.Window_controls.get_decoration_layout obj

    method get_empty : unit -> bool =
      fun () -> Raw.Window_controls.get_empty obj

    method get_side : unit -> Enums.packtype =
      fun () -> Raw.Window_controls.get_side obj

    method get_use_native_controls : unit -> bool =
      fun () -> Raw.Window_controls.get_use_native_controls obj

    method set_decoration_layout : string option -> unit =
      fun layout -> Raw.Window_controls.set_decoration_layout obj layout

    method set_side : Enums.packtype -> unit =
      fun side -> Raw.Window_controls.set_side obj side

    method set_use_native_controls : bool -> unit =
      fun setting -> Raw.Window_controls.set_use_native_controls obj setting

    method as_window_controls = obj
  end

let new_ (side : Enums.packtype) : window_controls_t =
  let obj_ = Raw.Window_controls.new_ side in
  new window_controls obj_
