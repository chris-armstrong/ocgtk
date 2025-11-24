(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintUnixDialog *)

type t = Gtk.Widget.t

(** Create a new PrintUnixDialog *)
external new_ : string option -> Gtk.Widget.t option -> t = "ml_gtk_print_unix_dialog_new"

(* Properties *)

(** Get property: current-page *)
external get_current_page : t -> int = "ml_gtk_print_unix_dialog_get_current_page"

(** Set property: current-page *)
external set_current_page : t -> int -> unit = "ml_gtk_print_unix_dialog_set_current_page"

(** Get property: embed-page-setup *)
external get_embed_page_setup : t -> bool = "ml_gtk_print_unix_dialog_get_embed_page_setup"

(** Set property: embed-page-setup *)
external set_embed_page_setup : t -> bool -> unit = "ml_gtk_print_unix_dialog_set_embed_page_setup"

(** Get property: has-selection *)
external get_has_selection : t -> bool = "ml_gtk_print_unix_dialog_get_has_selection"

(** Set property: has-selection *)
external set_has_selection : t -> bool -> unit = "ml_gtk_print_unix_dialog_set_has_selection"

(** Get property: support-selection *)
external get_support_selection : t -> bool = "ml_gtk_print_unix_dialog_get_support_selection"

(** Set property: support-selection *)
external set_support_selection : t -> bool -> unit = "ml_gtk_print_unix_dialog_set_support_selection"

external set_settings : t -> Gtk.Widget.t option -> unit = "ml_gtk_print_unix_dialog_set_settings"

external set_page_setup : t -> Gtk.Widget.t -> unit = "ml_gtk_print_unix_dialog_set_page_setup"

external set_manual_capabilities : t -> unit -> unit = "ml_gtk_print_unix_dialog_set_manual_capabilities"

external get_settings : t -> Gtk.Widget.t = "ml_gtk_print_unix_dialog_get_settings"

external get_selected_printer : t -> Gtk.Widget.t = "ml_gtk_print_unix_dialog_get_selected_printer"

external get_page_setup_set : t -> bool = "ml_gtk_print_unix_dialog_get_page_setup_set"

external get_page_setup : t -> Gtk.Widget.t = "ml_gtk_print_unix_dialog_get_page_setup"

external get_manual_capabilities : t -> unit = "ml_gtk_print_unix_dialog_get_manual_capabilities"

external add_custom_tab : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_print_unix_dialog_add_custom_tab"

