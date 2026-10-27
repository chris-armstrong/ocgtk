(** Activates a named action.

    See [Gtk.WidgetClass.install_action] and [Gtk.Widget.insert_action_group]
    for ways to associate named actions with widgets.

    Its methods, signals and properties are on {!class-type-named_action_t}. The
    functions it is built on are in {!Ocgtk.Raw.Named_action}. *)

(** The methods, signals and properties of a [GtkNamedAction]. *)
class type named_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method get_action_name : unit -> string
  method as_named_action : Raw.Named_action.t
end

class named_action : Raw.Named_action.t -> named_action_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Named_action.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNamedAction], give one already wrapped. *)

val new_ : string -> named_action_t
