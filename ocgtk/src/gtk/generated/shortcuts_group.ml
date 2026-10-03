(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutsGroup: ShortcutsGroup *)

(** A [GtkShortcutsGroup] represents a group of related keyboard shortcuts or
    gestures.

    The group has a title. It may optionally be associated with a view of the
    application, which can be used to show only relevant shortcuts depending on
    the application context.

    This widget is only meant to be used with [Gtk.ShortcutsWindow].

    The recommended way to construct a [GtkShortcutsGroup] is with
    [Gtk.Builder], by using the [<child>] tag to populate a [GtkShortcutsGroup]
    with one or more [Gtk.ShortcutsShortcut] instances.

    If you need to add a shortcut programmatically, use
    [Gtk.ShortcutsGroup.add_shortcut]. *)

type t =
  [ `shortcuts_group | `box | `widget | `initially_unowned | `object_ ]
  Gobject.obj

(* Methods *)

external add_shortcut : t -> Shortcuts_shortcut.t -> unit
  = "ml_gtk_shortcuts_group_add_shortcut"
(** Adds a shortcut to the shortcuts group.

    This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
    tag to add the child. Adding children with other API is not appropriate as
    [GtkShortcutsGroup] manages its children internally. *)

(* Properties *)

external set_accel_size_group : t -> Size_group.t -> unit
  = "ml_gtk_shortcuts_group_set_accel_size_group"
(** Set property: accel-size-group *)

external get_height : t -> int = "ml_gtk_shortcuts_group_get_height"
(** Get property: height *)

external get_title : t -> string = "ml_gtk_shortcuts_group_get_title"
(** Get property: title *)

external set_title : t -> string -> unit = "ml_gtk_shortcuts_group_set_title"
(** Set property: title *)

external set_title_size_group : t -> Size_group.t -> unit
  = "ml_gtk_shortcuts_group_set_title_size_group"
(** Set property: title-size-group *)

external get_view : t -> string = "ml_gtk_shortcuts_group_get_view"
(** Get property: view *)

external set_view : t -> string -> unit = "ml_gtk_shortcuts_group_set_view"
(** Set property: view *)
