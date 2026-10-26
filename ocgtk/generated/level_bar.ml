class type level_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_offset_changed :
    ?after:bool ->
    callback:(name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_offset_value : string -> float -> unit
  method get_inverted : unit -> bool
  method get_max_value : unit -> float
  method get_min_value : unit -> float
  method get_mode : unit -> Enums.levelbarmode
  method get_value : unit -> float
  method remove_offset_value : string option -> unit
  method set_inverted : bool -> unit
  method set_max_value : float -> unit
  method set_min_value : float -> unit
  method set_mode : Enums.levelbarmode -> unit
  method set_value : float -> unit
  method as_level_bar : Raw.Level_bar.t
end

(* High-level class for LevelBar *)
class level_bar (obj : Raw.Level_bar.t) : level_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_offset_changed ?(after = false) ~callback () =
      Raw.Level_bar.on_offset_changed ~after self#as_level_bar ~callback

    method add_offset_value : string -> float -> unit =
      fun name value -> Raw.Level_bar.add_offset_value obj name value

    method get_inverted : unit -> bool =
      fun () -> Raw.Level_bar.get_inverted obj

    method get_max_value : unit -> float =
      fun () -> Raw.Level_bar.get_max_value obj

    method get_min_value : unit -> float =
      fun () -> Raw.Level_bar.get_min_value obj

    method get_mode : unit -> Enums.levelbarmode =
      fun () -> Raw.Level_bar.get_mode obj

    method get_value : unit -> float = fun () -> Raw.Level_bar.get_value obj

    method remove_offset_value : string option -> unit =
      fun name -> Raw.Level_bar.remove_offset_value obj name

    method set_inverted : bool -> unit =
      fun inverted -> Raw.Level_bar.set_inverted obj inverted

    method set_max_value : float -> unit =
      fun value -> Raw.Level_bar.set_max_value obj value

    method set_min_value : float -> unit =
      fun value -> Raw.Level_bar.set_min_value obj value

    method set_mode : Enums.levelbarmode -> unit =
      fun mode -> Raw.Level_bar.set_mode obj mode

    method set_value : float -> unit =
      fun value -> Raw.Level_bar.set_value obj value

    method as_level_bar = obj
  end

let new_ () : level_bar_t = new level_bar (Raw.Level_bar.new_ ())

let new_for_interval (min_value : float) (max_value : float) : level_bar_t =
  let obj_ = Raw.Level_bar.new_for_interval min_value max_value in
  new level_bar obj_
