(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MenuButton *)

type t = [`menu_button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new MenuButton *)
external new_ : unit -> t = "ml_gtk_menu_button_new"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_menu_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_menu_button_set_active"

(** Get property: always-show-arrow *)
external get_always_show_arrow : t -> bool = "ml_gtk_menu_button_get_always_show_arrow"

(** Set property: always-show-arrow *)
external set_always_show_arrow : t -> bool -> unit = "ml_gtk_menu_button_set_always_show_arrow"

(** Get property: can-shrink *)
external get_can_shrink : t -> bool = "ml_gtk_menu_button_get_can_shrink"

(** Set property: can-shrink *)
external set_can_shrink : t -> bool -> unit = "ml_gtk_menu_button_set_can_shrink"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_menu_button_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_menu_button_set_has_frame"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_menu_button_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_menu_button_set_icon_name"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_menu_button_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_menu_button_set_label"

(** Get property: primary *)
external get_primary : t -> bool = "ml_gtk_menu_button_get_primary"

(** Set property: primary *)
external set_primary : t -> bool -> unit = "ml_gtk_menu_button_set_primary"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_menu_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_menu_button_set_use_underline"

(** Sets the `GtkPopover` that will be popped up when the @menu_button is clicked.

If @popover is %NULL, the button is disabled.

If [property@Gtk.MenuButton:menu-model] is set, the menu model is dissociated
from the @menu_button, and the property is set to %NULL. *)
external set_popover : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_menu_button_set_popover"

(** Sets the direction in which the popup will be popped up.

If the button is automatically populated with an arrow icon,
its direction will be changed to match.

If the does not fit in the available space in the given direction,
GTK will its best to keep it inside the screen and fully visible.

If you pass %GTK_ARROW_NONE for a @direction, the popup will behave
as if you passed %GTK_ARROW_DOWN (although you won’t see any arrows). *)
external set_direction : t -> Gtk_enums.arrowtype -> unit = "ml_gtk_menu_button_set_direction"

(** Sets the child widget of @menu_button.

Setting a child resets [property@Gtk.MenuButton:label] and
[property@Gtk.MenuButton:icon-name].

If [property@Gtk.MenuButton:always-show-arrow] is set to `TRUE` and
[property@Gtk.MenuButton:direction] is not `GTK_ARROW_NONE`, a dropdown arrow
will be shown next to the child. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_menu_button_set_child"

(** Pop up the menu. *)
external popup : t -> unit = "ml_gtk_menu_button_popup"

(** Dismiss the menu. *)
external popdown : t -> unit = "ml_gtk_menu_button_popdown"

(** Returns the `GtkPopover` that pops out of the button.

If the button is not using a `GtkPopover`, this function
returns %NULL. *)
external get_popover : t -> Popover.t option = "ml_gtk_menu_button_get_popover"

(** Returns the direction the popup will be pointing at when popped up. *)
external get_direction : t -> Gtk_enums.arrowtype = "ml_gtk_menu_button_get_direction"

(** Gets the child widget of @menu_button. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_menu_button_get_child"

