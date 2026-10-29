(** Places “overlay” widgets on top of a single main child.

    Its methods, signals and properties are on {!class-type-overlay_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Overlay}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Overlay].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Places “overlay” widgets on top of a single main child.

    An example GtkOverlay

    The position of each overlay widget is determined by its
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]}
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties. E.g. a widget with both alignments set to
    {{!Ocgtk.Enums.type-align.constructor-START}[GTK_ALIGN_START]} will be
    placed at the top left corner of the [GtkOverlay] container, whereas an
    overlay with halign set to
    {{!Ocgtk.Enums.type-align.constructor-CENTER}[GTK_ALIGN_CENTER]} and valign
    set to {{!Ocgtk.Enums.type-align.constructor-END}[GTK_ALIGN_END]} will be
    placed a the bottom edge of the [GtkOverlay], horizontally centered. The
    position can be adjusted by setting the margin properties of the child to
    non-zero values.

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
class type overlay_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method add_overlay : Widget.widget_t -> unit
  (** Adds [widget] to [overlay].

      The widget will be stacked on top of the main widget added with
      [Gtk.Overlay.set_child].

      The position at which [widget] is placed is determined from its
      [Gtk.Widget:halign] and [Gtk.Widget:valign] properties. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [overlay]. *)

  method get_clip_overlay : Widget.widget_t -> bool
  (** Gets whether [widget] should be clipped within the parent. *)

  method get_measure_overlay : Widget.widget_t -> bool
  (** Gets whether [widget]'s size is included in the measurement of [overlay].
  *)

  method remove_overlay : Widget.widget_t -> unit
  (** Removes an overlay that was added with [gtk_overlay_add_overlay ()]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [overlay]. *)

  method set_clip_overlay : Widget.widget_t -> bool -> unit
  (** Sets whether [widget] should be clipped within the parent. *)

  method set_measure_overlay : Widget.widget_t -> bool -> unit
  (** Sets whether [widget] is included in the measured size of [overlay].

      The overlay will request the size of the largest child that has this
      property set to [true]. Children who are not included may be drawn outside
      of [overlay]'s allocation if they are too large. *)

  (** {2:conversions Conversions} *)

  method as_overlay : Raw.Overlay.t
end

class overlay : Raw.Overlay.t -> overlay_t
(** Wraps a raw handle of {!Ocgtk.Raw.Overlay.t}. *)

(** {1:description Description}

    Places “overlay” widgets on top of a single main child.

    An example GtkOverlay

    The position of each overlay widget is determined by its
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]}
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties. E.g. a widget with both alignments set to
    {{!Ocgtk.Enums.type-align.constructor-START}[GTK_ALIGN_START]} will be
    placed at the top left corner of the [GtkOverlay] container, whereas an
    overlay with halign set to
    {{!Ocgtk.Enums.type-align.constructor-CENTER}[GTK_ALIGN_CENTER]} and valign
    set to {{!Ocgtk.Enums.type-align.constructor-END}[GTK_ALIGN_END]} will be
    placed a the bottom edge of the [GtkOverlay], horizontally centered. The
    position can be adjusted by setting the margin properties of the child to
    non-zero values.

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

(** {1:constructors Constructors} *)

val new_ : unit -> overlay_t
(** Creates a new [GtkOverlay]. *)
