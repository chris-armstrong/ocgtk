(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Application from cyclic group Application_and__window_and__window_group *)

[@@@ocaml.text
"A high-level API for writing applications.\n\n\
 [GtkApplication] supports many aspects of writing a GTK application\n\
 in a convenient fashion, without enforcing a one-size-fits-all model.\n\n\
 Currently, it handles GTK initialization, application uniqueness, session\n\
 management, provides some basic scriptability and desktop shell integration\n\
 by exporting actions and menus and manages a list of toplevel windows whose\n\
 life-cycle is automatically tied to the life-cycle of your application.\n\n\
 While [GtkApplication] works fine with plain [Gtk.Window]s,\n\
 it is recommended to use it together with [Gtk.ApplicationWindow].\n\n\
 {b Automatic resources}\n\n\
 [GtkApplication] will automatically load menus from the [GtkBuilder]\n\
 resource located at \"gtk/menus.ui\", relative to the application's\n\
 resource base path (see [Gio.Application.set_resource_base_path]).\n\
 The menu with the ID \"menubar\" is taken as the application's\n\
 menubar. Additional menus (most interesting submenus) can be named\n\
 and accessed via [Gtk.Application.get_menu_by_id] which allows for\n\
 dynamic population of a part of the menu structure.\n\n\
 Note that automatic resource loading uses the resource base path\n\
 that is set at construction time and will not work if the resource\n\
 base path is changed at a later time.\n\n\
 It is also possible to provide the menubar manually using\n\
 [Gtk.Application.set_menubar].\n\n\
 [GtkApplication] will also automatically setup an icon search path for\n\
 the default icon theme by appending \"icons\" to the resource base\n\
 path. This allows your application to easily store its icons as\n\
 resources. See [Gtk.IconTheme.add_resource_path] for more\n\
 information.\n\n\
 If there is a resource located at [gtk/help-overlay.ui] which\n\
 defines a [Gtk.ShortcutsWindow] with ID [help_overlay] then\n\
 [GtkApplication] associates an instance of this shortcuts window with\n\
 each [Gtk.ApplicationWindow] and sets up the keyboard accelerator\n\
 <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that\n\
 displays the shortcuts window, associate the item with the action\n\
 [win.show-help-overlay].\n\n\
 [GtkApplication] will also automatically set the application id as the\n\
 default window icon. Use [Gtk.Window.set_default_icon_name] or\n\
 [Gtk.Window:icon-name] to override that behavior.\n\n\
 {b A simple application}\n\n\
 {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c}A \
 simple example}\n\
 is available in the GTK source code repository\n\n\
 [GtkApplication] registers with a session manager if possible and\n\
 offers various functionality related to the session life-cycle.\n\n\
 An application can block various ways to end the session with\n\
 the [Gtk.Application.inhibit] function. Typical use cases for\n\
 this kind of inhibiting are long-running, uninterruptible operations,\n\
 such as burning a CD or performing a disk backup. The session\n\
 manager may not honor the inhibitor, but it can be expected to\n\
 inform the user about the negative consequences of ending the\n\
 session while inhibitors are present.\n\n\
 {b See Also}\n\n\
 - \
 {{:https://developer.gnome.org/documentation/tutorials/application.html}Using \
 GtkApplication}\n\
 - Getting Started with GTK: Basics\n\n\
 Its methods, signals and properties are on {!class-type-application_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Application}."]

class type application_t =
  Application_and__window_and__window_group.application_t
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Application].}\n\n\
     A high-level API for writing applications.\n\n\
     [GtkApplication] supports many aspects of writing a GTK application\n\
     in a convenient fashion, without enforcing a one-size-fits-all model.\n\n\
     Currently, it handles GTK initialization, application uniqueness, session\n\
     management, provides some basic scriptability and desktop shell integration\n\
     by exporting actions and menus and manages a list of toplevel windows whose\n\
     life-cycle is automatically tied to the life-cycle of your application.\n\n\
     While [GtkApplication] works fine with plain [Gtk.Window]s,\n\
     it is recommended to use it together with [Gtk.ApplicationWindow].\n\n\
     {b Automatic resources}\n\n\
     [GtkApplication] will automatically load menus from the [GtkBuilder]\n\
     resource located at \"gtk/menus.ui\", relative to the application's\n\
     resource base path (see [Gio.Application.set_resource_base_path]).\n\
     The menu with the ID \"menubar\" is taken as the application's\n\
     menubar. Additional menus (most interesting submenus) can be named\n\
     and accessed via [Gtk.Application.get_menu_by_id] which allows for\n\
     dynamic population of a part of the menu structure.\n\n\
     Note that automatic resource loading uses the resource base path\n\
     that is set at construction time and will not work if the resource\n\
     base path is changed at a later time.\n\n\
     It is also possible to provide the menubar manually using\n\
     [Gtk.Application.set_menubar].\n\n\
     [GtkApplication] will also automatically setup an icon search path for\n\
     the default icon theme by appending \"icons\" to the resource base\n\
     path. This allows your application to easily store its icons as\n\
     resources. See [Gtk.IconTheme.add_resource_path] for more\n\
     information.\n\n\
     If there is a resource located at [gtk/help-overlay.ui] which\n\
     defines a [Gtk.ShortcutsWindow] with ID [help_overlay] then\n\
     [GtkApplication] associates an instance of this shortcuts window with\n\
     each [Gtk.ApplicationWindow] and sets up the keyboard accelerator\n\
     <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that\n\
     displays the shortcuts window, associate the item with the action\n\
     [win.show-help-overlay].\n\n\
     [GtkApplication] will also automatically set the application id as the\n\
     default window icon. Use [Gtk.Window.set_default_icon_name] or\n\
     [Gtk.Window:icon-name] to override that behavior.\n\n\
     {b A simple application}\n\n\
     {{:https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c}A \
     simple example}\n\
     is available in the GTK source code repository\n\n\
     [GtkApplication] registers with a session manager if possible and\n\
     offers various functionality related to the session life-cycle.\n\n\
     An application can block various ways to end the session with\n\
     the [Gtk.Application.inhibit] function. Typical use cases for\n\
     this kind of inhibiting are long-running, uninterruptible operations,\n\
     such as burning a CD or performing a disk backup. The session\n\
     manager may not honor the inhibitor, but it can be expected to\n\
     inform the user about the negative consequences of ending the\n\
     session while inhibitors are present.\n\n\
     {b See Also}\n\n\
     - \
     {{:https://developer.gnome.org/documentation/tutorials/application.html}Using \
     GtkApplication}\n\
     - Getting Started with GTK: Basics"]

class application : Raw.Application.t -> application_t
(** Wraps a raw handle of {!Ocgtk.Raw.Application.t}. *)

(** {2:constructors Constructors} *)

val new_ : string option -> Ocgio.Enums.applicationflags -> application_t
(** Creates a new application instance.

    When using [GtkApplication], it is not necessary to call [Gtk.init]
    manually. It is called as soon as the application gets registered as the
    primary instance.

    Concretely, [Gtk.init] is called in the default handler for the
    [GApplication::startup] signal. Therefore, [GtkApplication] subclasses
    should always chain up in their [GIO.Application.startup] handler before
    using any GTK API.

    Note that commandline arguments are not passed to [Gtk.init].

    If [application_id] is not [NULL], then it must be valid. See
    [Gio.Application.id_is_valid].

    If no application ID is given then some features (most notably application
    uniqueness) will be disabled. *)
