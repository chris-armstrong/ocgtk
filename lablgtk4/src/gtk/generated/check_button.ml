(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CheckButton *)

type t = [`check_button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new"

(** Create a new CheckButton *)
external new_with_label : string option -> t = "ml_gtk_check_button_new_with_label"

(** Create a new CheckButton *)
external new_with_mnemonic : string option -> t = "ml_gtk_check_button_new_with_mnemonic"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_check_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"

(** Get property: inconsistent *)
external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"

(** Set property: inconsistent *)
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_check_button_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_check_button_set_label"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"

(** Adds @self to the group of @group.

In a group of multiple check buttons, only one button can be active
at a time. The behavior of a checkbutton in a group is also commonly
known as a *radio button*.

Setting the group of a check button also changes the css name of the
indicator widget's CSS node to 'radio'.

Setting up groups in a cycle leads to undefined behavior.

Note that the same effect can be achieved via the [iface@Gtk.Actionable]
API, by using the same action with parameter type and state type 's'
for all buttons in the group, and giving each button its own target
value. *)
external set_group : t -> t option -> unit = "ml_gtk_check_button_set_group"

(** Sets the child widget of @button.

Note that by using this API, you take full responsibility for setting
up the proper accessibility label and description information for @button.
Most likely, you'll either set the accessibility label or description
for @button explicitly, or you'll set a labelled-by or described-by
relations from @child to @button. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_check_button_set_child"

(** Gets the child widget of @button or `NULL` if [property@CheckButton:label] is set. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_check_button_get_child"

