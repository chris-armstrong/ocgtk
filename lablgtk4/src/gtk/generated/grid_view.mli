(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GridView *)

type t = [`grid_view | `list_base | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new GridView *)
external new_ : Selection_model.t option -> List_item_factory.t option -> t = "ml_gtk_grid_view_new"

(* Properties *)

(** Get property: enable-rubberband *)
external get_enable_rubberband : t -> bool = "ml_gtk_grid_view_get_enable_rubberband"

(** Set property: enable-rubberband *)
external set_enable_rubberband : t -> bool -> unit = "ml_gtk_grid_view_set_enable_rubberband"

(** Get property: max-columns *)
external get_max_columns : t -> int = "ml_gtk_grid_view_get_max_columns"

(** Set property: max-columns *)
external set_max_columns : t -> int -> unit = "ml_gtk_grid_view_set_max_columns"

(** Get property: min-columns *)
external get_min_columns : t -> int = "ml_gtk_grid_view_get_min_columns"

(** Set property: min-columns *)
external set_min_columns : t -> int -> unit = "ml_gtk_grid_view_set_min_columns"

(** Get property: single-click-activate *)
external get_single_click_activate : t -> bool = "ml_gtk_grid_view_get_single_click_activate"

(** Set property: single-click-activate *)
external set_single_click_activate : t -> bool -> unit = "ml_gtk_grid_view_set_single_click_activate"

(** Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)
external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_grid_view_set_tab_behavior"

(** Sets the model to use.

This must be a [iface@Gtk.SelectionModel]. *)
external set_model : t -> Selection_model.t option -> unit = "ml_gtk_grid_view_set_model"

(** Sets the `GtkListItemFactory` to use for populating list items. *)
external set_factory : t -> List_item_factory.t option -> unit = "ml_gtk_grid_view_set_factory"

(** Scrolls to the item at the given position and performs the actions
specified in @flags.

This function works no matter if the gridview is shown or focused.
If it isn't, then the changes will take effect once that happens. *)
external scroll_to : t -> int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit = "ml_gtk_grid_view_scroll_to"

(** Gets the behavior set for the <kbd>Tab</kbd> key. *)
external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_grid_view_get_tab_behavior"

(** Gets the model that's currently used to read the items displayed. *)
external get_model : t -> Selection_model.t option = "ml_gtk_grid_view_get_model"

(** Gets the factory that's currently used to populate list items. *)
external get_factory : t -> List_item_factory.t option = "ml_gtk_grid_view_get_factory"

