(* Compatibility wrapper around generated Toggle_button bindings *)
type t = Toggle_button.t

val as_widget : t -> Gtk.widget

val new_ : unit -> t
val new_with_label : string -> t
val new_with_mnemonic : string -> t
val get_active : t -> bool
val set_active : t -> bool -> unit
val toggled : t -> unit
