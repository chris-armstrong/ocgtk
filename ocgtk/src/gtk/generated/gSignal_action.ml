class type signal_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method get_signal_name : unit -> string
    method as_signal_action : Signal_action.t
end

(* High-level class for SignalAction *)
class signal_action (obj : Signal_action.t) : signal_action_t = object (self)
  inherit GShortcut_action.shortcut_action (obj :> Shortcut_action.t)

  method get_signal_name : unit -> string =
    fun () ->
      (Signal_action.get_signal_name obj)

    method as_signal_action = obj
end

let new_ (signal_name : string) : signal_action_t =
  let obj_ = Signal_action.new_ signal_name in
  new signal_action obj_

