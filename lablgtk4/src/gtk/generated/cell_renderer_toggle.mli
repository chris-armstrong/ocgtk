(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererToggle *)

type t = [`cell_renderer_toggle | `cell_renderer | `initially_unowned] Gobject.obj

val as_cell_renderer : t -> Cell_renderer.t

(** Create a new CellRendererToggle *)
external new_ : unit -> t = "ml_gtk_cell_renderer_toggle_new"

(* Methods *)
(** If @radio is %TRUE, the cell renderer renders a radio toggle
(i.e. a toggle in a group of mutually-exclusive toggles).
If %FALSE, it renders a check toggle (a standalone boolean option).
This can be set globally for the cell renderer, or changed just
before rendering each cell in the model (for `GtkTreeView`, you set
up a per-row setting using `GtkTreeViewColumn` to associate model
columns with cell renderer properties). *)
external set_radio : t -> bool -> unit = "ml_gtk_cell_renderer_toggle_set_radio"

(** Activates or deactivates a cell renderer. *)
external set_active : t -> bool -> unit = "ml_gtk_cell_renderer_toggle_set_active"

(** Makes the cell renderer activatable. *)
external set_activatable : t -> bool -> unit = "ml_gtk_cell_renderer_toggle_set_activatable"

(** Returns whether we’re rendering radio toggles rather than checkboxes. *)
external get_radio : t -> bool = "ml_gtk_cell_renderer_toggle_get_radio"

(** Returns whether the cell renderer is active. See
gtk_cell_renderer_toggle_set_active(). *)
external get_active : t -> bool = "ml_gtk_cell_renderer_toggle_get_active"

(** Returns whether the cell renderer is activatable. See
gtk_cell_renderer_toggle_set_activatable(). *)
external get_activatable : t -> bool = "ml_gtk_cell_renderer_toggle_get_activatable"

(* Properties *)

(** Get property: inconsistent *)
external get_inconsistent : t -> bool = "ml_gtk_cell_renderer_toggle_get_inconsistent"

(** Set property: inconsistent *)
external set_inconsistent : t -> bool -> unit = "ml_gtk_cell_renderer_toggle_set_inconsistent"

