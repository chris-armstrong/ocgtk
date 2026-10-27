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
 ]}\n\n\
 Its methods, signals and properties are on \
 {!class-type-application_window_t}. The functions it is built on are in \
 {!Ocgtk.Raw.Application_window}."]

(** The methods, signals and properties of a [GtkApplicationWindow]. *)
class type application_window_t = object
  inherit Application_and__window_and__window_group.window_t
  inherit Ocgio.Action_group.action_group_t
  inherit Ocgio.Action_map.action_map_t
  method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
  method get_id : unit -> int
  method get_show_menubar : unit -> bool
  method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
  method set_show_menubar : bool -> unit
  method as_application_window : Raw.Application_window.t
end

class application_window : Raw.Application_window.t -> application_window_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Application_window.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkApplicationWindow], give one already wrapped. *)

val new_ :
  Application_and__window_and__window_group.application_t ->
  application_window_t
