(** [GtkShortcutLabel] displays a single keyboard shortcut or gesture.

    Its methods, signals and properties are on {!class-type-shortcut_label_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Shortcut_label}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ShortcutLabel].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    [GtkShortcutLabel] displays a single keyboard shortcut or gesture.

    The main use case for [GtkShortcutLabel] is inside a [Gtk.ShortcutsWindow].
*)
class type shortcut_label_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_accelerator : unit -> string option
  (** Retrieves the current accelerator of [self]. *)

  method get_disabled_text : unit -> string option
  (** Retrieves the text that is displayed when no accelerator is set. *)

  method set_accelerator : string -> unit
  (** Sets the accelerator to be displayed by [self]. *)

  method set_disabled_text : string -> unit
  (** Sets the text to be displayed by [self] when no accelerator is set. *)

  (** {2:conversions Conversions} *)

  method as_shortcut_label : Raw.Shortcut_label.t
end

class shortcut_label : Raw.Shortcut_label.t -> shortcut_label_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcut_label.t}. *)

(** {1:description Description}

    [GtkShortcutLabel] displays a single keyboard shortcut or gesture.

    The main use case for [GtkShortcutLabel] is inside a [Gtk.ShortcutsWindow].
*)

(** {1:constructors Constructors} *)

val new_ : string -> shortcut_label_t
(** Creates a new [GtkShortcutLabel] with [accelerator] set. *)
