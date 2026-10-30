(** Invokes a callback.

    Its methods, signals and properties are on {!class-type-callback_action_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Callback_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CallbackAction].}

    Inherits from:
    {{!Ocgtk.Shortcut_action.class-type-shortcut_action_t}Ocgtk.Shortcut_action}

    Invokes a callback. *)
class type callback_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_callback_action : Raw.Callback_action.t
end

class callback_action : Raw.Callback_action.t -> callback_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Callback_action.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
