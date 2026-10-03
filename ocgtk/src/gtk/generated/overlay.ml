(* GENERATED CODE - DO NOT EDIT *)
(* Overlay: Overlay *)

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
    position. *)

type t = [ `overlay | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_overlay_new"
(** Create a new Overlay *)

(* Methods *)

external set_measure_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool ->
  unit = "ml_gtk_overlay_set_measure_overlay"
(** Sets whether [widget] is included in the measured size of [overlay].

    The overlay will request the size of the largest child that has this
    property set to [TRUE]. Children who are not included may be drawn outside
    of [overlay]'s allocation if they are too large. *)

external set_clip_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool ->
  unit = "ml_gtk_overlay_set_clip_overlay"
(** Sets whether [widget] should be clipped within the parent. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_overlay_set_child"
(** Sets the child widget of [overlay]. *)

external remove_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_overlay_remove_overlay"
(** Removes an overlay that was added with gtk_overlay_add_overlay(). *)

external get_measure_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_overlay_get_measure_overlay"
(** Gets whether [widget]'s size is included in the measurement of [overlay]. *)

external get_clip_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_overlay_get_clip_overlay"
(** Gets whether [widget] should be clipped within the parent. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_overlay_get_child"
(** Gets the child widget of [overlay]. *)

external add_overlay :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_overlay_add_overlay"
(** Adds [widget] to [overlay].

    The widget will be stacked on top of the main widget added with
    [Gtk.Overlay.set_child].

    The position at which [widget] is placed is determined from its
    [Gtk.Widget:halign] and [Gtk.Widget:valign] properties. *)

(* Properties *)
