(** A [GtkWindow] subclass that integrates with [GtkApplication].

    Its methods, signals and properties are on
    {!class-type-application_window_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Application_window}. *)

(** {1:class Class} *)

class type application_window_t = object
  inherit Window.window_t
  inherit Ocgio.Action_group.action_group_t
  inherit Ocgio.Action_map.action_map_t

  (** {2:methods Methods} *)

  method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
  (** Gets the [GtkShortcutsWindow] that is associated with [window].

      See [Gtk.ApplicationWindow.set_help_overlay]. *)

  method get_id : unit -> int
  (** Returns the unique ID of the window.

      If the window has not yet been added to a [GtkApplication], returns [0].
  *)

  method get_show_menubar : unit -> bool
  (** Returns whether the window will display a menubar for the app menu and
      menubar as needed. *)

  method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
  (** Associates a shortcuts window with the application window.

      Additionally, sets up an action with the name [win.show-help-overlay] to
      present it.

      The window takes responsibility for destroying the help overlay. *)

  method set_show_menubar : bool -> unit
  (** Sets whether the window will display a menubar for the app menu and
      menubar as needed. *)

  (** {2:conversions Conversions} *)

  method as_application_window : Raw.Application_window.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [ApplicationWindow].}\n\n\
     Inherits from: {{!Ocgtk.Window.class-type-window_t}Ocgtk.Window}\n\n\
     Implements:\n\
     - {{!Ocgio.Action_group.class-type-action_group_t}Ocgio.Action_group}\n\
     - {{!Ocgio.Action_map.class-type-action_map_t}Ocgio.Action_map}\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\
     - {{!Ocgtk.Native.class-type-native_t}Ocgtk.Native}\n\
     - {{!Ocgtk.Root.class-type-root_t}Ocgtk.Root}\n\
     - \
     {{!Ocgtk.Shortcut_manager.class-type-shortcut_manager_t}Ocgtk.Shortcut_manager}\n\n\
     A [GtkWindow] subclass that integrates with [GtkApplication].\n\n\
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
    \    \"        <attribute name='label' \
     translatable='yes'>_Copy</attribute>\"\n\
    \    \"        <attribute name='action'>win.copy</attribute>\"\n\
    \    \"      </item>\"\n\
    \    \"      <item>\"\n\
    \    \"        <attribute name='label' \
     translatable='yes'>_Paste</attribute>\"\n\
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

class application_window : Raw.Application_window.t -> application_window_t
(** Wraps a raw handle of {!Ocgtk.Raw.Application_window.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 A [GtkWindow] subclass that integrates with [GtkApplication].\n\n\
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

(** {1:constructors Constructors} *)

val new_ : Application.application_t -> application_window_t
(** Creates a new [GtkApplicationWindow]. *)
