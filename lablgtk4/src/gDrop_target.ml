(* Signal class defined in gdrop_target_signals.ml *)

(* High-level class for DropTarget *)
class drop_target (obj : Drop_target.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Drop_target.as_event_controller obj)
  inherit Gdrop_target_signals.drop_target_signals obj

  method get_actions : unit -> Gdk.dragaction = fun () -> (Drop_target.get_actions obj )

  method get_preload : unit -> bool = fun () -> (Drop_target.get_preload obj )

  method reject : unit -> unit = fun () -> (Drop_target.reject obj )

  method set_actions : Gdk.dragaction -> unit = fun actions -> (Drop_target.set_actions obj actions)

  method set_preload : bool -> unit = fun preload -> (Drop_target.set_preload obj preload)

  method as_event_controller = (Drop_target.as_event_controller obj)
    method as_drop_target = obj
end

