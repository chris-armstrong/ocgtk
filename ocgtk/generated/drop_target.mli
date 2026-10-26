class type drop_target_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drop :
    ?after:bool ->
    callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method get_actions : unit -> Ocgdk.Enums.dragaction
  method get_current_drop : unit -> Ocgdk.Drop.drop_t option
  method get_drop : unit -> Ocgdk.Drop.drop_t option
  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  method get_preload : unit -> bool
  method get_value : unit -> Gobject.Value.t option
  method reject : unit -> unit
  method set_actions : Ocgdk.Enums.dragaction -> unit
  method set_gtypes : Gobject.Type.t array option -> Gsize.t -> unit
  method set_preload : bool -> unit
  method as_drop_target : Raw.Drop_target.t
end

class drop_target : Raw.Drop_target.t -> drop_target_t

val new_ : Gobject.Type.t -> Ocgdk.Enums.dragaction -> drop_target_t
