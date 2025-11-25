(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsWindow *)

type t = [`shortcuts_window | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(* Properties *)

(** Adds a section to the shortcuts window.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child.

Using [method@Gtk.Window.set_child] is not appropriate as the shortcuts
window manages its children internally. *)
external add_section : t -> Gtk.widget -> unit = "ml_gtk_shortcuts_window_add_section"

