(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutsSection: ShortcutsSection *)

(** A [GtkShortcutsSection] collects all the keyboard shortcuts and gestures for
    a major application mode.

    If your application needs multiple sections, you should give each section a
    unique [Gtk.ShortcutsSection:section-name] and a
    [Gtk.ShortcutsSection:title] that can be shown in the section selector of
    the [Gtk.ShortcutsWindow].

    The [Gtk.ShortcutsSection:max-height] property can be used to influence how
    the groups in the section are distributed over pages and columns.

    This widget is only meant to be used with [Gtk.ShortcutsWindow].

    The recommended way to construct a [GtkShortcutsSection] is with
    [Gtk.Builder], by using the [<child>] tag to populate a
    [GtkShortcutsSection] with one or more [Gtk.ShortcutsGroup] instances, which
    in turn contain one or more [Gtk.ShortcutsShortcut] objects.

    If you need to add a group programmatically, use
    [Gtk.ShortcutsSection.add_group].

    {b Shortcuts and Gestures}

    Pan gestures allow to navigate between sections.

    The following signals have default keybindings:

    - [Gtk.ShortcutsSection::change-current-page] *)

type t =
  [ `shortcuts_section | `box | `widget | `initially_unowned | `object_ ]
  Gobject.obj

(* Methods *)

external add_group : t -> Shortcuts_group.t -> unit
  = "ml_gtk_shortcuts_section_add_group"
(** Adds a group to the shortcuts section.

    This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
    tag to add the child.

    Adding children with the [GtkBox] API is not appropriate, as
    [GtkShortcutsSection] manages its children internally. *)

(* Properties *)

external get_max_height : t -> int = "ml_gtk_shortcuts_section_get_max_height"
(** Get property: max-height *)

external set_max_height : t -> int -> unit
  = "ml_gtk_shortcuts_section_set_max_height"
(** Set property: max-height *)

external get_section_name : t -> string
  = "ml_gtk_shortcuts_section_get_section_name"
(** Get property: section-name *)

external set_section_name : t -> string -> unit
  = "ml_gtk_shortcuts_section_set_section_name"
(** Set property: section-name *)

external get_title : t -> string = "ml_gtk_shortcuts_section_get_title"
(** Get property: title *)

external set_title : t -> string -> unit = "ml_gtk_shortcuts_section_set_title"
(** Set property: title *)

external get_view_name : t -> string = "ml_gtk_shortcuts_section_get_view_name"
(** Get property: view-name *)

external set_view_name : t -> string -> unit
  = "ml_gtk_shortcuts_section_set_view_name"
(** Set property: view-name *)

val on_change_current_page :
  ?after:bool -> t -> callback:(offset:int -> bool) -> Gobject.Signal.handler_id
