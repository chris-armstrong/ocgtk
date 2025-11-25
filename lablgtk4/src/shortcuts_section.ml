(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsSection *)

type t = [`shortcuts_section | `box | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(* Properties *)

(** Adds a group to the shortcuts section.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child.

Adding children with the `GtkBox` API is not appropriate, as
`GtkShortcutsSection` manages its children internally. *)
external add_group : t -> Gtk.widget -> unit = "ml_gtk_shortcuts_section_add_group"

