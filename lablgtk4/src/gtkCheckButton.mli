(* Compatibility wrapper around generated Check_button bindings *)
type t = Check_button.t

val as_widget : t -> Gtk.widget

val new_ : unit -> t
val new_with_label : string option -> t
val new_with_mnemonic : string option -> t
val get_active : t -> bool
val set_active : t -> bool -> unit
val get_label : t -> string
val set_label : t -> string -> unit
val get_use_underline : t -> bool
val set_use_underline : t -> bool -> unit
val get_inconsistent : t -> bool
val set_inconsistent : t -> bool -> unit
val set_group : t -> t option -> unit
