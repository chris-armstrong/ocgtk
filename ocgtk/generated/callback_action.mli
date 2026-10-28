(** Invokes a callback.

    Its methods, signals and properties are on {!class-type-callback_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Callback_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CallbackAction].}

    Invokes a callback. *)
class type callback_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_callback_action : Raw.Callback_action.t
end

class callback_action : Raw.Callback_action.t -> callback_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Callback_action.t}. *)
