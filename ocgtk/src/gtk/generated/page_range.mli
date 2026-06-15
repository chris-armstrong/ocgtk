(* GENERATED CODE - DO NOT EDIT *)
(* PageRange: PageRange *)

type t = [ `page_range ] Gobject.obj
(** A range of pages to print.

    See also [method@Gtk.PrintSettings.set_page_ranges]. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_start : t -> int = "ml_gtk_page_range_get_start"
external get_end : t -> int = "ml_gtk_page_range_get_end"

(* Setters *)
external set_start : t -> int -> unit = "ml_gtk_page_range_set_start"
external set_end : t -> int -> unit = "ml_gtk_page_range_set_end"
external make : int -> int -> t = "ml_gtk_page_range_make"
