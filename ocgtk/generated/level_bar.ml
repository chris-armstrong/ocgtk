class type level_bar_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_offset_changed :
    ?after:bool ->
    callback:(name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when an offset specified on the bar changes value.\n\n\
     This typically is the result of a [Gtk.LevelBar.add_offset_value]\n\
     call.\n\n\
     The signal supports detailed connections; you can connect to the\n\
     detailed signal \"changed::x\" in order to only receive callbacks when\n\
     the value of offset \"x\" changes."]

  (** {2:methods Methods} *)

  method add_offset_value : string -> float -> unit
  (** Adds a new offset marker on [self] at the position specified by [value].

      When the bar value is in the interval topped by [value] (or between
      [value] and [Gtk.LevelBar:max-value] in case the offset is the last one on
      the bar) a style class named [level-][name] will be applied when rendering
      the level bar fill.

      If another offset marker named [name] exists, its value will be replaced
      by [value]. *)

  method get_inverted : unit -> bool
  (** Returns whether the levelbar is inverted. *)

  method get_max_value : unit -> float
  (** Returns the [max-value] of the [GtkLevelBar]. *)

  method get_min_value : unit -> float
  (** Returns the [min-value] of the [GtkLevelBar]. *)

  method get_mode : unit -> Enums.levelbarmode
  (** Returns the [mode] of the [GtkLevelBar]. *)

  method get_value : unit -> float
  (** Returns the [value] of the [GtkLevelBar]. *)

  method remove_offset_value : string option -> unit
  (** Removes an offset marker from a [GtkLevelBar].

      The marker must have been previously added with
      [Gtk.LevelBar.add_offset_value]. *)

  method set_inverted : bool -> unit
  (** Sets whether the [GtkLevelBar] is inverted. *)

  method set_max_value : float -> unit
  (** Sets the [max-value] of the [GtkLevelBar].

      You probably want to update preexisting level offsets after calling this
      function. *)

  method set_min_value : float -> unit
  (** Sets the [min-value] of the [GtkLevelBar].

      You probably want to update preexisting level offsets after calling this
      function. *)

  method set_mode : Enums.levelbarmode -> unit
  (** Sets the [mode] of the [GtkLevelBar]. *)

  method set_value : float -> unit
  (** Sets the value of the [GtkLevelBar]. *)

  (** {2:conversions Conversions} *)

  method as_level_bar : Raw.Level_bar.t
end

(* High-level class for LevelBar *)
class level_bar (obj : Raw.Level_bar.t) : level_bar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

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
