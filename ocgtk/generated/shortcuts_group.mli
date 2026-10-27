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

    Its methods, signals and properties are on {!class-type-shortcuts_group_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcuts_group}. *)

(** The methods, signals and properties of a [GtkShortcutsGroup]. *)
class type shortcuts_group_t = object
  inherit Box.box_t

  method add_shortcut : Shortcuts_shortcut.shortcuts_shortcut_t -> unit
  (** Adds a shortcut to the shortcuts group.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child. Adding children with other API is not appropriate as
      [GtkShortcutsGroup] manages its children internally. *)

  method set_accel_size_group : Size_group.size_group_t -> unit
  method height : int
  method title : string
  method set_title : string -> unit
  method set_title_size_group : Size_group.size_group_t -> unit
  method view : string
  method set_view : string -> unit
  method as_shortcuts_group : Raw.Shortcuts_group.t
end

class shortcuts_group : Raw.Shortcuts_group.t -> shortcuts_group_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcuts_group.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutsGroup], give one already wrapped. *)
