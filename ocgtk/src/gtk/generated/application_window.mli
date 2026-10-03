(* GENERATED CODE - DO NOT EDIT *)
(* ApplicationWindow: ApplicationWindow *)

type t =
  [ `application_window | `window | `widget | `initially_unowned | `object_ ]
  Gobject.obj
(** A [GtkWindow] subclass that integrates with [GtkApplication].

    Notably, [GtkApplicationWindow] can handle an application menubar.

    This class implements the [Gio.ActionGroup] and [Gio.ActionMap] interfaces,
    to let you add window-specific actions that will be exported by the
    associated [Gtk.Application], together with its application-wide actions.
    Window-specific actions are prefixed with the “win.” prefix and
    application-wide actions are prefixed with the “app.” prefix. Actions must
    be addressed with the prefixed name when referring to them from a menu
    model.

    Note that widgets that are placed inside a [GtkApplicationWindow] can also
    activate these actions, if they implement the [Gtk.Actionable] interface.

    The settings [Gtk.Settings:gtk-shell-shows-app-menu] and
    [Gtk.Settings:gtk-shell-shows-menubar] tell GTK whether the desktop
    environment is showing the application menu and menubar models outside the
    application as part of the desktop shell. For instance, on OS X, both menus
    will be displayed remotely; on Windows neither will be.

    If the desktop environment does not display the menubar, it can be shown in
    the [GtkApplicationWindow] by setting the
    [Gtk.ApplicationWindow:show-menubar] property to true. If the desktop
    environment does not display the application menu, then it will
    automatically be included in the menubar or in the window’s client-side
    decorations.

    See [Gtk.PopoverMenu] for information about the XML language used by
    [GtkBuilder] for menu models.

    See also: [Gtk.Application.set_menubar].

    {b A GtkApplicationWindow with a menubar}

    The code sample below shows how to set up a [GtkApplicationWindow] with a
    menu bar defined on the [Gtk.Application]:

    {[
    GtkApplication *app = gtk_application_new (“org.gtk.test”, 0);

    GtkBuilder *builder = gtk_builder_new_from_string (
        “<interface>”
        “  <menu id='menubar'>”
        “    <submenu>”
        “      <attribute name='label' translatable='yes'>_Edit</attribute>”
        “      <item>”
        “        <attribute name='label' translatable='yes'>_Copy</attribute>”
        “        <attribute name='action'>win.copy</attribute>”
        “      </item>”
        “      <item>”
        “        <attribute name='label' translatable='yes'>_Paste</attribute>”
        “        <attribute name='action'>win.paste</attribute>”
        “      </item>”
        “    </submenu>”
        “  </menu>”
        “</interface>”,
        -1);

    GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder, “menubar”));
    gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
    g_object_unref (builder);

    // ...

    GtkWidget *window = gtk_application_window_new (app);
    ]} *)

external new_ : Application_and__window_and__window_group.Application.t -> t
  = "ml_gtk_application_window_new"
(** Create a new ApplicationWindow *)

(* Methods *)

external set_show_menubar : t -> bool -> unit
  = "ml_gtk_application_window_set_show_menubar"
(** Sets whether the window will display a menubar for the app menu and menubar
    as needed. *)

external set_help_overlay : t -> Shortcuts_window.t option -> unit
  = "ml_gtk_application_window_set_help_overlay"
(** Associates a shortcuts window with the application window.

    Additionally, sets up an action with the name [win.show-help-overlay] to
    present it.

    The window takes responsibility for destroying the help overlay. *)

external get_show_menubar : t -> bool
  = "ml_gtk_application_window_get_show_menubar"
(** Returns whether the window will display a menubar for the app menu and
    menubar as needed. *)

external get_id : t -> int = "ml_gtk_application_window_get_id"
(** Returns the unique ID of the window.

    If the window has not yet been added to a [GtkApplication], returns [0]. *)

external get_help_overlay : t -> Shortcuts_window.t option
  = "ml_gtk_application_window_get_help_overlay"
(** Gets the [GtkShortcutsWindow] that is associated with [window].

    See [Gtk.ApplicationWindow.set_help_overlay]. *)

(* Properties *)
