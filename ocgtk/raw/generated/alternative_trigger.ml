(* GENERATED CODE - DO NOT EDIT *)
(* AlternativeTrigger: AlternativeTrigger *)

(** Combines two shortcut triggers.

    The [GtkAlternativeTrigger] triggers when either of the two trigger.

    This can be cascaded to combine more than two triggers.

    The class built on this module is in {!Ocgtk.Alternative_trigger}. *)

type t = [ `alternative_trigger | `shortcut_trigger | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_alternative_trigger_get_type"

external new_ : Shortcut_trigger.t -> Shortcut_trigger.t -> t
  = "ml_gtk_alternative_trigger_new"
(** Creates a [GtkShortcutTrigger] that will trigger whenever either of the two
    given triggers gets triggered.

    Note that nesting is allowed, so if you want more than two alternative,
    create a new alternative trigger for each option. *)

(* Methods *)

external get_second : t -> Shortcut_trigger.t
  = "ml_gtk_alternative_trigger_get_second"
(** Gets the second of the two alternative triggers that may trigger [self].

    {{!Ocgtk.Raw.Alternative_trigger.val-get_first}[Gtk.AlternativeTrigger.get_first]}
    will return the other one. *)

external get_first : t -> Shortcut_trigger.t
  = "ml_gtk_alternative_trigger_get_first"
(** Gets the first of the two alternative triggers that may trigger [self].

    {{!Ocgtk.Raw.Alternative_trigger.val-get_second}[Gtk.AlternativeTrigger.get_second]}
    will return the other one. *)

(* Properties *)
