(** Triggers when a specific keyval and modifiers are pressed.

    Its methods, signals and properties are on {!class-type-keyval_trigger_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Keyval_trigger}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [KeyvalTrigger].}

    Triggers when a specific keyval and modifiers are pressed. *)
class type keyval_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:methods Methods} *)

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  method get_modifiers : unit -> Ocgdk.Enums.modifiertype
  (** Gets the modifiers that must be present to succeed triggering [self]. *)

  (** {2:conversions Conversions} *)

  method as_keyval_trigger : Raw.Keyval_trigger.t
end

class keyval_trigger : Raw.Keyval_trigger.t -> keyval_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Keyval_trigger.t}. *)

(** {1:constructors Constructors} *)

val new_ : int -> Ocgdk.Enums.modifiertype -> keyval_trigger_t
(** Creates a [GtkShortcutTrigger] that will trigger whenever the key with the
    given [keyval] and [modifiers] is pressed. *)
