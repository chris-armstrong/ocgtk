(* GENERATED CODE - DO NOT EDIT *)
(* NamedAction: NamedAction *)

(** Activates a named action.

    See [Gtk.WidgetClass.install_action] and
    {{!Ocgtk.Raw.Widget.val-insert_action_group}[Gtk.Widget.insert_action_group]}
    for ways to associate named actions with widgets.

    The class built on this module is in {!Ocgtk.Named_action}. *)

type t = [ `named_action | `shortcut_action | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_named_action_get_type"

external new_ : string -> t = "ml_gtk_named_action_new"
(** Creates an action that when activated, activates the named action on the
    widget.

    It also passes the given arguments to it.

    See
    {{!Ocgtk.Raw.Widget.val-insert_action_group}[Gtk.Widget.insert_action_group]}
    for how to add actions to widgets. *)

(* Methods *)

external get_action_name : t -> string = "ml_gtk_named_action_get_action_name"
(** Returns the name of the action that will be activated. *)

(* Properties *)
