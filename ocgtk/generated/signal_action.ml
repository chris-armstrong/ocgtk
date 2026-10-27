class type signal_action_t = object
  inherit Shortcut_action.shortcut_action_t

  method get_signal_name : unit -> string
  (** Returns the name of the signal that will be emitted. *)

  method as_signal_action : Raw.Signal_action.t
end

(* High-level class for SignalAction *)
class signal_action (obj : Raw.Signal_action.t) : signal_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)

    method get_signal_name : unit -> string =
      fun () -> Raw.Signal_action.get_signal_name obj

    method as_signal_action = obj
  end

let new_ (signal_name : string) : signal_action_t =
  let obj_ = Raw.Signal_action.new_ signal_name in
  new signal_action obj_
