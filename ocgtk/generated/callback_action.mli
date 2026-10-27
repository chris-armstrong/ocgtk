(** Invokes a callback.

    Its methods, signals and properties are on {!class-type-callback_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Callback_action}. *)

(** The methods, signals and properties of a [GtkCallbackAction]. *)
class type callback_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_callback_action : Raw.Callback_action.t
end

class callback_action : Raw.Callback_action.t -> callback_action_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Callback_action.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkCallbackAction], give one already wrapped. *)
