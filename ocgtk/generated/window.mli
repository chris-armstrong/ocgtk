(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Window from cyclic group Application_and__window_and__window_group *)

(** A toplevel window which can contain other widgets.

    An example GtkWindow

    Windows normally have decorations that are under the control of the
    windowing system and allow the user to manipulate the window (resize it,
    move it, close it,...).

    {b GtkWindow as GtkBuildable}

    The [GtkWindow] implementation of the [Gtk.Buildable] interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a [<child>] element.

    {b Shortcuts and Gestures}

    [GtkWindow] supports the following keyboard shortcuts:

    - <kbd>F10</kbd> activates the menubar, if present.
    - <kbd>Alt</kbd> makes the mnemonics visible while pressed.

    The following signals have default keybindings:

    - [Gtk.Window::activate-default]
    - [Gtk.Window::activate-focus]
    - [Gtk.Window::enable-debugging]

    {b Actions}

    [GtkWindow] defines a set of built-in actions:

    - [default.activate] activates the default widget.
    - [window.minimize] minimizes the window.
    - [window.toggle-maximized] maximizes or restores the window.
    - [window.close] closes the window.

    {b CSS nodes}

    {[
    window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
    ├── <child>
    ╰── <titlebar child>.titlebar [.default-decoration]
    ]}

    [GtkWindow] has a main CSS node with name window and style class
    .background.

    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .maximized, .fullscreen, .tiled (when
    supported, also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).

    [GtkWindow] subclasses often add their own discriminating style classes,
    such as .dialog, .popup or .tooltip.

    Generally, some CSS properties don't make sense on the toplevel window node,
    such as margins or padding. When client-side decorations without invisible
    borders are in use (i.e. the .solid-csd style class is added to the main
    window node), the CSS border of the toplevel window is used for resize
    drags. In the .csd case, the shadow area outside of the window can be used
    to resize it.

    [GtkWindow] adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.

    {b Accessibility}

    [GtkWindow] uses the [Gtk.AccessibleRole.window] role.

    From GTK 4.12 to 4.18, it used the [Gtk.AccessibleRole.application] role.

    Its methods, signals and properties are on {!class-type-window_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Window}. *)

class type window_t = Application_and__window_and__window_group.window_t
(** {b The methods, signals and properties of a [Window].}

    A toplevel window which can contain other widgets.

    An example GtkWindow

    Windows normally have decorations that are under the control of the
    windowing system and allow the user to manipulate the window (resize it,
    move it, close it,...).

    {b GtkWindow as GtkBuildable}

    The [GtkWindow] implementation of the [Gtk.Buildable] interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a [<child>] element.

    {b Shortcuts and Gestures}

    [GtkWindow] supports the following keyboard shortcuts:

    - <kbd>F10</kbd> activates the menubar, if present.
    - <kbd>Alt</kbd> makes the mnemonics visible while pressed.

    The following signals have default keybindings:

    - [Gtk.Window::activate-default]
    - [Gtk.Window::activate-focus]
    - [Gtk.Window::enable-debugging]

    {b Actions}

    [GtkWindow] defines a set of built-in actions:

    - [default.activate] activates the default widget.
    - [window.minimize] minimizes the window.
    - [window.toggle-maximized] maximizes or restores the window.
    - [window.close] closes the window.

    {b CSS nodes}

    {[
    window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
    ├── <child>
    ╰── <titlebar child>.titlebar [.default-decoration]
    ]}

    [GtkWindow] has a main CSS node with name window and style class
    .background.

    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .maximized, .fullscreen, .tiled (when
    supported, also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).

    [GtkWindow] subclasses often add their own discriminating style classes,
    such as .dialog, .popup or .tooltip.

    Generally, some CSS properties don't make sense on the toplevel window node,
    such as margins or padding. When client-side decorations without invisible
    borders are in use (i.e. the .solid-csd style class is added to the main
    window node), the CSS border of the toplevel window is used for resize
    drags. In the .csd case, the shadow area outside of the window can be used
    to resize it.

    [GtkWindow] adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.

    {b Accessibility}

    [GtkWindow] uses the [Gtk.AccessibleRole.window] role.

    From GTK 4.12 to 4.18, it used the [Gtk.AccessibleRole.application] role. *)

class window : Raw.Window.t -> window_t
(** Wraps a raw handle of {!Ocgtk.Raw.Window.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> window_t
(** Creates a new [GtkWindow].

    To get an undecorated window (without window borders), use
    [Gtk.Window.set_decorated].

    All top-level windows created by this function are stored in an internal
    top-level window list. This list can be obtained from
    [Gtk.Window.list_toplevels]. Due to GTK keeping a reference to the window
    internally, this function does not return a reference to the caller.

    To delete a [GtkWindow], call [Gtk.Window.destroy]. *)
