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
    [Gtk.ShortcutsGroup.add_shortcut].

    The class built on this module is in {!Ocgtk.Shortcuts_group}. *)

type t =
  [ `shortcuts_group | `box | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_shortcuts_group_get_type"

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
(** The size group for the accelerator portion of shortcuts in this group.

    This is used internally by GTK, and must not be modified by applications. *)

external get_height : t -> int = "ml_gtk_shortcuts_group_get_height"
(** A rough measure for the number of lines in this group.

    This is used internally by GTK, and is not useful for applications. *)

external get_title : t -> string = "ml_gtk_shortcuts_group_get_title"
(** The title for this group of shortcuts. *)

external set_title : t -> string -> unit = "ml_gtk_shortcuts_group_set_title"
(** The title for this group of shortcuts. *)

external set_title_size_group : t -> Size_group.t -> unit
  = "ml_gtk_shortcuts_group_set_title_size_group"
(** The size group for the textual portion of shortcuts in this group.

    This is used internally by GTK, and must not be modified by applications. *)

external get_view : t -> string = "ml_gtk_shortcuts_group_get_view"
(** An optional view that the shortcuts in this group are relevant for.

    The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
    does not match the view of this group.

    Set this to [None] to make the group always visible. *)

external set_view : t -> string -> unit = "ml_gtk_shortcuts_group_set_view"
(** An optional view that the shortcuts in this group are relevant for.

    The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
    does not match the view of this group.

    Set this to [None] to make the group always visible. *)
