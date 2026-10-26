class type paper_size_t = object
  method get_default_bottom_margin : Gtk_enums.unit -> float
  method get_default_left_margin : Gtk_enums.unit -> float
  method get_default_right_margin : Gtk_enums.unit -> float
  method get_default_top_margin : Gtk_enums.unit -> float
  method get_display_name : unit -> string
  method get_height : Gtk_enums.unit -> float
  method get_name : unit -> string
  method get_ppd_name : unit -> string
  method get_width : Gtk_enums.unit -> float
  method is_custom : unit -> bool
  method is_equal : Paper_size.t -> bool
  method is_ipp : unit -> bool
  method set_size : float -> float -> Gtk_enums.unit -> unit
  method to_gvariant : unit -> Gvariant.t
  method as_paper_size : Paper_size.t
end

class paper_size : Paper_size.t -> paper_size_t

val new_ : string option -> paper_size_t

val new_custom :
  string -> string -> float -> float -> Gtk_enums.unit -> paper_size_t

val new_from_gvariant : Gvariant.t -> paper_size_t
val new_from_ipp : string -> float -> float -> paper_size_t
val new_from_ppd : string -> string -> float -> float -> paper_size_t
