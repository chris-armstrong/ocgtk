class type color_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Color_chooser.color_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_color_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_modal : unit -> bool
  method get_title : unit -> string
  method set_modal : bool -> unit
  method set_title : string -> unit
  method show_editor : bool
  method set_show_editor : bool -> unit
  method as_color_button : Raw.Color_button.t
end

(* High-level class for ColorButton *)
class color_button (obj : Raw.Color_button.t) : color_button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Color_chooser.color_chooser (Raw.Color_chooser.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Color_button.on_activate ~after self#as_color_button ~callback

    method on_color_set ?(after = false) ~callback () =
      Raw.Color_button.on_color_set ~after self#as_color_button ~callback

    method get_modal : unit -> bool = fun () -> Raw.Color_button.get_modal obj
    method get_title : unit -> string = fun () -> Raw.Color_button.get_title obj

    method set_modal : bool -> unit =
      fun modal -> Raw.Color_button.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Color_button.set_title obj title

    method show_editor = Raw.Color_button.get_show_editor obj
    method set_show_editor v = Raw.Color_button.set_show_editor obj v
    method as_color_button = obj
  end

let new_ () : color_button_t = new color_button (Raw.Color_button.new_ ())

let new_with_rgba (rgba : Ocgdk.Rgb_a.rgb_a_t) : color_button_t =
  let rgba = rgba#as_rgb_a in
  let obj_ = Raw.Color_button.new_with_rgba rgba in
  new color_button obj_
