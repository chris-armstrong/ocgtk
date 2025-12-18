(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsSection *)

type t = [`shortcuts_section | `box | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(* Properties *)

(** Get property: max-height *)
external get_max_height : t -> int = "ml_gtk_shortcuts_section_get_max_height"

(** Set property: max-height *)
external set_max_height : t -> int -> unit = "ml_gtk_shortcuts_section_set_max_height"

(** Get property: section-name *)
external get_section_name : t -> string = "ml_gtk_shortcuts_section_get_section_name"

(** Set property: section-name *)
external set_section_name : t -> string -> unit = "ml_gtk_shortcuts_section_set_section_name"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_shortcuts_section_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_shortcuts_section_set_title"

(** Get property: view-name *)
external get_view_name : t -> string = "ml_gtk_shortcuts_section_get_view_name"

(** Set property: view-name *)
external set_view_name : t -> string -> unit = "ml_gtk_shortcuts_section_set_view_name"

(** Adds a group to the shortcuts section.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child.

Adding children with the `GtkBox` API is not appropriate, as
`GtkShortcutsSection` manages its children internally. *)
external add_group : t -> Shortcuts_group.t -> unit = "ml_gtk_shortcuts_section_add_group"

