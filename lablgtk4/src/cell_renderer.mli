(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellRenderer *)

type t = Gtk.widget

(* Properties *)

(** Get property: cell-background *)
external get_cell_background : t -> string = "ml_gtk_cell_renderer_get_cell_background"

(** Set property: cell-background *)
external set_cell_background : t -> string -> unit = "ml_gtk_cell_renderer_set_cell_background"

(** Informs the cell renderer that the editing is stopped.
If @canceled is %TRUE, the cell renderer will emit the
`GtkCellRenderer`::editing-canceled signal.

This function should be called by cell renderer implementations
in response to the `GtkCellEditable::editing-done` signal of
`GtkCellEditable`. *)
external stop_editing : t -> bool -> unit = "ml_gtk_cell_renderer_stop_editing"

(** Sets the cell renderer’s visibility. *)
external set_visible : t -> bool -> unit = "ml_gtk_cell_renderer_set_visible"

(** Sets the cell renderer’s sensitivity. *)
external set_sensitive : t -> bool -> unit = "ml_gtk_cell_renderer_set_sensitive"

(** Sets the renderer’s padding. *)
external set_padding : t -> int -> int -> unit = "ml_gtk_cell_renderer_set_padding"

(** Sets whether the given `GtkCellRenderer` is an expander. *)
external set_is_expander : t -> bool -> unit = "ml_gtk_cell_renderer_set_is_expander"

(** Sets whether the given `GtkCellRenderer` is expanded. *)
external set_is_expanded : t -> bool -> unit = "ml_gtk_cell_renderer_set_is_expanded"

(** Sets the renderer size to be explicit, independent of the properties set. *)
external set_fixed_size : t -> int -> int -> unit = "ml_gtk_cell_renderer_set_fixed_size"

(** Sets the renderer’s alignment within its available space. *)
external set_alignment : t -> float -> float -> unit = "ml_gtk_cell_renderer_set_alignment"

(** Checks whether the cell renderer can do something when activated. *)
external is_activatable : t -> bool = "ml_gtk_cell_renderer_is_activatable"

(** Returns the cell renderer’s visibility. *)
external get_visible : t -> bool = "ml_gtk_cell_renderer_get_visible"

(** Translates the cell renderer state to `GtkStateFlags`,
based on the cell renderer and widget sensitivity, and
the given `GtkCellRenderer`State. *)
external get_state : t -> Gtk.widget option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags = "ml_gtk_cell_renderer_get_state"

(** Returns the cell renderer’s sensitivity. *)
external get_sensitive : t -> bool = "ml_gtk_cell_renderer_get_sensitive"

(** Gets whether the cell renderer prefers a height-for-width layout
or a width-for-height layout. *)
external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_renderer_get_request_mode"

(** Retrieves the minimum and natural size of a cell taking
into account the widget’s preference for height-for-width management. *)
external get_preferred_size : t -> Gtk.widget -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_cell_renderer_get_preferred_size"

(** Checks whether the given `GtkCellRenderer` is an expander. *)
external get_is_expander : t -> bool = "ml_gtk_cell_renderer_get_is_expander"

(** Checks whether the given `GtkCellRenderer` is expanded. *)
external get_is_expanded : t -> bool = "ml_gtk_cell_renderer_get_is_expanded"

