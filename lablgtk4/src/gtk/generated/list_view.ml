(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListView *)

type t = [`list_view | `list_base | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ListView *)
external new_ : Selection_model.t option -> List_item_factory.t option -> t = "ml_gtk_list_view_new"

(* Properties *)

(** Get property: enable-rubberband *)
external get_enable_rubberband : t -> bool = "ml_gtk_list_view_get_enable_rubberband"

(** Set property: enable-rubberband *)
external set_enable_rubberband : t -> bool -> unit = "ml_gtk_list_view_set_enable_rubberband"

(** Get property: show-separators *)
external get_show_separators : t -> bool = "ml_gtk_list_view_get_show_separators"

(** Set property: show-separators *)
external set_show_separators : t -> bool -> unit = "ml_gtk_list_view_set_show_separators"

(** Get property: single-click-activate *)
external get_single_click_activate : t -> bool = "ml_gtk_list_view_get_single_click_activate"

(** Set property: single-click-activate *)
external set_single_click_activate : t -> bool -> unit = "ml_gtk_list_view_set_single_click_activate"

(** Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)
external set_tab_behavior : t -> Gtk_enums.listtabbehavior -> unit = "ml_gtk_list_view_set_tab_behavior"

(** Sets the model to use.

This must be a [iface@Gtk.SelectionModel] to use. *)
external set_model : t -> Selection_model.t option -> unit = "ml_gtk_list_view_set_model"

(** Sets the `GtkListItemFactory` to use for populating the
[class@Gtk.ListHeader] objects used in section headers.

If this factory is set to %NULL, the list will not show section headers. *)
external set_header_factory : t -> List_item_factory.t option -> unit = "ml_gtk_list_view_set_header_factory"

(** Sets the `GtkListItemFactory` to use for populating list items. *)
external set_factory : t -> List_item_factory.t option -> unit = "ml_gtk_list_view_set_factory"

(** Scrolls to the item at the given position and performs the actions
specified in @flags.

This function works no matter if the listview is shown or focused.
If it isn't, then the changes will take effect once that happens. *)
external scroll_to : t -> int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit = "ml_gtk_list_view_scroll_to"

(** Gets the behavior set for the <kbd>Tab</kbd> key. *)
external get_tab_behavior : t -> Gtk_enums.listtabbehavior = "ml_gtk_list_view_get_tab_behavior"

(** Gets the model that's currently used to read the items displayed. *)
external get_model : t -> Selection_model.t option = "ml_gtk_list_view_get_model"

(** Gets the factory that's currently used to populate section headers. *)
external get_header_factory : t -> List_item_factory.t option = "ml_gtk_list_view_get_header_factory"

(** Gets the factory that's currently used to populate list items. *)
external get_factory : t -> List_item_factory.t option = "ml_gtk_list_view_get_factory"

