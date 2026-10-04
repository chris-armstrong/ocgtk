(* GENERATED CODE - DO NOT EDIT *)
(* HeaderBar: HeaderBar *)

[@@@ocaml.text
"Creates a custom titlebar for a window.\n\n\
 An example GtkHeaderBar\n\n\
 [GtkHeaderBar] is similar to a horizontal [GtkCenterBox]. It allows\n\
 children to be placed at the start or the end. In addition, it allows\n\
 the window title to be displayed. The title will be centered with respect\n\
 to the width of the box, even if the children at either side take up\n\
 different amounts of space.\n\n\
 [GtkHeaderBar] can add typical window frame controls, such as minimize,\n\
 maximize and close buttons, or the window icon.\n\n\
 For these reasons, [GtkHeaderBar] is the natural choice for use as the\n\
 custom titlebar widget of a [GtkWindow] (see [Gtk.Window.set_titlebar]),\n\
 as it gives features typical of titlebars while allowing the addition of\n\
 child widgets.\n\n\
 {b GtkHeaderBar as GtkBuildable}\n\n\
 The [GtkHeaderBar] implementation of the [GtkBuildable] interface supports\n\
 adding children at the start or end sides by specifying “start” or “end” as\n\
 the “type” attribute of a [<child>] element, or setting the title widget by\n\
 specifying “title” value.\n\n\
 By default the [GtkHeaderBar] uses a [GtkLabel] displaying the title of the\n\
 window it is contained in as the title widget, equivalent to the following\n\
 UI definition:\n\n\
 {[\n\
 <object class=\"GtkHeaderBar\">\n\
\  <property name=\"title-widget\">\n\
\    <object class=\"GtkLabel\">\n\
\      <property name=\"label\" translatable=\"yes\">Label</property>\n\
\      <property name=\"single-line-mode\">True</property>\n\
\      <property name=\"ellipsize\">end</property>\n\
\      <property name=\"width-chars\">5</property>\n\
\      <style>\n\
\        <class name=\"title\"/>\n\
\      </style>\n\
\    </object>\n\
\  </property>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 headerbar\n\
 ╰── windowhandle\n\
\    ╰── box\n\
\        ├── box.start\n\
\        │   ├── windowcontrols.start\n\
\        │   ╰── [other children]\n\
\        ├── [Title Widget]\n\
\        ╰── box.end\n\
\            ├── [other children]\n\
\            ╰── windowcontrols.end\n\
 ]}\n\n\
 A [GtkHeaderBar]'s CSS node is called [headerbar]. It contains a [windowhandle]\n\
 subnode, which contains a [box] subnode, which contains two [box] subnodes at\n\
 the start and end of the header bar, as well as a center node that represents\n\
 the title.\n\n\
 Each of the boxes contains a [windowcontrols] subnode, see\n\
 [Gtk.WindowControls] for details, as well as other children.\n\n\
 {b Accessibility}\n\n\
 [GtkHeaderBar] uses the [Gtk.AccessibleRole.group] role."]

type t = [ `header_bar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_header_bar_new"
(** Create a new HeaderBar *)

(* Methods *)
external set_use_native_controls : t -> bool -> unit
  = "ml_gtk_header_bar_set_use_native_controls"
[@@ocaml.doc
  "Sets whether this header bar shows native window controls.\n\n\
   This option shows the \"stoplight\" buttons on macOS.\n\
   For Linux, this option has no effect.\n\n\
   See also Using GTK on Apple macOS."]

external set_title_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_header_bar_set_title_widget"
(** Sets the title for the header bar.

    When set to [NULL], the headerbar will display the title of the window it is
    contained in.

    The title should help a user identify the current view. To achieve the same
    style as the builtin title, use the “title” style class.

    You should set the title widget to [NULL], for the window title label to be
    visible again. *)

external set_show_title_buttons : t -> bool -> unit
  = "ml_gtk_header_bar_set_show_title_buttons"
(** Sets whether this header bar shows the standard window title buttons. *)

external set_decoration_layout : t -> string option -> unit
  = "ml_gtk_header_bar_set_decoration_layout"
(** Sets the decoration layout for this header bar.

    This property overrides the [Gtk.Settings:gtk-decoration-layout] setting.

    There can be valid reasons for overriding the setting, such as a header bar
    design that does not allow for buttons to take room on the right, or only
    offers room for a single close button. Split header bars are another example
    for overriding the setting.

    The format of the string is button names, separated by commas. A colon
    separates the buttons that should appear on the left from those on the
    right. Recognized button names are minimize, maximize, close and icon (the
    window icon).

    For example, “icon:minimize,maximize,close” specifies an icon on the left,
    and minimize, maximize and close buttons on the right. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_header_bar_remove"
(** Removes a child from the header bar.

    The child must have been added with [Gtk.HeaderBar.pack_start],
    [Gtk.HeaderBar.pack_end] or [Gtk.HeaderBar.set_title_widget]. *)

external pack_start :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_header_bar_pack_start"
(** Adds a child to the header bar, packed with reference to the start. *)

external pack_end :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_header_bar_pack_end"
(** Adds a child to the header bar, packed with reference to the end. *)

external get_use_native_controls : t -> bool
  = "ml_gtk_header_bar_get_use_native_controls"
(** Returns whether this header bar shows platform native window controls. *)

external get_title_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_header_bar_get_title_widget"
(** Retrieves the title widget of the header bar.

    See [Gtk.HeaderBar.set_title_widget]. *)

external get_show_title_buttons : t -> bool
  = "ml_gtk_header_bar_get_show_title_buttons"
(** Returns whether this header bar shows the standard window title buttons. *)

external get_decoration_layout : t -> string option
  = "ml_gtk_header_bar_get_decoration_layout"
(** Gets the decoration layout of the header bar. *)

(* Properties *)
