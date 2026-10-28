(** A [GtkShortcutTrigger] that never triggers.

    Its methods, signals and properties are on {!class-type-never_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Never_trigger}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NeverTrigger].}

    Inherits from:
    {{!Ocgtk.Shortcut_trigger.class-type-shortcut_trigger_t}Ocgtk.Shortcut_trigger}

    A [GtkShortcutTrigger] that never triggers. *)
class type never_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:conversions Conversions} *)

  method as_never_trigger : Raw.Never_trigger.t
end

class never_trigger : Raw.Never_trigger.t -> never_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Never_trigger.t}. *)
