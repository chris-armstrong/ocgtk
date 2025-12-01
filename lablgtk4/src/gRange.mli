class range_skel : Range.t ->
  object
    inherit GObj.widget_impl
    method connect : Grange_signals.range_signals
    method get_adjustment : unit -> Gtk.widget
    method adjustment : unit -> Gtk.widget
    method get_fill_level : unit -> float
    method fill_level : unit -> float
    method get_flippable : unit -> bool
    method flippable : unit -> bool
    method get_inverted : unit -> bool
    method inverted : unit -> bool
    method get_restrict_to_fill_level : unit -> bool
    method restrict_to_fill_level : unit -> bool
    method get_round_digits : unit -> int
    method round_digits : unit -> int
    method get_show_fill_level : unit -> bool
    method show_fill_level : unit -> bool
    method get_slider_size_fixed : unit -> bool
    method slider_size_fixed : unit -> bool
    method get_value : unit -> float
    method value : unit -> float
    method set_adjustment : Gtk.widget -> unit
    method set_fill_level : float -> unit
    method set_flippable : bool -> unit
    method set_increments : float -> float -> unit
    method set_inverted : bool -> unit
    method set_range : float -> float -> unit
    method set_restrict_to_fill_level : bool -> unit
    method set_round_digits : int -> unit
    method set_show_fill_level : bool -> unit
    method set_slider_size_fixed : bool -> unit
    method set_value : float -> unit
  end

class range : Range.t ->
  object
    inherit range_skel
  end
