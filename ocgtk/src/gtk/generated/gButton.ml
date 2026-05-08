class type button_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GActionable.actionable_t
  method on_activate : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_clicked : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_use_underline : unit -> bool
  method set_can_shrink : bool -> unit

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_use_underline : bool -> unit
  method as_button : Button.t
end

(* High-level class for Button *)
class button (obj : Button.t) : button_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    inherit GActionable.actionable (Actionable.from_gobject obj)
    method on_activate ~callback = Button.on_activate self#as_button ~callback
    method on_clicked ~callback = Button.on_clicked self#as_button ~callback
    method get_can_shrink : unit -> bool = fun () -> Button.get_can_shrink obj

    method get_child :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Button.get_child obj)

    method get_has_frame : unit -> bool = fun () -> Button.get_has_frame obj

    method get_icon_name : unit -> string option =
      fun () -> Button.get_icon_name obj

    method get_label : unit -> string option = fun () -> Button.get_label obj

    method get_use_underline : unit -> bool =
      fun () -> Button.get_use_underline obj

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Button.set_can_shrink obj can_shrink

    method set_child :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Button.set_child obj child

    method set_has_frame : bool -> unit =
      fun has_frame -> Button.set_has_frame obj has_frame

    method set_icon_name : string -> unit =
      fun icon_name -> Button.set_icon_name obj icon_name

    method set_label : string -> unit = fun label -> Button.set_label obj label

    method set_use_underline : bool -> unit =
      fun use_underline -> Button.set_use_underline obj use_underline

    method as_button = obj
  end

let new_ () : button_t = new button (Button.new_ ())

let new_from_icon_name (icon_name : string) : button_t =
  let obj_ = Button.new_from_icon_name icon_name in
  new button obj_

let new_with_label (label : string) : button_t =
  let obj_ = Button.new_with_label label in
  new button obj_

let new_with_mnemonic (label : string) : button_t =
  let obj_ = Button.new_with_mnemonic label in
  new button obj_
