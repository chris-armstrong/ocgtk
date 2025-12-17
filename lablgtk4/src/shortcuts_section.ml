(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsSection *)

type t = [`shortcuts_section | `box | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(* Properties *)

(** Adds a group to the shortcuts section.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child.

Adding children with the `GtkBox` API is not appropriate, as
`GtkShortcutsSection` manages its children internally. *)
external add_group : t -> Shortcuts_group.t -> unit = "ml_gtk_shortcuts_section_add_group"

