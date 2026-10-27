class type stack_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method add_named :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    Stack_page.stack_page_t

  method add_titled :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    string ->
    Stack_page.stack_page_t

  method get_child_by_name :
    string ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hhomogeneous : unit -> bool
  method get_interpolate_size : unit -> bool

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method get_pages : unit -> Selection_model.selection_model_t
  method get_transition_duration : unit -> int
  method get_transition_running : unit -> bool
  method get_transition_type : unit -> Enums.stacktransitiontype
  method get_vhomogeneous : unit -> bool

  method get_visible_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_visible_child_name : unit -> string option

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_hhomogeneous : bool -> unit
  method set_interpolate_size : bool -> unit
  method set_transition_duration : int -> unit
  method set_transition_type : Enums.stacktransitiontype -> unit
  method set_vhomogeneous : bool -> unit

  method set_visible_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
  method set_visible_child_name : string -> unit
  method as_stack : Raw.Stack.t
end

(* High-level class for Stack *)
class stack (obj : Raw.Stack.t) : stack_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method add_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Stack_page.stack_page_t =
      fun child ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_child obj child)

    method add_named :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string option ->
        Stack_page.stack_page_t =
      fun child name ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_named obj child name)

    method add_titled :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string option ->
        string ->
        Stack_page.stack_page_t =
      fun child name title ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_titled obj child name title)

    method get_child_by_name :
        string ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun name ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Stack.get_child_by_name obj name)

    method get_hhomogeneous : unit -> bool =
      fun () -> Raw.Stack.get_hhomogeneous obj

    method get_interpolate_size : unit -> bool =
      fun () -> Raw.Stack.get_interpolate_size obj

    method get_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Stack_page.stack_page_t =
      fun child ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.get_page obj child)

    method get_pages : unit -> Selection_model.selection_model_t =
      fun () -> new Selection_model.selection_model (Raw.Stack.get_pages obj)

    method get_transition_duration : unit -> int =
      fun () -> Raw.Stack.get_transition_duration obj

    method get_transition_running : unit -> bool =
      fun () -> Raw.Stack.get_transition_running obj

    method get_transition_type : unit -> Enums.stacktransitiontype =
      fun () -> Raw.Stack.get_transition_type obj

    method get_vhomogeneous : unit -> bool =
      fun () -> Raw.Stack.get_vhomogeneous obj

    method get_visible_child :
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
          (Raw.Stack.get_visible_child obj)

    method get_visible_child_name : unit -> string option =
      fun () -> Raw.Stack.get_visible_child_name obj

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Stack.remove obj child

    method set_hhomogeneous : bool -> unit =
      fun hhomogeneous -> Raw.Stack.set_hhomogeneous obj hhomogeneous

    method set_interpolate_size : bool -> unit =
      fun interpolate_size ->
        Raw.Stack.set_interpolate_size obj interpolate_size

    method set_transition_duration : int -> unit =
      fun duration -> Raw.Stack.set_transition_duration obj duration

    method set_transition_type : Enums.stacktransitiontype -> unit =
      fun transition -> Raw.Stack.set_transition_type obj transition

    method set_vhomogeneous : bool -> unit =
      fun vhomogeneous -> Raw.Stack.set_vhomogeneous obj vhomogeneous

    method set_visible_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Stack.set_visible_child obj child

    method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
        =
      fun name transition ->
        Raw.Stack.set_visible_child_full obj name transition

    method set_visible_child_name : string -> unit =
      fun name -> Raw.Stack.set_visible_child_name obj name

    method as_stack = obj
  end

let new_ () : stack_t = new stack (Raw.Stack.new_ ())
