class type action_bar_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_center_widget :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_revealed : unit -> bool

  method pack_end :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method pack_start :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method set_center_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_revealed : bool -> unit
  method as_action_bar : Action_bar.t
end

(* High-level class for ActionBar *)
class action_bar (obj : Action_bar.t) : action_bar_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method get_center_widget :
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
          (Action_bar.get_center_widget obj)

    method get_revealed : unit -> bool = fun () -> Action_bar.get_revealed obj

    method pack_end :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Action_bar.pack_end obj child

    method pack_start :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Action_bar.pack_start obj child

    method remove :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Action_bar.remove obj child

    method set_center_widget :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun center_widget ->
        let center_widget = Option.map (fun c -> c#as_widget) center_widget in
        Action_bar.set_center_widget obj center_widget

    method set_revealed : bool -> unit =
      fun revealed -> Action_bar.set_revealed obj revealed

    method as_action_bar = obj
  end

let new_ () : action_bar_t = new action_bar (Action_bar.new_ ())
