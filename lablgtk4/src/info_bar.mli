(* GENERATED CODE - DO NOT EDIT *)
(* Widget: InfoBar *)

type t = Gtk.Widget.t

(** Create a new InfoBar *)
external new_ : unit -> t = "ml_gtk_info_bar_new"

(** Create a new InfoBar *)
external new_with_buttons : string option -> unit -> t = "ml_gtk_info_bar_new_with_buttons"

(* Properties *)

(** Get property: revealed *)
external get_revealed : t -> bool = "ml_gtk_info_bar_get_revealed"

(** Set property: revealed *)
external set_revealed : t -> bool -> unit = "ml_gtk_info_bar_set_revealed"

(** Get property: show-close-button *)
external get_show_close_button : t -> bool = "ml_gtk_info_bar_get_show_close_button"

(** Set property: show-close-button *)
external set_show_close_button : t -> bool -> unit = "ml_gtk_info_bar_set_show_close_button"

external set_response_sensitive : t -> int -> bool -> unit = "ml_gtk_info_bar_set_response_sensitive"

external set_message_type : t -> Gtk_enums.messagetype -> unit = "ml_gtk_info_bar_set_message_type"

external set_default_response : t -> int -> unit = "ml_gtk_info_bar_set_default_response"

external response : t -> int -> unit = "ml_gtk_info_bar_response"

external remove_child : t -> Gtk.Widget.t -> unit = "ml_gtk_info_bar_remove_child"

external remove_action_widget : t -> Gtk.Widget.t -> unit = "ml_gtk_info_bar_remove_action_widget"

external get_message_type : t -> Gtk_enums.messagetype = "ml_gtk_info_bar_get_message_type"

external add_child : t -> Gtk.Widget.t -> unit = "ml_gtk_info_bar_add_child"

external add_button : t -> string -> int -> Gtk.Widget.t = "ml_gtk_info_bar_add_button"

external add_action_widget : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_info_bar_add_action_widget"

