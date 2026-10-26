class type scale_t = object
  inherit GRange.range_t
  method add_mark : float -> Gtk_enums.positiontype -> string option -> unit
  method clear_marks : unit -> unit
  method get_digits : unit -> int
  method get_draw_value : unit -> bool
  method get_has_origin : unit -> bool
  method get_layout : unit -> Ocgtk_pango.Pango.Layout.layout_t option
  method get_value_pos : unit -> Gtk_enums.positiontype
  method set_digits : int -> unit
  method set_draw_value : bool -> unit
  method set_has_origin : bool -> unit
  method set_value_pos : Gtk_enums.positiontype -> unit
  method as_scale : Scale.t
end

class scale : Scale.t -> scale_t

val new_ : Gtk_enums.orientation -> GAdjustment.adjustment_t option -> scale_t
val new_with_range : Gtk_enums.orientation -> float -> float -> float -> scale_t
