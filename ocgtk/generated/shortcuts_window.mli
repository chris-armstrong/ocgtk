(** A [GtkShortcutsWindow] shows information about the keyboard shortcuts and
    gestures of an application.

    The shortcuts can be grouped, and you can have multiple sections in this
    window, corresponding to the major modes of your application.

    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.

    The recommended way to construct a [GtkShortcutsWindow] is with
    [Gtk.Builder], by using the [<child>] tag to populate a [GtkShortcutsWindow]
    with one or more [Gtk.ShortcutsSection] objects, which contain one or more
    [Gtk.ShortcutsGroup] instances, which, in turn, contain
    [Gtk.ShortcutsShortcut] instances.

    If you need to add a section programmatically, use
    [Gtk.ShortcutsWindow.add_section] instead of [Gtk.Window.set_child], as the
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

    - [Gtk.ShortcutsWindow::close]
    - [Gtk.ShortcutsWindow::search]

    {b CSS nodes}

    [GtkShortcutsWindow] has a single CSS node with the name [window] and style
    class [.shortcuts].

    Its methods, signals and properties are on {!class-type-shortcuts_window_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcuts_window}. *)

(** The methods, signals and properties of a [GtkShortcutsWindow]. *)
class type shortcuts_window_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_search :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_section : Shortcuts_section.shortcuts_section_t -> unit
  method section_name : string
  method set_section_name : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_window : Raw.Shortcuts_window.t
end

class shortcuts_window : Raw.Shortcuts_window.t -> shortcuts_window_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcuts_window.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutsWindow], give one already wrapped. *)
