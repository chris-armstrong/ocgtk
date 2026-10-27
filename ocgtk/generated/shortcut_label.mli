(** [GtkShortcutLabel] displays a single keyboard shortcut or gesture.

    The main use case for [GtkShortcutLabel] is inside a [Gtk.ShortcutsWindow].

    Its methods, signals and properties are on {!class-type-shortcut_label_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcut_label}. *)

(** The methods, signals and properties of a [GtkShortcutLabel]. *)
class type shortcut_label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_accelerator : unit -> string option
  (** Retrieves the current accelerator of [self]. *)

  method get_disabled_text : unit -> string option
  (** Retrieves the text that is displayed when no accelerator is set. *)

  method set_accelerator : string -> unit
  (** Sets the accelerator to be displayed by [self]. *)

  method set_disabled_text : string -> unit
  (** Sets the text to be displayed by [self] when no accelerator is set. *)

  method as_shortcut_label : Raw.Shortcut_label.t
end

class shortcut_label : Raw.Shortcut_label.t -> shortcut_label_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcut_label.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutLabel], give one already wrapped. *)

val new_ : string -> shortcut_label_t
