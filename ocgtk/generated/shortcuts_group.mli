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

(** The methods, signals and properties of a [ShortcutsGroup]. *)
class type shortcuts_group_t = object
  inherit Box.box_t

  method add_shortcut : Shortcuts_shortcut.shortcuts_shortcut_t -> unit
  (** Adds a shortcut to the shortcuts group.

      This is the programmatic equivalent to using [Gtk.Builder] and a [<child>]
      tag to add the child. Adding children with other API is not appropriate as
      [GtkShortcutsGroup] manages its children internally. *)

  method set_accel_size_group : Size_group.size_group_t -> unit
  (** The size group for the accelerator portion of shortcuts in this group.

      This is used internally by GTK, and must not be modified by applications.
  *)

  method height : int
  (** A rough measure for the number of lines in this group.

      This is used internally by GTK, and is not useful for applications. *)

  method title : string
  (** The title for this group of shortcuts. *)

  method set_title : string -> unit
  (** The title for this group of shortcuts. *)

  method set_title_size_group : Size_group.size_group_t -> unit
  (** The size group for the textual portion of shortcuts in this group.

      This is used internally by GTK, and must not be modified by applications.
  *)

  method view : string
  (** An optional view that the shortcuts in this group are relevant for.

      The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
      does not match the view of this group.

      Set this to [NULL] to make the group always visible. *)

  method set_view : string -> unit
  (** An optional view that the shortcuts in this group are relevant for.

      The group will be hidden if the [Gtk.ShortcutsWindow:view-name] property
      does not match the view of this group.

      Set this to [NULL] to make the group always visible. *)

  method as_shortcuts_group : Raw.Shortcuts_group.t
end

class shortcuts_group : Raw.Shortcuts_group.t -> shortcuts_group_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcuts_group.t}. *)
