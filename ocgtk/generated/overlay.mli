(** Places “overlay” widgets on top of a single main child.

    An example GtkOverlay

    The position of each overlay widget is determined by its [Gtk.Widget:halign]
    and [Gtk.Widget:valign] properties. E.g. a widget with both alignments set
    to [GTK_ALIGN_START] will be placed at the top left corner of the
    [GtkOverlay] container, whereas an overlay with halign set to
    [GTK_ALIGN_CENTER] and valign set to [GTK_ALIGN_END] will be placed a the
    bottom edge of the [GtkOverlay], horizontally centered. The position can be
    adjusted by setting the margin properties of the child to non-zero values.

    More complicated placement of overlays is possible by connecting to the
    [Gtk.Overlay::get-child-position] signal.

    An overlay’s minimum and natural sizes are those of its main child. The
    sizes of overlay children are not considered when measuring these preferred
    sizes.

    {b GtkOverlay as GtkBuildable}

    The [GtkOverlay] implementation of the [GtkBuildable] interface supports
    placing a child as an overlay by specifying “overlay” as the “type”
    attribute of a [<child>] element.

    {b CSS nodes}

    [GtkOverlay] has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style
    classes “.left”, “.right”, “.top”, and/or “.bottom” according to their
    position.

    Its methods, signals and properties are on {!class-type-overlay_t}. The
    functions it is built on are in {!Ocgtk.Raw.Overlay}. *)

(** The methods, signals and properties of a [GtkOverlay]. *)
class type overlay_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_clip_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method get_measure_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method remove_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_clip_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method set_measure_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method as_overlay : Raw.Overlay.t
end

class overlay : Raw.Overlay.t -> overlay_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Overlay.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkOverlay], give one already wrapped. *)

val new_ : unit -> overlay_t
