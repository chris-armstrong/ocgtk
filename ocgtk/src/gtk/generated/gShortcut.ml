class type shortcut_t = object
    method get_action : unit -> GShortcut_action.shortcut_action_t option
    method get_arguments : unit -> Gvariant.t option
    method get_trigger : unit -> GShortcut_trigger.shortcut_trigger_t option
    method set_action : GShortcut_action.shortcut_action_t option -> unit
    method set_arguments : Gvariant.t option -> unit
    method set_trigger : GShortcut_trigger.shortcut_trigger_t option -> unit
    method as_shortcut : Shortcut.t
end

(* High-level class for Shortcut *)
class shortcut (obj : Shortcut.t) : shortcut_t = object (self)

  method get_action : unit -> GShortcut_action.shortcut_action_t option =
    fun () ->
      Option.map (fun ret -> new GShortcut_action.shortcut_action ret) (Shortcut.get_action obj)

  method get_arguments : unit -> Gvariant.t option =
    fun () ->
      (Shortcut.get_arguments obj)

  method get_trigger : unit -> GShortcut_trigger.shortcut_trigger_t option =
    fun () ->
      Option.map (fun ret -> new GShortcut_trigger.shortcut_trigger ret) (Shortcut.get_trigger obj)

  method set_action : GShortcut_action.shortcut_action_t option -> unit =
    fun action ->
      let action = Option.map (fun (c) -> c#as_shortcut_action) action in
      (Shortcut.set_action obj action)

  method set_arguments : Gvariant.t option -> unit =
    fun args ->
      (Shortcut.set_arguments obj args)

  method set_trigger : GShortcut_trigger.shortcut_trigger_t option -> unit =
    fun trigger ->
      let trigger = Option.map (fun (c) -> c#as_shortcut_trigger) trigger in
      (Shortcut.set_trigger obj trigger)

    method as_shortcut = obj
end

let new_ (trigger : GShortcut_trigger.shortcut_trigger_t option) (action : GShortcut_action.shortcut_action_t option) : shortcut_t =
  let trigger = Option.map (fun c -> c#as_shortcut_trigger) trigger in
  let action = Option.map (fun c -> c#as_shortcut_action) action in
  let obj_ = Shortcut.new_ trigger action in
  new shortcut obj_

