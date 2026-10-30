(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutsWindow: ShortcutsWindow *)

(** A [GtkShortcutsWindow] shows information about the keyboard shortcuts and
    gestures of an application.

    The shortcuts can be grouped, and you can have multiple sections in this
    window, corresponding to the major modes of your application.

    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.

    The recommended way to construct a [GtkShortcutsWindow] is with
    {{!Ocgtk.Raw.Builder}[Gtk.Builder]}, by using the [<child>] tag to populate
    a [GtkShortcutsWindow] with one or more
    {{!Ocgtk.Raw.Shortcuts_section}[Gtk.ShortcutsSection]} objects, which
    contain one or more {{!Ocgtk.Raw.Shortcuts_group}[Gtk.ShortcutsGroup]}
    instances, which, in turn, contain
    {{!Ocgtk.Raw.Shortcuts_shortcut}[Gtk.ShortcutsShortcut]} instances.

    If you need to add a section programmatically, use
    {{!Ocgtk.Raw.Shortcuts_window.val-add_section}[Gtk.ShortcutsWindow.add_section]}
    instead of {{!Ocgtk.Raw.Window.val-set_child}[Gtk.Window.set_child]}, as the
    shortcuts window manages its children directly.

    {b A simple example:}

    A simple example

    This example has as single section. As you can see, the shortcut groups are
    arranged in columns, and spread across several pages if there are too many
    to find on a single page.

    The .ui file for this example can be found
    {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-gedit.ui}here}.

    {b An example with multiple views:}

    An example with multiple views

    This example shows a [GtkShortcutsWindow] that has been configured to show
    only the shortcuts relevant to the “Stopwatch” view.

    The .ui file for this example can be found
    {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-clocks.ui}here}.

    {b An example with multiple sections:}

    An example with multiple sections

    This example shows a [GtkShortcutsWindow] with two sections, “Editor
    Shortcuts” and “Terminal Shortcuts”.

    The .ui file for this example can be found
    {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-builder.ui}here}.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Raw.Shortcuts_window.val-on_close}[Gtk.ShortcutsWindow::close]}
    - {{!Ocgtk.Raw.Shortcuts_window.val-on_search}[Gtk.ShortcutsWindow::search]}

    {b CSS nodes}

    [GtkShortcutsWindow] has a single CSS node with the name [window] and style
    class [.shortcuts].

    The class built on this module is in {!Ocgtk.Shortcuts_window}. *)

type t =
  [ `shortcuts_window | `window | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_shortcuts_window_get_type"

(* Methods *)

external add_section : t -> Shortcuts_section.t -> unit
  = "ml_gtk_shortcuts_window_add_section"
(** Adds a section to the shortcuts window.

    This is the programmatic equivalent to using
    {{!Ocgtk.Raw.Builder}[Gtk.Builder]} and a [<child>] tag to add the child.

    Using {{!Ocgtk.Raw.Window.val-set_child}[Gtk.Window.set_child]} is not
    appropriate as the shortcuts window manages its children internally. *)

(* Properties *)

external get_section_name : t -> string
  = "ml_gtk_shortcuts_window_get_section_name"
(** The name of the section to show.

    This should be the section-name of one of the [GtkShortcutsSection] objects
    that are in this shortcuts window. *)

external set_section_name : t -> string -> unit
  = "ml_gtk_shortcuts_window_set_section_name"
(** The name of the section to show.

    This should be the section-name of one of the [GtkShortcutsSection] objects
    that are in this shortcuts window. *)

external get_view_name : t -> string = "ml_gtk_shortcuts_window_get_view_name"
(** The view name by which to filter the contents.

    This should correspond to the
    {{!Ocgtk.Raw.Shortcuts_group.val-get_view}[Gtk.ShortcutsGroup:view]}
    property of some of the {{!Ocgtk.Raw.Shortcuts_group}[Gtk.ShortcutsGroup]}
    objects that are inside this shortcuts window.

    Set this to [None] to show all groups. *)

external set_view_name : t -> string -> unit
  = "ml_gtk_shortcuts_window_set_view_name"
(** The view name by which to filter the contents.

    This should correspond to the
    {{!Ocgtk.Raw.Shortcuts_group.val-get_view}[Gtk.ShortcutsGroup:view]}
    property of some of the {{!Ocgtk.Raw.Shortcuts_group}[Gtk.ShortcutsGroup]}
    objects that are inside this shortcuts window.

    Set this to [None] to show all groups. *)

val on_close :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user uses a keybinding to close the window.

    This is a keybinding signal.

    The default binding for this signal is the <kbd>Escape</kbd> key. *)

val on_search :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user uses a keybinding to start a search.

    This is a keybinding signal.

    The default binding for this signal is <kbd>Control</kbd>+<kbd>F</kbd>. *)
