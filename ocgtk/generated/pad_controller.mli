class type pad_controller_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method set_action :
    Enums.padactiontype -> int -> int -> string -> string -> unit

  method set_action_entries : Raw.Pad_action_entry.t array -> int -> unit
  method action_group : Ocgio.Action_group.action_group_t
  method pad : Ocgdk.Device.device_t
  method as_pad_controller : Raw.Pad_controller.t
end

class pad_controller : Raw.Pad_controller.t -> pad_controller_t

val new_ :
  Ocgio.Action_group.action_group_t ->
  Ocgdk.Device.device_t option ->
  pad_controller_t
