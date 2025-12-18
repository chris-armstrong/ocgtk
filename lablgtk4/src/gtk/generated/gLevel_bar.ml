(* Signal class defined in glevel_bar_signals.ml *)

(* High-level class for LevelBar *)
class level_bar (obj : Level_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Level_bar.as_widget obj)
  inherit Glevel_bar_signals.level_bar_signals obj

  method add_offset_value : string -> float -> unit = fun name value -> (Level_bar.add_offset_value obj name value)

  method get_inverted : unit -> bool = fun () -> (Level_bar.get_inverted obj )

  method get_max_value : unit -> float = fun () -> (Level_bar.get_max_value obj )

  method get_min_value : unit -> float = fun () -> (Level_bar.get_min_value obj )

  method get_mode : unit -> Gtk_enums.levelbarmode = fun () -> (Level_bar.get_mode obj )

  method get_value : unit -> float = fun () -> (Level_bar.get_value obj )

  method remove_offset_value : string option -> unit = fun name -> (Level_bar.remove_offset_value obj name)

  method set_inverted : bool -> unit = fun inverted -> (Level_bar.set_inverted obj inverted)

  method set_max_value : float -> unit = fun value -> (Level_bar.set_max_value obj value)

  method set_min_value : float -> unit = fun value -> (Level_bar.set_min_value obj value)

  method set_mode : Gtk_enums.levelbarmode -> unit = fun mode -> (Level_bar.set_mode obj mode)

  method set_value : float -> unit = fun value -> (Level_bar.set_value obj value)

  method as_widget = (Level_bar.as_widget obj)
    method as_level_bar = obj
end

