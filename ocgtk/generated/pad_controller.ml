class type pad_controller_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method set_action :
    Enums.padactiontype -> int -> int -> string -> string -> unit
  (** Adds an individual action to [controller].

      This action will only be activated if the given button/ring/strip number
      in [index] is interacted while the current mode is [mode]. -1 may be used
      for simple cases, so the action is triggered on all modes.

      The given [label] should be considered user-visible, so
      internationalization rules apply. Some windowing systems may be able to
      use those for user feedback. *)

  method set_action_entries : Raw.Pad_action_entry.t array -> int -> unit
  (** A convenience function to add a group of action entries on [controller].

      See [Gtk.PadActionEntry] and [Gtk.PadController.set_action]. *)

  method action_group : Ocgio.Action_group.action_group_t
  method pad : Ocgdk.Device.device_t
  method as_pad_controller : Raw.Pad_controller.t
end

(* High-level class for PadController *)
class pad_controller (obj : Raw.Pad_controller.t) : pad_controller_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method set_action :
        Enums.padactiontype -> int -> int -> string -> string -> unit =
      fun type_ index mode label action_name ->
        Raw.Pad_controller.set_action obj type_ index mode label action_name

    method set_action_entries : Raw.Pad_action_entry.t array -> int -> unit =
      fun entries n_entries ->
        Raw.Pad_controller.set_action_entries obj entries n_entries

    method action_group =
      new Ocgio.Action_group.action_group
        (Raw.Pad_controller.get_action_group obj)

    method pad = new Ocgdk.Device.device (Raw.Pad_controller.get_pad obj)
    method as_pad_controller = obj
  end

let new_ (group : Ocgio.Action_group.action_group_t)
    (pad : Ocgdk.Device.device_t option) : pad_controller_t =
  let group = group#as_action_group in
  let pad = Option.map (fun c -> c#as_device) pad in
  let obj_ = Raw.Pad_controller.new_ group pad in
  new pad_controller obj_
