(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellAreaContext *)

type t = Gtk.widget

(* Properties *)

(** Resets any previously cached request and allocation
data.

When underlying `GtkTreeModel` data changes its
important to reset the context if the content
size is allowed to shrink. If the content size
is only allowed to grow (this is usually an option
for views rendering large data stores as a measure
of optimization), then only the row that changed
or was inserted needs to be (re)requested with
gtk_cell_area_get_preferred_width().

When the new overall size of the context requires
that the allocated size changes (or whenever this
allocation changes at all), the variable row
sizes need to be re-requested for every row.

For instance, if the rows are displayed all with
the same width from top to bottom then a change
in the allocated width necessitates a recalculation
of all the displayed row heights using
gtk_cell_area_get_preferred_height_for_width(). *)
external reset : t -> unit = "ml_gtk_cell_area_context_reset"

(** Causes the minimum and/or natural width to grow if the new
proposed sizes exceed the current minimum and natural width.

This is used by `GtkCellAreaContext` implementations during
the request process over a series of `GtkTreeModel` rows to
progressively push the requested width over a series of
gtk_cell_area_get_preferred_width() requests. *)
external push_preferred_width : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_width"

(** Causes the minimum and/or natural height to grow if the new
proposed sizes exceed the current minimum and natural height.

This is used by `GtkCellAreaContext` implementations during
the request process over a series of `GtkTreeModel` rows to
progressively push the requested height over a series of
gtk_cell_area_get_preferred_height() requests. *)
external push_preferred_height : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_height"

(** Fetches the `GtkCellArea` this @context was created by.

This is generally unneeded by layouting widgets; however,
it is important for the context implementation itself to
fetch information about the area it is being used for.

For instance at `GtkCellAreaContextClass.allocate()` time
it’s important to know details about any cell spacing
that the `GtkCellArea` is configured with in order to
compute a proper allocation. *)
external get_area : t -> Gtk.widget = "ml_gtk_cell_area_context_get_area"

(** Allocates a width and/or a height for all rows which are to be
rendered with @context.

Usually allocation is performed only horizontally or sometimes
vertically since a group of rows are usually rendered side by
side vertically or horizontally and share either the same width
or the same height. Sometimes they are allocated in both horizontal
and vertical orientations producing a homogeneous effect of the
rows. This is generally the case for `GtkTreeView` when
`GtkTreeView:fixed-height-mode` is enabled. *)
external allocate : t -> int -> int -> unit = "ml_gtk_cell_area_context_allocate"

