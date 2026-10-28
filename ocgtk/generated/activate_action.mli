(** Activates a widget.

    Widgets are activated by calling [Gtk.Widget.activate].

    Its methods, signals and properties are on {!class-type-activate_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Activate_action}. *)

(** {b The methods, signals and properties of a [ActivateAction].}

    Activates a widget.

    Widgets are activated by calling [Gtk.Widget.activate]. *)
class type activate_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_activate_action : Raw.Activate_action.t
end

class activate_action : Raw.Activate_action.t -> activate_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Activate_action.t}. *)
