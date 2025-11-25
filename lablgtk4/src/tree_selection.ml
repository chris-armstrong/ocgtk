(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeSelection *)

type t = Gtk.widget

(* Properties *)

(** Unselects a range of nodes, determined by @start_path and @end_path
inclusive. *)
external unselect_range : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_selection_unselect_range"

(** Unselects the row at @path. *)
external unselect_path : t -> Gtk.widget -> unit = "ml_gtk_tree_selection_unselect_path"

(** Unselects the specified iterator. *)
external unselect_iter : t -> Gtk.widget -> unit = "ml_gtk_tree_selection_unselect_iter"

(** Unselects all the nodes. *)
external unselect_all : t -> unit = "ml_gtk_tree_selection_unselect_all"

(** Sets the selection mode of the @selection.  If the previous type was
%GTK_SELECTION_MULTIPLE, then the anchor is kept selected, if it was
previously selected. *)
external set_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_tree_selection_set_mode"

(** Selects a range of nodes, determined by @start_path and @end_path inclusive.
@selection must be set to %GTK_SELECTION_MULTIPLE mode. *)
external select_range : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_selection_select_range"

(** Select the row at @path. *)
external select_path : t -> Gtk.widget -> unit = "ml_gtk_tree_selection_select_path"

(** Selects the specified iterator. *)
external select_iter : t -> Gtk.widget -> unit = "ml_gtk_tree_selection_select_iter"

(** Selects all the nodes. @selection must be set to %GTK_SELECTION_MULTIPLE
mode. *)
external select_all : t -> unit = "ml_gtk_tree_selection_select_all"

(** Returns %TRUE if the row pointed to by @path is currently selected.  If @path
does not point to a valid location, %FALSE is returned *)
external path_is_selected : t -> Gtk.widget -> bool = "ml_gtk_tree_selection_path_is_selected"

(** Returns %TRUE if the row at @iter is currently selected. *)
external iter_is_selected : t -> Gtk.widget -> bool = "ml_gtk_tree_selection_iter_is_selected"

(** Returns the tree view associated with @selection. *)
external get_tree_view : t -> Gtk.widget = "ml_gtk_tree_selection_get_tree_view"

(** Sets @iter to the currently selected node if @selection is set to
%GTK_SELECTION_SINGLE or %GTK_SELECTION_BROWSE.  @iter may be NULL if you
just want to test if @selection has any selected nodes.  @model is filled
with the current model as a convenience.  This function will not work if you
use @selection is %GTK_SELECTION_MULTIPLE. *)
external get_selected : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_selection_get_selected"

(** Gets the selection mode for @selection. See
gtk_tree_selection_set_mode(). *)
external get_mode : t -> Gtk_enums.selectionmode = "ml_gtk_tree_selection_get_mode"

(** Returns the number of rows that have been selected in @tree. *)
external count_selected_rows : t -> int = "ml_gtk_tree_selection_count_selected_rows"

