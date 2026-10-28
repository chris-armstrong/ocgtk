class type shortcut_t = object
  method get_action : unit -> Shortcut_action.shortcut_action_t option
  (** Gets the action that is activated by this shortcut. *)

  method get_arguments : unit -> Gvariant.t option
  (** Gets the arguments that are passed when activating the shortcut. *)

  method get_trigger : unit -> Shortcut_trigger.shortcut_trigger_t option
  (** Gets the trigger used to trigger [self]. *)

  method set_action : Shortcut_action.shortcut_action_t option -> unit
  (** Sets the new action for [self] to be [action]. *)

  method set_arguments : Gvariant.t option -> unit
  (** Sets the arguments to pass when activating the shortcut. *)

  method set_trigger : Shortcut_trigger.shortcut_trigger_t option -> unit
  (** Sets the new trigger for [self] to be [trigger]. *)

  method as_shortcut : Raw.Shortcut.t
end

(* High-level class for Shortcut *)
class shortcut (obj : Raw.Shortcut.t) : shortcut_t =
  object (self)
    method get_action : unit -> Shortcut_action.shortcut_action_t option =
      fun () ->
        Option.map
          (fun ret -> new Shortcut_action.shortcut_action ret)
          (Raw.Shortcut.get_action obj)

    method get_arguments : unit -> Gvariant.t option =
      fun () -> Raw.Shortcut.get_arguments obj

    method get_trigger : unit -> Shortcut_trigger.shortcut_trigger_t option =
      fun () ->
        Option.map
          (fun ret -> new Shortcut_trigger.shortcut_trigger ret)
          (Raw.Shortcut.get_trigger obj)

    method set_action : Shortcut_action.shortcut_action_t option -> unit =
      fun action ->
        let action = Option.map (fun c -> c#as_shortcut_action) action in
        Raw.Shortcut.set_action obj action

    method set_arguments : Gvariant.t option -> unit =
      fun args -> Raw.Shortcut.set_arguments obj args

    method set_trigger : Shortcut_trigger.shortcut_trigger_t option -> unit =
      fun trigger ->
        let trigger = Option.map (fun c -> c#as_shortcut_trigger) trigger in
        Raw.Shortcut.set_trigger obj trigger

    method as_shortcut = obj
  end

let new_ (trigger : Shortcut_trigger.shortcut_trigger_t option)
    (action : Shortcut_action.shortcut_action_t option) : shortcut_t =
  let trigger = Option.map (fun c -> c#as_shortcut_trigger) trigger in
  let action = Option.map (fun c -> c#as_shortcut_action) action in
  let obj_ = Raw.Shortcut.new_ trigger action in
  new shortcut obj_
