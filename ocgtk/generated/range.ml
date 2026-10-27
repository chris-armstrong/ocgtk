class type range_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_adjust_bounds :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> value:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_slider :
    ?after:bool ->
    callback:(step:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_fill_level : unit -> float
  method get_flippable : unit -> bool
  method get_inverted : unit -> bool
  method get_restrict_to_fill_level : unit -> bool
  method get_round_digits : unit -> int
  method get_show_fill_level : unit -> bool
  method get_slider_size_fixed : unit -> bool
  method get_value : unit -> float
  method set_adjustment : Adjustment.adjustment_t -> unit
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
  method as_range : Raw.Range.t
end

(* High-level class for Range *)
class range (obj : Raw.Range.t) : range_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_adjust_bounds ?(after = false) ~callback () =
      Raw.Range.on_adjust_bounds ~after self#as_range ~callback

    method on_change_value ?(after = false) ~callback () =
      Raw.Range.on_change_value ~after self#as_range ~callback

    method on_move_slider ?(after = false) ~callback () =
      Raw.Range.on_move_slider ~after self#as_range ~callback

    method on_value_changed ?(after = false) ~callback () =
      Raw.Range.on_value_changed ~after self#as_range ~callback

    method get_adjustment : unit -> Adjustment.adjustment_t =
      fun () -> new Adjustment.adjustment (Raw.Range.get_adjustment obj)

    method get_fill_level : unit -> float =
      fun () -> Raw.Range.get_fill_level obj

    method get_flippable : unit -> bool = fun () -> Raw.Range.get_flippable obj
    method get_inverted : unit -> bool = fun () -> Raw.Range.get_inverted obj

    method get_restrict_to_fill_level : unit -> bool =
      fun () -> Raw.Range.get_restrict_to_fill_level obj

    method get_round_digits : unit -> int =
      fun () -> Raw.Range.get_round_digits obj

    method get_show_fill_level : unit -> bool =
      fun () -> Raw.Range.get_show_fill_level obj

    method get_slider_size_fixed : unit -> bool =
      fun () -> Raw.Range.get_slider_size_fixed obj

    method get_value : unit -> float = fun () -> Raw.Range.get_value obj

    method set_adjustment : Adjustment.adjustment_t -> unit =
      fun adjustment ->
        let adjustment = adjustment#as_adjustment in
        Raw.Range.set_adjustment obj adjustment

    method set_fill_level : float -> unit =
      fun fill_level -> Raw.Range.set_fill_level obj fill_level

    method set_flippable : bool -> unit =
      fun flippable -> Raw.Range.set_flippable obj flippable

    method set_increments : float -> float -> unit =
      fun step page -> Raw.Range.set_increments obj step page

    method set_inverted : bool -> unit =
      fun setting -> Raw.Range.set_inverted obj setting

    method set_range : float -> float -> unit =
      fun min max -> Raw.Range.set_range obj min max

    method set_restrict_to_fill_level : bool -> unit =
      fun restrict_to_fill_level ->
        Raw.Range.set_restrict_to_fill_level obj restrict_to_fill_level

    method set_round_digits : int -> unit =
      fun round_digits -> Raw.Range.set_round_digits obj round_digits

    method set_show_fill_level : bool -> unit =
      fun show_fill_level -> Raw.Range.set_show_fill_level obj show_fill_level

    method set_slider_size_fixed : bool -> unit =
      fun size_fixed -> Raw.Range.set_slider_size_fixed obj size_fixed

    method set_value : float -> unit =
      fun value -> Raw.Range.set_value obj value

    method as_range = obj
  end
