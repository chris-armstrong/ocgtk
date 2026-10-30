(* GENERATED CODE - DO NOT EDIT *)
(* CellRenderer: CellRenderer *)

(** An object for rendering a single cell

    The [GtkCellRenderer] is a base class of a set of objects used for rendering
    a cell to a [cairo_t]. These objects are used primarily by the [GtkTreeView]
    widget, though they aren’t tied to them in any specific way. It is worth
    noting that [GtkCellRenderer] is not a [GtkWidget] and cannot be treated as
    such.

    The primary use of a [GtkCellRenderer] is for drawing a certain graphical
    elements on a [cairo_t]. Typically, one cell renderer is used to draw many
    cells on the screen. To this extent, it isn’t expected that a CellRenderer
    keep any permanent state around. Instead, any state is set just prior to use
    using [GObject]s property system. Then, the cell is measured using
    {{!Ocgtk.Raw.Cell_renderer.val-get_preferred_size}[gtk_cell_renderer_get_preferred_size
                                                       ()]}. Finally, the cell
    is rendered in the correct location using
    {{!Ocgtk.Raw.Cell_renderer.val-snapshot}[gtk_cell_renderer_snapshot ()]}.

    There are a number of rules that must be followed when writing a new
    [GtkCellRenderer]. First and foremost, it’s important that a certain set of
    properties will always yield a cell renderer of the same size, barring a
    style change. The [GtkCellRenderer] also has a number of generic properties
    that are expected to be honored by all children.

    Beyond merely rendering a cell, cell renderers can optionally provide active
    user interface elements. A cell renderer can be “activatable” like
    [GtkCellRenderer]Toggle, which toggles when it gets activated by a mouse
    click, or it can be “editable” like [GtkCellRenderer]Text, which allows the
    user to edit the text using a widget implementing the [GtkCellEditable]
    interface, e.g. [GtkEntry]. To make a cell renderer activatable or editable,
    you have to implement the [GtkCellRenderer]Class.activate or
    [GtkCellRenderer]Class.start_editing virtual functions, respectively.

    Many properties of [GtkCellRenderer] and its subclasses have a corresponding
    “set” property, e.g. “cell-background-set” corresponds to “cell-background”.
    These “set” properties reflect whether a property has been set or not. You
    should not set them independently.

    The class built on this module is in {!Ocgtk.Cell_renderer}. *)

type t = [ `cell_renderer | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_get_type"

(* Methods *)

external stop_editing : t -> bool -> unit = "ml_gtk_cell_renderer_stop_editing"
(** Informs the cell renderer that the editing is stopped. If [canceled] is
    [true], the cell renderer will emit the [GtkCellRenderer]::editing-canceled
    signal.

    This function should be called by cell renderer implementations in response
    to the [GtkCellEditable::editing-done] signal of [GtkCellEditable]. *)

external start_editing :
  t ->
  Ocgdk_raw.Event.t option ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string ->
  Ocgdk_raw.Rectangle.t ->
  Ocgdk_raw.Rectangle.t ->
  Ocgtk_enums.cellrendererstate ->
  Cell_editable.t option
  = "ml_gtk_cell_renderer_start_editing_bytecode"
    "ml_gtk_cell_renderer_start_editing_native"
(** Starts editing the contents of this [cell], through a new [GtkCellEditable]
    widget created by the [GtkCellRenderer]Class.start_editing virtual function.
*)

external snapshot :
  t ->
  Snapshot.t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Ocgdk_raw.Rectangle.t ->
  Ocgdk_raw.Rectangle.t ->
  Ocgtk_enums.cellrendererstate ->
  unit
  = "ml_gtk_cell_renderer_snapshot_bytecode"
    "ml_gtk_cell_renderer_snapshot_native"
(** Invokes the virtual render function of the [GtkCellRenderer]. The three
    passed-in rectangles are areas in [cr]. Most renderers will draw within
    [cell_area]; the xalign, yalign, xpad, and ypad fields of the
    [GtkCellRenderer] should be honored with respect to [cell_area].
    [background_area] includes the blank space around the cell, and also the
    area containing the tree expander; so the [background_area] rectangles for
    all cells tile to cover the entire [window]. *)

external set_visible : t -> bool -> unit = "ml_gtk_cell_renderer_set_visible"
(** Sets the cell renderer’s visibility. *)

external set_sensitive : t -> bool -> unit
  = "ml_gtk_cell_renderer_set_sensitive"
(** Sets the cell renderer’s sensitivity. *)

external set_padding : t -> int -> int -> unit
  = "ml_gtk_cell_renderer_set_padding"
(** Sets the renderer’s padding. *)

external set_is_expander : t -> bool -> unit
  = "ml_gtk_cell_renderer_set_is_expander"
(** Sets whether the given [GtkCellRenderer] is an expander. *)

external set_is_expanded : t -> bool -> unit
  = "ml_gtk_cell_renderer_set_is_expanded"
(** Sets whether the given [GtkCellRenderer] is expanded. *)

external set_fixed_size : t -> int -> int -> unit
  = "ml_gtk_cell_renderer_set_fixed_size"
(** Sets the renderer size to be explicit, independent of the properties set. *)

external set_alignment : t -> float -> float -> unit
  = "ml_gtk_cell_renderer_set_alignment"
(** Sets the renderer’s alignment within its available space. *)

external is_activatable : t -> bool = "ml_gtk_cell_renderer_is_activatable"
(** Checks whether the cell renderer can do something when activated. *)

external get_visible : t -> bool = "ml_gtk_cell_renderer_get_visible"
(** Returns the cell renderer’s visibility. *)

external get_state :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  Ocgtk_enums.cellrendererstate ->
  Ocgtk_enums.stateflags = "ml_gtk_cell_renderer_get_state"
(** Translates the cell renderer state to [GtkStateFlags], based on the cell
    renderer and widget sensitivity, and the given [GtkCellRenderer]State. *)

external get_sensitive : t -> bool = "ml_gtk_cell_renderer_get_sensitive"
(** Returns the cell renderer’s sensitivity. *)

external get_request_mode : t -> Ocgtk_enums.sizerequestmode
  = "ml_gtk_cell_renderer_get_request_mode"
(** Gets whether the cell renderer prefers a height-for-width layout or a
    width-for-height layout. *)

external get_preferred_width_for_height :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  int * int = "ml_gtk_cell_renderer_get_preferred_width_for_height"
(** Retrieves a cell renderers’s minimum and natural width if it were rendered
    to [widget] with the specified [height]. *)

external get_preferred_width :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int * int = "ml_gtk_cell_renderer_get_preferred_width"
(** Retrieves a renderer’s natural size when rendered to [widget]. *)

external get_preferred_size :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Requisition.t * Requisition.t = "ml_gtk_cell_renderer_get_preferred_size"
(** Retrieves the minimum and natural size of a cell taking into account the
    widget’s preference for height-for-width management. *)

external get_preferred_height_for_width :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  int * int = "ml_gtk_cell_renderer_get_preferred_height_for_width"
(** Retrieves a cell renderers’s minimum and natural height if it were rendered
    to [widget] with the specified [width]. *)

external get_preferred_height :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int * int = "ml_gtk_cell_renderer_get_preferred_height"
(** Retrieves a renderer’s natural size when rendered to [widget]. *)

external get_padding : t -> int * int = "ml_gtk_cell_renderer_get_padding"
(** Fills in [xpad] and [ypad] with the appropriate values of [cell]. *)

external get_is_expander : t -> bool = "ml_gtk_cell_renderer_get_is_expander"
(** Checks whether the given [GtkCellRenderer] is an expander. *)

external get_is_expanded : t -> bool = "ml_gtk_cell_renderer_get_is_expanded"
(** Checks whether the given [GtkCellRenderer] is expanded. *)

external get_fixed_size : t -> int * int = "ml_gtk_cell_renderer_get_fixed_size"
(** Fills in [width] and [height] with the appropriate size of [cell]. *)

external get_alignment : t -> float * float
  = "ml_gtk_cell_renderer_get_alignment"
(** Fills in [xalign] and [yalign] with the appropriate values of [cell]. *)

external get_aligned_area :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Ocgtk_enums.cellrendererstate ->
  Ocgdk_raw.Rectangle.t ->
  Ocgdk_raw.Rectangle.t = "ml_gtk_cell_renderer_get_aligned_area"
(** Gets the aligned area used by [cell] inside [cell_area]. Used for finding
    the appropriate edit and focus rectangle. *)

external activate :
  t ->
  Ocgdk_raw.Event.t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string ->
  Ocgdk_raw.Rectangle.t ->
  Ocgdk_raw.Rectangle.t ->
  Ocgtk_enums.cellrendererstate ->
  bool
  = "ml_gtk_cell_renderer_activate_bytecode"
    "ml_gtk_cell_renderer_activate_native"
(** Passes an activate event to the cell renderer for possible processing. Some
    cell renderers may use events; for example, [GtkCellRendererToggle] toggles
    when it gets a mouse click. *)

(* Properties *)

external set_cell_background : t -> string -> unit
  = "ml_gtk_cell_renderer_set_cell_background"
(** Set property: [cell-background] ([utf8], default [None]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.cell-background.html}upstream
     docs}. *)

external get_cell_background_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_cell_renderer_get_cell_background_rgba"
(** Cell background as a [GdkRGBA] *)

external set_cell_background_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_cell_renderer_set_cell_background_rgba"
(** Cell background as a [GdkRGBA] *)

external get_cell_background_set : t -> bool
  = "ml_gtk_cell_renderer_get_cell_background_set"
(** Get property: [cell-background-set] ([gboolean], default [false]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.cell-background-set.html}upstream
     docs}. *)

external set_cell_background_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_set_cell_background_set"
(** Set property: [cell-background-set] ([gboolean], default [false]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.cell-background-set.html}upstream
     docs}. *)

external get_editing : t -> bool = "ml_gtk_cell_renderer_get_editing"
(** Get property: [editing] ([gboolean], default [false]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.editing.html}upstream
     docs}. *)

external get_height : t -> int = "ml_gtk_cell_renderer_get_height"
(** Get property: [height] ([gint], default [-1]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.height.html}upstream
     docs}. *)

external set_height : t -> int -> unit = "ml_gtk_cell_renderer_set_height"
(** Set property: [height] ([gint], default [-1]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.height.html}upstream
     docs}. *)

external get_mode : t -> Ocgtk_enums.cellrenderermode
  = "ml_gtk_cell_renderer_get_mode"
(** Get property: [mode] ([CellRendererMode], default
    [GTK_CELL_RENDERER_MODE_INERT]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.mode.html}upstream docs}.
*)

external set_mode : t -> Ocgtk_enums.cellrenderermode -> unit
  = "ml_gtk_cell_renderer_set_mode"
(** Set property: [mode] ([CellRendererMode], default
    [GTK_CELL_RENDERER_MODE_INERT]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.mode.html}upstream docs}.
*)

external get_width : t -> int = "ml_gtk_cell_renderer_get_width"
(** Get property: [width] ([gint], default [-1]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.width.html}upstream docs}.
*)

external set_width : t -> int -> unit = "ml_gtk_cell_renderer_set_width"
(** Set property: [width] ([gint], default [-1]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.width.html}upstream docs}.
*)

external get_xalign : t -> float = "ml_gtk_cell_renderer_get_xalign"
(** Get property: [xalign] ([gfloat], default [0.500000]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.xalign.html}upstream
     docs}. *)

external set_xalign : t -> float -> unit = "ml_gtk_cell_renderer_set_xalign"
(** Set property: [xalign] ([gfloat], default [0.500000]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.xalign.html}upstream
     docs}. *)

external get_xpad : t -> int = "ml_gtk_cell_renderer_get_xpad"
(** Get property: [xpad] ([guint], default [0]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.xpad.html}upstream docs}.
*)

external set_xpad : t -> int -> unit = "ml_gtk_cell_renderer_set_xpad"
(** Set property: [xpad] ([guint], default [0]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.xpad.html}upstream docs}.
*)

external get_yalign : t -> float = "ml_gtk_cell_renderer_get_yalign"
(** Get property: [yalign] ([gfloat], default [0.500000]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.yalign.html}upstream
     docs}. *)

external set_yalign : t -> float -> unit = "ml_gtk_cell_renderer_set_yalign"
(** Set property: [yalign] ([gfloat], default [0.500000]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.yalign.html}upstream
     docs}. *)

external get_ypad : t -> int = "ml_gtk_cell_renderer_get_ypad"
(** Get property: [ypad] ([guint], default [0]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.ypad.html}upstream docs}.
*)

external set_ypad : t -> int -> unit = "ml_gtk_cell_renderer_set_ypad"
(** Set property: [ypad] ([guint], default [0]). See
    {{:https://docs.gtk.org/gtk4/property.CellRenderer.ypad.html}upstream docs}.
*)

val on_editing_canceled :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** This signal gets emitted when the user cancels the process of editing a
    cell. For example, an editable cell renderer could be written to cancel
    editing when the user presses Escape.

    See also:
    {{!Ocgtk.Raw.Cell_renderer.val-stop_editing}[gtk_cell_renderer_stop_editing
                                                 ()]}. *)

val on_editing_started :
  ?after:bool ->
  t ->
  callback:(editable:Cell_editable.t -> path:string -> unit) ->
  Gobject.Signal.handler_id
(** This signal gets emitted when a cell starts to be edited. The intended use
    of this signal is to do special setup on [editable], e.g. adding a
    [GtkEntryCompletion] or setting up additional columns in a [GtkComboBox].

    See
    {{!Ocgtk.Raw.Cell_editable.val-start_editing}[gtk_cell_editable_start_editing
                                                  ()]} for information on the
    lifecycle of the [editable] and a way to do setup that doesn’t depend on the
    [renderer].

    Note that GTK doesn't guarantee that cell renderers will continue to use the
    same kind of widget for editing in future releases, therefore you should
    check the type of [editable] before doing any specific setup, as in the
    following example:

    {[
    static void
    text_editing_started (GtkCellRenderer *cell,
                          GtkCellEditable *editable,
                          const char      *path,
                          gpointer         data)
    {
      if (GTK_IS_ENTRY (editable))
        {
          GtkEntry *entry = GTK_ENTRY (editable);

          // ... create a GtkEntryCompletion

          gtk_entry_set_completion (entry, completion);
        }
    }
    ]} *)
