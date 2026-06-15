(* GENERATED CODE - DO NOT EDIT *)
(* PadActionEntry: PadActionEntry *)

type t = [ `pad_action_entry ] Gobject.obj
(** Struct defining a pad action entry. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_type : t -> Gtk_enums.padactiontype
  = "ml_gtk_pad_action_entry_get_type"

external get_index : t -> int = "ml_gtk_pad_action_entry_get_index"
external get_mode : t -> int = "ml_gtk_pad_action_entry_get_mode"
external get_label : t -> string = "ml_gtk_pad_action_entry_get_label"

external get_action_name : t -> string
  = "ml_gtk_pad_action_entry_get_action_name"

(* Setters *)
external set_type : t -> Gtk_enums.padactiontype -> unit
  = "ml_gtk_pad_action_entry_set_type"

external set_index : t -> int -> unit = "ml_gtk_pad_action_entry_set_index"
external set_mode : t -> int -> unit = "ml_gtk_pad_action_entry_set_mode"
external set_label : t -> string -> unit = "ml_gtk_pad_action_entry_set_label"

external set_action_name : t -> string -> unit
  = "ml_gtk_pad_action_entry_set_action_name"

external make : Gtk_enums.padactiontype -> int -> int -> string -> string -> t
  = "ml_gtk_pad_action_entry_make"
