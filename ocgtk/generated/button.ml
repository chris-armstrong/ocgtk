class type button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_use_underline : unit -> bool
  method set_can_shrink : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_use_underline : bool -> unit
  method as_button : Raw.Button.t
end

(* High-level class for Button *)
class button (obj : Raw.Button.t) : button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Button.on_activate ~after self#as_button ~callback

    method on_clicked ?(after = false) ~callback () =
      Raw.Button.on_clicked ~after self#as_button ~callback

    method get_can_shrink : unit -> bool =
      fun () -> Raw.Button.get_can_shrink obj

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Button.get_child obj)

    method get_has_frame : unit -> bool = fun () -> Raw.Button.get_has_frame obj

    method get_icon_name : unit -> string option =
      fun () -> Raw.Button.get_icon_name obj

    method get_label : unit -> string option =
      fun () -> Raw.Button.get_label obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Button.get_use_underline obj

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Raw.Button.set_can_shrink obj can_shrink

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Button.set_child obj child

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Button.set_has_frame obj has_frame

    method set_icon_name : string -> unit =
      fun icon_name -> Raw.Button.set_icon_name obj icon_name

    method set_label : string -> unit =
      fun label -> Raw.Button.set_label obj label

    method set_use_underline : bool -> unit =
      fun use_underline -> Raw.Button.set_use_underline obj use_underline

    method as_button = obj
  end

let new_ () : button_t = new button (Raw.Button.new_ ())

let new_from_icon_name (icon_name : string) : button_t =
  let obj_ = Raw.Button.new_from_icon_name icon_name in
  new button obj_

let new_with_label (label : string) : button_t =
  let obj_ = Raw.Button.new_with_label label in
  new button obj_

let new_with_mnemonic (label : string) : button_t =
  let obj_ = Raw.Button.new_with_mnemonic label in
  new button obj_
