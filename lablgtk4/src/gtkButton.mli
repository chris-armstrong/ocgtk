(* Compatibility wrapper around generated Button bindings *)
type t = Button.t

val as_widget : t -> Gtk.widget

val new_ : unit -> t
val new_with_label : string -> t
val new_with_mnemonic : string -> t
val new_from_icon_name : string -> t

val get_label : t -> string
val set_label : t -> string -> unit

val get_has_frame : t -> bool
val set_has_frame : t -> bool -> unit

val get_use_underline : t -> bool
val set_use_underline : t -> bool -> unit

val get_icon_name : t -> string
val set_icon_name : t -> string -> unit

val get_can_shrink : t -> bool
val set_can_shrink : t -> bool -> unit

val get_child : t -> Gtk.widget option
val set_child : t -> Gtk.widget option -> unit
