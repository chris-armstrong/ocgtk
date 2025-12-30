(* High-level class for Shortcut *)
class shortcut (obj : Shortcut.t) = object (self)

  method get_action : unit -> GShortcut_action.shortcut_action option =
    fun () ->
      Option.map (fun ret -> new GShortcut_action.shortcut_action ret) (Shortcut.get_action obj)

  method get_trigger : unit -> GShortcut_trigger.shortcut_trigger option =
    fun () ->
      Option.map (fun ret -> new GShortcut_trigger.shortcut_trigger ret) (Shortcut.get_trigger obj)

  method set_action : 'p1. (#GShortcut_action.shortcut_action as 'p1) option -> unit =
    fun action ->
      let action = Option.map (fun (c) -> c#as_shortcut_action) action in
      (Shortcut.set_action obj action)

  method set_trigger : 'p1. (#GShortcut_trigger.shortcut_trigger as 'p1) option -> unit =
    fun trigger ->
      let trigger = Option.map (fun (c) -> c#as_shortcut_trigger) trigger in
      (Shortcut.set_trigger obj trigger)

    method as_shortcut = obj
end

