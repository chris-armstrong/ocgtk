(* GENERATED CODE - DO NOT EDIT *)
(* ApplicationWindow: ApplicationWindow *)

[@@@ocaml.text
"A [GtkWindow] subclass that integrates with [GtkApplication].\n\n\
 Notably, [GtkApplicationWindow] can handle an application menubar.\n\n\
 This class implements the [Gio.ActionGroup] and [Gio.ActionMap]\n\
 interfaces, to let you add window-specific actions that will be exported\n\
 by the associated [Gtk.Application], together with its application-wide\n\
 actions. Window-specific actions are prefixed with the “win.”\n\
 prefix and application-wide actions are prefixed with the “app.”\n\
 prefix. Actions must be addressed with the prefixed name when\n\
 referring to them from a menu model.\n\n\
 Note that widgets that are placed inside a [GtkApplicationWindow]\n\
 can also activate these actions, if they implement the\n\
 [Gtk.Actionable] interface.\n\n\
 The settings [Gtk.Settings:gtk-shell-shows-app-menu] and\n\
 [Gtk.Settings:gtk-shell-shows-menubar] tell GTK whether the\n\
 desktop environment is showing the application menu and menubar\n\
 models outside the application as part of the desktop shell.\n\
 For instance, on OS X, both menus will be displayed remotely;\n\
 on Windows neither will be.\n\n\
 If the desktop environment does not display the menubar, it can be shown in\n\
 the [GtkApplicationWindow] by setting the\n\
 [Gtk.ApplicationWindow:show-menubar] property to true. If the\n\
 desktop environment does not display the application menu, then it will\n\
 automatically be included in the menubar or in the window’s client-side\n\
 decorations.\n\n\
 See [Gtk.PopoverMenu] for information about the XML language\n\
 used by [GtkBuilder] for menu models.\n\n\
 See also: [Gtk.Application.set_menubar].\n\n\
 {b A GtkApplicationWindow with a menubar}\n\n\
 The code sample below shows how to set up a [GtkApplicationWindow]\n\
 with a menu bar defined on the [Gtk.Application]:\n\n\
 {[\n\
 GtkApplication *app = gtk_application_new (\"org.gtk.test\", 0);\n\n\
 GtkBuilder *builder = gtk_builder_new_from_string (\n\
\    \"<interface>\"\n\
\    \"  <menu id='menubar'>\"\n\
\    \"    <submenu>\"\n\
\    \"      <attribute name='label' translatable='yes'>_Edit</attribute>\"\n\
\    \"      <item>\"\n\
\    \"        <attribute name='label' translatable='yes'>_Copy</attribute>\"\n\
\    \"        <attribute name='action'>win.copy</attribute>\"\n\
\    \"      </item>\"\n\
\    \"      <item>\"\n\
\    \"        <attribute name='label' translatable='yes'>_Paste</attribute>\"\n\
\    \"        <attribute name='action'>win.paste</attribute>\"\n\
\    \"      </item>\"\n\
\    \"    </submenu>\"\n\
\    \"  </menu>\"\n\
\    \"</interface>\",\n\
\    -1);\n\n\
 GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder, \
 \"menubar\"));\n\
 gtk_application_set_menubar (GTK_APPLICATION (app), menubar);\n\
 g_object_unref (builder);\n\n\
 // ...\n\n\
 GtkWidget *window = gtk_application_window_new (app);\n\
 ]}"]

type t =
  [ `application_window | `window | `widget | `initially_unowned | `object_ ]
  Gobject.obj

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
