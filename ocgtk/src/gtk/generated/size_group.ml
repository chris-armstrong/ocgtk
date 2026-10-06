(* GENERATED CODE - DO NOT EDIT *)
(* SizeGroup: SizeGroup *)

[@@@ocaml.text
"Groups widgets together so they all request the same size.\n\n\
 This is typically useful when you want a column of widgets to have\n\
 the same size, but you can’t use a [Gtk.Grid] or [Gtk.Box].\n\n\
 In detail, the size requested for each widget in a [GtkSizeGroup] is\n\
 the maximum of the sizes that would have been requested for each\n\
 widget in the size group if they were not in the size group. The\n\
 \\[mode\\][Gtk.SizeGroup.set_mode] of the size group determines\n\
 whether this applies to the horizontal size, the vertical size, or\n\
 both sizes.\n\n\
 Note that size groups only affect the amount of space requested, not\n\
 the size that the widgets finally receive. If you want the widgets in\n\
 a [GtkSizeGroup] to actually be the same size, you need to pack them in\n\
 such a way that they get the size they request and not more. In\n\
 particular it doesn't make a lot of sense to set\n\
 \\[the expand flags\\][Gtk.Widget.set_hexpand] on the widgets that\n\
 are members of a size group.\n\n\
 [GtkSizeGroup] objects are referenced by each widget in the size group,\n\
 so once you have added all widgets to a [GtkSizeGroup], you can drop\n\
 the initial reference to the size group with\n\
 [GObject.Object.unref]. If the widgets in the size group are\n\
 subsequently destroyed, then they will be removed from the size group\n\
 and drop their references on the size group; when all widgets have been\n\
 removed, the size group will be freed.\n\n\
 Widgets can be part of multiple size groups; GTK will compute the\n\
 horizontal size of a widget from the horizontal requisition of all widgets\n\
 that can be reached from the widget by a chain of size groups with mode\n\
 [Gtk.SizeGroupMode.HORIZONTAL] or [Gtk.SizeGroupMode.BOTH], and\n\
 the vertical size from the vertical requisition of all widgets that can be\n\
 reached from the widget by a chain of size groups with mode\n\
 [Gtk.SizeGroupMode.VERTICAL] or [Gtk.SizeGroupMode.BOTH].\n\n\
 {b Size groups and trading height-for-width}\n\n\
 Generally, size groups don't interact well with widgets that\n\
 trade height for width (or width for height), such as wrappable\n\
 labels. Avoid using size groups with such widgets.\n\n\
 A size group with mode [Gtk.SizeGroupMode.HORIZONTAL] or\n\
 [Gtk.SizeGroupMode.VERTICAL] only consults non-contextual sizes\n\
 of widgets other than the one being measured, since it has no\n\
 knowledge of what size a widget will get allocated in the other\n\
 orientation. This can lead to widgets in a group actually requesting\n\
 different contextual sizes, contrary to the purpose of\n\
 [GtkSizeGroup].\n\n\
 In contrast, a size group with mode [Gtk.SizeGroupMode.BOTH] can\n\
 properly propagate the available size in the opposite orientation\n\
 when measuring widgets in the group, which results in consistent and\n\
 accurate measurements.\n\n\
 In case some mechanism other than a size group is already used to\n\
 ensure that widgets in a group all get the same size in one\n\
 orientation (for example, some common ancestor is known to allocate\n\
 the same width to all its children), and the size group is only\n\
 really needed to also make the widgets request the same size in the\n\
 other orientation, it is beneficial to still set the group's mode to\n\
 [Gtk.SizeGroupMode.BOTH]. This lets the group assume and count\n\
 on sizes of the widgets in the former orientation being the same,\n\
 which enables it to propagate the available size as described above.\n\n\
 {b Alternatives to size groups}\n\n\
 Size groups have many limitations, such as only influencing size\n\
 requests but not allocations, and poor height-for-width support. When\n\
 possible, prefer using dedicated mechanisms that can properly ensure\n\
 that the widgets get the same size.\n\n\
 Various container widgets and layout managers support a homogeneous\n\
 layout mode, where they will explicitly give the same size to their\n\
 children (see [Gtk.Box:homogeneous]). Using homogeneous mode\n\
 can also have large performance benefits compared to either the same\n\
 container in non-homogeneous mode, or to size groups.\n\n\
 [Gtk.Grid] can be used to position widgets into rows and\n\
 columns. Members of each column will have the same width among them;\n\
 likewise, members of each row will have the same height. On top of\n\
 that, the heights can be made equal between all rows with\n\
 [Gtk.Grid:row-homogeneous], and the widths can be made equal\n\
 between all columns with [Gtk.Grid:column-homogeneous].\n\n\
 {b GtkSizeGroup as GtkBuildable}\n\n\
 Size groups can be specified in a UI definition by placing an [<object>]\n\
 element with [class=\"GtkSizeGroup\"] somewhere in the UI definition. The\n\
 widgets that belong to the size group are specified by a [<widgets>] element\n\
 that may contain multiple [<widget>] elements, one for each member of the\n\
 size group. The ”name” attribute gives the id of the widget.\n\n\
 An example of a UI definition fragment with [GtkSizeGroup]:\n\n\
 {[\n\
 <object class=\"GtkSizeGroup\">\n\
\  <property name=\"mode\">horizontal</property>\n\
\  <widgets>\n\
\    <widget name=\"radio1\"/>\n\
\    <widget name=\"radio2\"/>\n\
\  </widgets>\n\
 </object>\n\
 ]}"]

type t = [ `size_group | `object_ ] Gobject.obj

external new_ : Gtk_enums.sizegroupmode -> t = "ml_gtk_size_group_new"
(** Create a new SizeGroup *)

(* Methods *)

external set_mode : t -> Gtk_enums.sizegroupmode -> unit
  = "ml_gtk_size_group_set_mode"
(** Sets the [GtkSizeGroupMode] of the size group.

    The mode of the size group determines whether the widgets in the size group
    should all have the same horizontal requisition
    ([GTK_SIZE_GROUP_HORIZONTAL]) all have the same vertical requisition
    ([GTK_SIZE_GROUP_VERTICAL]), or should all have the same requisition in both
    directions ([GTK_SIZE_GROUP_BOTH]). *)

external remove_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_size_group_remove_widget"
(** Removes a widget from a [GtkSizeGroup]. *)

external get_widgets :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  list = "ml_gtk_size_group_get_widgets"
(** Returns the list of widgets associated with [size_group]. *)

external get_mode : t -> Gtk_enums.sizegroupmode = "ml_gtk_size_group_get_mode"
(** Gets the current mode of the size group. *)

external add_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_size_group_add_widget"
(** Adds a widget to a [GtkSizeGroup].

    In the future, the requisition of the widget will be determined as the
    maximum of its requisition and the requisition of the other widgets in the
    size group. Whether this applies horizontally, vertically, or in both
    directions depends on the mode of the size group. See
    [Gtk.SizeGroup.set_mode].

    When the widget is destroyed or no longer referenced elsewhere, it will be
    removed from the size group. *)

(* Properties *)
