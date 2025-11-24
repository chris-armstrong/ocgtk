(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Assistant *)

type t = Gtk.widget

(** Create a new Assistant *)
external new_ : unit -> t = "ml_gtk_assistant_new"

(* Properties *)

(** Get property: use-header-bar *)
external get_use_header_bar : t -> int = "ml_gtk_assistant_get_use_header_bar"

external update_buttons_state : t -> unit = "ml_gtk_assistant_update_buttons_state"

external set_page_type : t -> Gtk.widget -> Gtk_enums.assistantpagetype -> unit = "ml_gtk_assistant_set_page_type"

external set_page_title : t -> Gtk.widget -> string -> unit = "ml_gtk_assistant_set_page_title"

external set_page_complete : t -> Gtk.widget -> bool -> unit = "ml_gtk_assistant_set_page_complete"

external set_current_page : t -> int -> unit = "ml_gtk_assistant_set_current_page"

external remove_page : t -> int -> unit = "ml_gtk_assistant_remove_page"

external remove_action_widget : t -> Gtk.widget -> unit = "ml_gtk_assistant_remove_action_widget"

external previous_page : t -> unit = "ml_gtk_assistant_previous_page"

external prepend_page : t -> Gtk.widget -> int = "ml_gtk_assistant_prepend_page"

external next_page : t -> unit = "ml_gtk_assistant_next_page"

external insert_page : t -> Gtk.widget -> int -> int = "ml_gtk_assistant_insert_page"

external get_page_type : t -> Gtk.widget -> Gtk_enums.assistantpagetype = "ml_gtk_assistant_get_page_type"

external get_page_title : t -> Gtk.widget -> string = "ml_gtk_assistant_get_page_title"

external get_page_complete : t -> Gtk.widget -> bool = "ml_gtk_assistant_get_page_complete"

external get_page : t -> Gtk.widget -> Gtk.widget = "ml_gtk_assistant_get_page"

external get_nth_page : t -> int -> Gtk.widget = "ml_gtk_assistant_get_nth_page"

external get_n_pages : t -> int = "ml_gtk_assistant_get_n_pages"

external get_current_page : t -> int = "ml_gtk_assistant_get_current_page"

external commit : t -> unit = "ml_gtk_assistant_commit"

external append_page : t -> Gtk.widget -> int = "ml_gtk_assistant_append_page"

external add_action_widget : t -> Gtk.widget -> unit = "ml_gtk_assistant_add_action_widget"

