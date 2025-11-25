(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsGroup *)

type t = [`shortcuts_group | `box | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(* Properties *)

(** Adds a shortcut to the shortcuts group.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child. Adding children with other API is not
appropriate as `GtkShortcutsGroup` manages its children internally. *)
external add_shortcut : t -> Gtk.widget -> unit = "ml_gtk_shortcuts_group_add_shortcut"

