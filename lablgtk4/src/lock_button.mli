(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LockButton *)

type t = Gtk.Widget.t

(** Create a new LockButton *)
external new_ : unit -> t = "ml_gtk_lock_button_new"

(* Properties *)

(** Get property: text-lock *)
external get_text_lock : t -> string = "ml_gtk_lock_button_get_text_lock"

(** Set property: text-lock *)
external set_text_lock : t -> string -> unit = "ml_gtk_lock_button_set_text_lock"

(** Get property: text-unlock *)
external get_text_unlock : t -> string = "ml_gtk_lock_button_get_text_unlock"

(** Set property: text-unlock *)
external set_text_unlock : t -> string -> unit = "ml_gtk_lock_button_set_text_unlock"

(** Get property: tooltip-lock *)
external get_tooltip_lock : t -> string = "ml_gtk_lock_button_get_tooltip_lock"

(** Set property: tooltip-lock *)
external set_tooltip_lock : t -> string -> unit = "ml_gtk_lock_button_set_tooltip_lock"

(** Get property: tooltip-not-authorized *)
external get_tooltip_not_authorized : t -> string = "ml_gtk_lock_button_get_tooltip_not_authorized"

(** Set property: tooltip-not-authorized *)
external set_tooltip_not_authorized : t -> string -> unit = "ml_gtk_lock_button_set_tooltip_not_authorized"

(** Get property: tooltip-unlock *)
external get_tooltip_unlock : t -> string = "ml_gtk_lock_button_get_tooltip_unlock"

(** Set property: tooltip-unlock *)
external set_tooltip_unlock : t -> string -> unit = "ml_gtk_lock_button_set_tooltip_unlock"

