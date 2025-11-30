(* Signal class defined in grange_signals.ml *)

(* High-level class for Range *)
class range_skel (obj : Range.t) = object (self)
  inherit GObj.widget_impl (Range.as_widget obj)

  method connect = new Grange_signals.range_signals obj

  method get_adjustment () = Range.get_adjustment obj
  method adjustment () = Range.get_adjustment obj

  method get_fill_level () = Range.get_fill_level obj
  method fill_level () = Range.get_fill_level obj

  method get_flippable () = Range.get_flippable obj
  method flippable () = Range.get_flippable obj

  method get_inverted () = Range.get_inverted obj
  method inverted () = Range.get_inverted obj

  method get_restrict_to_fill_level () = Range.get_restrict_to_fill_level obj
  method restrict_to_fill_level () = Range.get_restrict_to_fill_level obj

  method get_round_digits () = Range.get_round_digits obj
  method round_digits () = Range.get_round_digits obj

  method get_show_fill_level () = Range.get_show_fill_level obj
  method show_fill_level () = Range.get_show_fill_level obj

  method get_slider_size_fixed () = Range.get_slider_size_fixed obj
  method slider_size_fixed () = Range.get_slider_size_fixed obj

  method get_value () = Range.get_value obj
  method value () = Range.get_value obj

  method set_adjustment adjustment = Range.set_adjustment obj adjustment

  method set_fill_level fill_level = Range.set_fill_level obj fill_level

  method set_flippable flippable = Range.set_flippable obj flippable

  method set_increments step page = Range.set_increments obj step page

  method set_inverted setting = Range.set_inverted obj setting

  method set_range min max = Range.set_range obj min max

  method set_restrict_to_fill_level restrict_to_fill_level = Range.set_restrict_to_fill_level obj restrict_to_fill_level

  method set_round_digits round_digits = Range.set_round_digits obj round_digits

  method set_show_fill_level show_fill_level = Range.set_show_fill_level obj show_fill_level

  method set_slider_size_fixed size_fixed = Range.set_slider_size_fixed obj size_fixed

  method set_value value = Range.set_value obj value

end

class range obj = object
  inherit range_skel obj
end
