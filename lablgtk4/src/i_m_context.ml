(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IMContext *)

type t = Gtk.widget

(* Properties *)

external gtk_im_context_set_use_preedit : t -> bool -> unit = "ml_gtk_im_context_set_use_preedit"

external gtk_im_context_set_surrounding_with_selection : t -> string -> int -> int -> int -> unit = "ml_gtk_im_context_set_surrounding_with_selection"

external gtk_im_context_set_surrounding : t -> string -> int -> int -> unit = "ml_gtk_im_context_set_surrounding"

external gtk_im_context_set_client_widget : t -> Gtk.widget option -> unit = "ml_gtk_im_context_set_client_widget"

external gtk_im_context_reset : t -> unit = "ml_gtk_im_context_reset"

external gtk_im_context_focus_out : t -> unit = "ml_gtk_im_context_focus_out"

external gtk_im_context_focus_in : t -> unit = "ml_gtk_im_context_focus_in"

external gtk_im_context_filter_keypress : t -> _ Gdk.event -> bool = "ml_gtk_im_context_filter_keypress"

external gtk_im_context_delete_surrounding : t -> int -> int -> bool = "ml_gtk_im_context_delete_surrounding"

external gtk_im_context_activate_osk : t -> _ Gdk.event option -> bool = "ml_gtk_im_context_activate_osk"

