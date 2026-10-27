class type expander_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_expanded : unit -> bool
  method get_label : unit -> string option

  method get_label_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_resize_toplevel : unit -> bool
  method get_use_markup : unit -> bool
  method get_use_underline : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_expanded : bool -> unit
  method set_label : string option -> unit

  method set_label_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_resize_toplevel : bool -> unit
  method set_use_markup : bool -> unit
  method set_use_underline : bool -> unit
  method as_expander : Raw.Expander.t
end

(* High-level class for Expander *)
class expander (obj : Raw.Expander.t) : expander_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Expander.on_activate ~after self#as_expander ~callback

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
          (Raw.Expander.get_child obj)

    method get_expanded : unit -> bool = fun () -> Raw.Expander.get_expanded obj

    method get_label : unit -> string option =
      fun () -> Raw.Expander.get_label obj

    method get_label_widget :
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
          (Raw.Expander.get_label_widget obj)

    method get_resize_toplevel : unit -> bool =
      fun () -> Raw.Expander.get_resize_toplevel obj

    method get_use_markup : unit -> bool =
      fun () -> Raw.Expander.get_use_markup obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Expander.get_use_underline obj

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Expander.set_child obj child

    method set_expanded : bool -> unit =
      fun expanded -> Raw.Expander.set_expanded obj expanded

    method set_label : string option -> unit =
      fun label -> Raw.Expander.set_label obj label

    method set_label_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun label_widget ->
        let label_widget = Option.map (fun c -> c#as_widget) label_widget in
        Raw.Expander.set_label_widget obj label_widget

    method set_resize_toplevel : bool -> unit =
      fun resize_toplevel ->
        Raw.Expander.set_resize_toplevel obj resize_toplevel

    method set_use_markup : bool -> unit =
      fun use_markup -> Raw.Expander.set_use_markup obj use_markup

    method set_use_underline : bool -> unit =
      fun use_underline -> Raw.Expander.set_use_underline obj use_underline

    method as_expander = obj
  end

let new_ (label : string option) : expander_t =
  let obj_ = Raw.Expander.new_ label in
  new expander obj_

let new_with_mnemonic (label : string option) : expander_t =
  let obj_ = Raw.Expander.new_with_mnemonic label in
  new expander obj_
