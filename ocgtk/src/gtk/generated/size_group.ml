(* GENERATED CODE - DO NOT EDIT *)
(* SizeGroup: SizeGroup *)

type t = [ `size_group | `object_ ] Gobject.obj
(** Groups widgets together so they all request the same size.

    This is typically useful when you want a column of widgets to have the same
    size, but you can’t use a [Gtk.Grid] or [Gtk.Box].

    In detail, the size requested for each widget in a [GtkSizeGroup] is the
    maximum of the sizes that would have been requested for each widget in the
    size group if they were not in the size group. The
    \[mode\][Gtk.SizeGroup.set_mode] of the size group determines whether this
    applies to the horizontal size, the vertical size, or both sizes.

    Note that size groups only affect the amount of space requested, not the
    size that the widgets finally receive. If you want the widgets in a
    [GtkSizeGroup] to actually be the same size, you need to pack them in such a
    way that they get the size they request and not more. In particular it
    doesn't make a lot of sense to set \[the expand
    flags\][Gtk.Widget.set_hexpand] on the widgets that are members of a size
    group.

    [GtkSizeGroup] objects are referenced by each widget in the size group, so
    once you have added all widgets to a [GtkSizeGroup], you can drop the
    initial reference to the size group with [GObject.Object.unref]. If the
    widgets in the size group are subsequently destroyed, then they will be
    removed from the size group and drop their references on the size group;
    when all widgets have been removed, the size group will be freed.

    Widgets can be part of multiple size groups; GTK will compute the horizontal
    size of a widget from the horizontal requisition of all widgets that can be
    reached from the widget by a chain of size groups with mode
    [Gtk.SizeGroupMode.HORIZONTAL] or [Gtk.SizeGroupMode.BOTH], and the vertical
    size from the vertical requisition of all widgets that can be reached from
    the widget by a chain of size groups with mode [Gtk.SizeGroupMode.VERTICAL]
    or [Gtk.SizeGroupMode.BOTH].

    {b Size groups and trading height-for-width}

    Generally, size groups don't interact well with widgets that trade height
    for width (or width for height), such as wrappable labels. Avoid using size
    groups with such widgets.

    A size group with mode [Gtk.SizeGroupMode.HORIZONTAL] or
    [Gtk.SizeGroupMode.VERTICAL] only consults non-contextual sizes of widgets
    other than the one being measured, since it has no knowledge of what size a
    widget will get allocated in the other orientation. This can lead to widgets
    in a group actually requesting different contextual sizes, contrary to the
    purpose of [GtkSizeGroup].

    In contrast, a size group with mode [Gtk.SizeGroupMode.BOTH] can properly
    propagate the available size in the opposite orientation when measuring
    widgets in the group, which results in consistent and accurate measurements.

    In case some mechanism other than a size group is already used to ensure
    that widgets in a group all get the same size in one orientation (for
    example, some common ancestor is known to allocate the same width to all its
    children), and the size group is only really needed to also make the widgets
    request the same size in the other orientation, it is beneficial to still
    set the group's mode to [Gtk.SizeGroupMode.BOTH]. This lets the group assume
    and count on sizes of the widgets in the former orientation being the same,
    which enables it to propagate the available size as described above.

    {b Alternatives to size groups}

    Size groups have many limitations, such as only influencing size requests
    but not allocations, and poor height-for-width support. When possible,
    prefer using dedicated mechanisms that can properly ensure that the widgets
    get the same size.

    Various container widgets and layout managers support a homogeneous layout
    mode, where they will explicitly give the same size to their children (see
    [Gtk.Box:homogeneous]). Using homogeneous mode can also have large
    performance benefits compared to either the same container in
    non-homogeneous mode, or to size groups.

    [Gtk.Grid] can be used to position widgets into rows and columns. Members of
    each column will have the same width among them; likewise, members of each
    row will have the same height. On top of that, the heights can be made equal
    between all rows with [Gtk.Grid:row-homogeneous], and the widths can be made
    equal between all columns with [Gtk.Grid:column-homogeneous].

    {b GtkSizeGroup as GtkBuildable}

    Size groups can be specified in a UI definition by placing an [<object>]
    element with [class=”GtkSizeGroup”] somewhere in the UI definition. The
    widgets that belong to the size group are specified by a [<widgets>] element
    that may contain multiple [<widget>] elements, one for each member of the
    size group. The ”name” attribute gives the id of the widget.

    An example of a UI definition fragment with [GtkSizeGroup]:

    {[
    <object class=”GtkSizeGroup”>
      <property name=”mode”>horizontal</property>
      <widgets>
        <widget name=”radio1”/>
        <widget name=”radio2”/>
      </widgets>
    </object>
    ]} *)

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
