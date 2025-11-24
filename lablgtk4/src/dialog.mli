(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Dialog *)

type t = Gtk.Widget.t

(** Create a new Dialog *)
external new_ : unit -> t = "ml_gtk_dialog_new"

(** Create a new Dialog *)
external new_with_buttons : string option -> Gtk.Widget.t option -> Gtk_enums.dialogflags -> string option -> unit -> t = "ml_gtk_dialog_new_with_buttons"

(* Properties *)

(** Get property: use-header-bar *)
external get_use_header_bar : t -> int = "ml_gtk_dialog_get_use_header_bar"

external set_response_sensitive : t -> int -> bool -> unit = "ml_gtk_dialog_set_response_sensitive"

external set_default_response : t -> int -> unit = "ml_gtk_dialog_set_default_response"

external response : t -> int -> unit = "ml_gtk_dialog_response"

external get_widget_for_response : t -> int -> Gtk.Widget.t = "ml_gtk_dialog_get_widget_for_response"

external get_response_for_widget : t -> Gtk.Widget.t -> int = "ml_gtk_dialog_get_response_for_widget"

external get_header_bar : t -> Gtk.Widget.t = "ml_gtk_dialog_get_header_bar"

external get_content_area : t -> Gtk.Widget.t = "ml_gtk_dialog_get_content_area"

external add_button : t -> string -> int -> Gtk.Widget.t = "ml_gtk_dialog_add_button"

external add_action_widget : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_dialog_add_action_widget"

