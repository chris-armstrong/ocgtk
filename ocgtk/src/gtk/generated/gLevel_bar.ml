(* Signal class defined in glevel_bar_signals.ml *)

class type level_bar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Glevel_bar_signals.level_bar_signals
    method add_offset_value : string -> float -> unit
    method get_inverted : unit -> bool
    method get_max_value : unit -> float
    method get_min_value : unit -> float
    method get_mode : unit -> Gtk_enums.levelbarmode
    method get_value : unit -> float
    method remove_offset_value : string option -> unit
    method set_inverted : bool -> unit
    method set_max_value : float -> unit
    method set_min_value : float -> unit
    method set_mode : Gtk_enums.levelbarmode -> unit
    method set_value : float -> unit
    method as_level_bar : Level_bar.t
end

(* High-level class for LevelBar *)
class level_bar (obj : Level_bar.t) : level_bar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Glevel_bar_signals.level_bar_signals obj

  method add_offset_value : string -> float -> unit =
    fun name value ->
      (Level_bar.add_offset_value obj name value)

  method get_inverted : unit -> bool =
    fun () ->
      (Level_bar.get_inverted obj)

  method get_max_value : unit -> float =
    fun () ->
      (Level_bar.get_max_value obj)

  method get_min_value : unit -> float =
    fun () ->
      (Level_bar.get_min_value obj)

  method get_mode : unit -> Gtk_enums.levelbarmode =
    fun () ->
      (Level_bar.get_mode obj)

  method get_value : unit -> float =
    fun () ->
      (Level_bar.get_value obj)

  method remove_offset_value : string option -> unit =
    fun name ->
      (Level_bar.remove_offset_value obj name)

  method set_inverted : bool -> unit =
    fun inverted ->
      (Level_bar.set_inverted obj inverted)

  method set_max_value : float -> unit =
    fun value ->
      (Level_bar.set_max_value obj value)

  method set_min_value : float -> unit =
    fun value ->
      (Level_bar.set_min_value obj value)

  method set_mode : Gtk_enums.levelbarmode -> unit =
    fun mode ->
      (Level_bar.set_mode obj mode)

  method set_value : float -> unit =
    fun value ->
      (Level_bar.set_value obj value)

    method as_level_bar = obj
end

let new_ () : level_bar_t =
  new level_bar (Level_bar.new_ ())

let new_for_interval (min_value : float) (max_value : float) : level_bar_t =
  let obj_ = Level_bar.new_for_interval min_value max_value in
  new level_bar obj_

