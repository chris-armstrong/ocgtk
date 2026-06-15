(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleTextRange: AccessibleTextRange *)

type t = [ `accessible_text_range ] Gobject.obj
(** A range inside the text of an accessible object. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_start : t -> Gsize.t = "ml_gtk_accessible_text_range_get_start"
external get_length : t -> Gsize.t = "ml_gtk_accessible_text_range_get_length"

(* Setters *)
external set_start : t -> Gsize.t -> unit
  = "ml_gtk_accessible_text_range_set_start"

external set_length : t -> Gsize.t -> unit
  = "ml_gtk_accessible_text_range_set_length"

external make : Gsize.t -> Gsize.t -> t = "ml_gtk_accessible_text_range_make"
