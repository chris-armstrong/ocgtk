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

    - [Gtk.ShortcutsSection::change-current-page]

    Its methods, signals and properties are on
    {!class-type-shortcuts_section_t}. The functions it is built on are in
    {!Ocgtk.Raw.Shortcuts_section}. *)

(** The methods, signals and properties of a [GtkShortcutsSection]. *)
class type shortcuts_section_t = object
  inherit Box.box_t

  method on_change_current_page :
    ?after:bool ->
    callback:(offset:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_group : Shortcuts_group.shortcuts_group_t -> unit
  (** Adds a group to the shortcuts section.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child.

      Adding children with the [GtkBox] API is not appropriate, as
      [GtkShortcutsSection] manages its children internally. *)

  method max_height : int
  method set_max_height : int -> unit
  method section_name : string
  method set_section_name : string -> unit
  method title : string
  method set_title : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_section : Raw.Shortcuts_section.t
end

class shortcuts_section : Raw.Shortcuts_section.t -> shortcuts_section_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcuts_section.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutsSection], give one already wrapped. *)
