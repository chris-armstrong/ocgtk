(* Signal class defined in grange_signals.ml *)

(* High-level class for Range *)
class range (obj : Range.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Range.as_widget obj)
  inherit Grange_signals.range_signals obj

  method fill_level = Range.get_fill_level obj
  method set_fill_level v = Range.set_fill_level obj v

  method inverted = Range.get_inverted obj
  method set_inverted v = Range.set_inverted obj v

  method restrict_to_fill_level = Range.get_restrict_to_fill_level obj
  method set_restrict_to_fill_level v = Range.set_restrict_to_fill_level obj v

  method round_digits = Range.get_round_digits obj
  method set_round_digits v = Range.set_round_digits obj v

  method show_fill_level = Range.get_show_fill_level obj
  method set_show_fill_level v = Range.set_show_fill_level obj v

  method get_adjustment : unit -> GAdjustment.adjustment = fun () -> new  GAdjustment.adjustment(Range.get_adjustment obj )

  method get_flippable : unit -> bool = fun () -> (Range.get_flippable obj )

  method get_slider_size_fixed : unit -> bool = fun () -> (Range.get_slider_size_fixed obj )

  method get_value : unit -> float = fun () -> (Range.get_value obj )

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) -> unit = fun adjustment -> (Range.set_adjustment obj ( adjustment#as_adjustment ))

  method set_flippable : bool -> unit = fun flippable -> (Range.set_flippable obj flippable)

  method set_increments : float -> float -> unit = fun step page -> (Range.set_increments obj step page)

  method set_range : float -> float -> unit = fun min max -> (Range.set_range obj min max)

  method set_slider_size_fixed : bool -> unit = fun size_fixed -> (Range.set_slider_size_fixed obj size_fixed)

  method set_value : float -> unit = fun value -> (Range.set_value obj value)

  method as_widget = (Range.as_widget obj)
    method as_range = obj
end

