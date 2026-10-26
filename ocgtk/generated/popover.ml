class type popover_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t
  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_autohide : unit -> bool
  method get_cascade_popdown : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_arrow : unit -> bool
  method get_mnemonics_visible : unit -> bool
  method get_position : unit -> Enums.positiontype
  method popdown : unit -> unit
  method popup : unit -> unit
  method present : unit -> unit
  method set_autohide : bool -> unit
  method set_cascade_popdown : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_arrow : bool -> unit
  method set_mnemonics_visible : bool -> unit
  method set_offset : int -> int -> unit
  method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit
  method set_position : Enums.positiontype -> unit
  method as_popover : Raw.Popover.t
end

(* High-level class for Popover *)
class popover (obj : Raw.Popover.t) : popover_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Native.native (Raw.Native.from_gobject obj)

    inherit
      Shortcut_manager.shortcut_manager (Raw.Shortcut_manager.from_gobject obj)

    method on_activate_default ?(after = false) ~callback () =
      Raw.Popover.on_activate_default ~after self#as_popover ~callback

    method on_closed ?(after = false) ~callback () =
      Raw.Popover.on_closed ~after self#as_popover ~callback

    method get_autohide : unit -> bool = fun () -> Raw.Popover.get_autohide obj

    method get_cascade_popdown : unit -> bool =
      fun () -> Raw.Popover.get_cascade_popdown obj

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
          (Raw.Popover.get_child obj)

    method get_has_arrow : unit -> bool =
      fun () -> Raw.Popover.get_has_arrow obj

    method get_mnemonics_visible : unit -> bool =
      fun () -> Raw.Popover.get_mnemonics_visible obj

    method get_position : unit -> Enums.positiontype =
      fun () -> Raw.Popover.get_position obj

    method popdown : unit -> unit = fun () -> Raw.Popover.popdown obj
    method popup : unit -> unit = fun () -> Raw.Popover.popup obj
    method present : unit -> unit = fun () -> Raw.Popover.present obj

    method set_autohide : bool -> unit =
      fun autohide -> Raw.Popover.set_autohide obj autohide

    method set_cascade_popdown : bool -> unit =
      fun cascade_popdown -> Raw.Popover.set_cascade_popdown obj cascade_popdown

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Popover.set_child obj child

    method set_default_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Popover.set_default_widget obj widget

    method set_has_arrow : bool -> unit =
      fun has_arrow -> Raw.Popover.set_has_arrow obj has_arrow

    method set_mnemonics_visible : bool -> unit =
      fun mnemonics_visible ->
        Raw.Popover.set_mnemonics_visible obj mnemonics_visible

    method set_offset : int -> int -> unit =
      fun x_offset y_offset -> Raw.Popover.set_offset obj x_offset y_offset

    method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit =
      fun rect ->
        let rect = Option.map (fun c -> c#as_rectangle) rect in
        Raw.Popover.set_pointing_to obj rect

    method set_position : Enums.positiontype -> unit =
      fun position -> Raw.Popover.set_position obj position

    method as_popover = obj
  end

let new_ () : popover_t = new popover (Raw.Popover.new_ ())
