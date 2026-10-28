(** Activates a named action.

    See [Gtk.WidgetClass.install_action] and [Gtk.Widget.insert_action_group]
    for ways to associate named actions with widgets.

    Its methods, signals and properties are on {!class-type-named_action_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Named_action}. *)

(** The methods, signals and properties of a [NamedAction]. *)
class type named_action_t = object
  inherit Shortcut_action.shortcut_action_t

  method get_action_name : unit -> string
  (** Returns the name of the action that will be activated. *)

  method as_named_action : Raw.Named_action.t
end

class named_action : Raw.Named_action.t -> named_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Named_action.t}. *)

(** {2:constructors Constructors} *)

val new_ : string -> named_action_t
(** Creates an action that when activated, activates the named action on the
    widget.

    It also passes the given arguments to it.

    See [Gtk.Widget.insert_action_group] for how to add actions to widgets. *)
