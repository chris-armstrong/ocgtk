(** Combines two shortcut triggers.

    Its methods, signals and properties are on
    {!class-type-alternative_trigger_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Alternative_trigger}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AlternativeTrigger].}

    Inherits from:
    {{!Ocgtk.Shortcut_trigger.class-type-shortcut_trigger_t}Ocgtk.Shortcut_trigger}

    Combines two shortcut triggers.

    The [GtkAlternativeTrigger] triggers when either of the two trigger.

    This can be cascaded to combine more than two triggers. *)
class type alternative_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:methods Methods} *)

  method get_first : unit -> Shortcut_trigger.shortcut_trigger_t
  (** Gets the first of the two alternative triggers that may trigger [self].

      [Gtk.AlternativeTrigger.get_second] will return the other one. *)

  method get_second : unit -> Shortcut_trigger.shortcut_trigger_t
  (** Gets the second of the two alternative triggers that may trigger [self].

      [Gtk.AlternativeTrigger.get_first] will return the other one. *)

  (** {2:conversions Conversions} *)

  method as_alternative_trigger : Raw.Alternative_trigger.t
end

class alternative_trigger : Raw.Alternative_trigger.t -> alternative_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Alternative_trigger.t}. *)

(** {1:description Description}

    Combines two shortcut triggers.

    The [GtkAlternativeTrigger] triggers when either of the two trigger.

    This can be cascaded to combine more than two triggers. *)

(** {1:constructors Constructors} *)

val new_ :
  Shortcut_trigger.shortcut_trigger_t ->
  Shortcut_trigger.shortcut_trigger_t ->
  alternative_trigger_t
(** Creates a [GtkShortcutTrigger] that will trigger whenever either of the two
    given triggers gets triggered.

    Note that nesting is allowed, so if you want more than two alternative,
    create a new alternative trigger for each option. *)
