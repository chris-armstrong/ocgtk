(* Signal class defined in gscrolled_window_signals.ml *)

(* High-level class for ScrolledWindow *)
class scrolled_window (obj : Scrolled_window.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Scrolled_window.as_widget obj)
  inherit Gscrolled_window_signals.scrolled_window_signals obj

  method has_frame = Scrolled_window.get_has_frame obj
  method set_has_frame v = Scrolled_window.set_has_frame obj v

  method kinetic_scrolling = Scrolled_window.get_kinetic_scrolling obj
  method set_kinetic_scrolling v = Scrolled_window.set_kinetic_scrolling obj v

  method max_content_height = Scrolled_window.get_max_content_height obj
  method set_max_content_height v = Scrolled_window.set_max_content_height obj v

  method max_content_width = Scrolled_window.get_max_content_width obj
  method set_max_content_width v = Scrolled_window.set_max_content_width obj v

  method min_content_height = Scrolled_window.get_min_content_height obj
  method set_min_content_height v = Scrolled_window.set_min_content_height obj v

  method min_content_width = Scrolled_window.get_min_content_width obj
  method set_min_content_width v = Scrolled_window.set_min_content_width obj v

  method overlay_scrolling = Scrolled_window.get_overlay_scrolling obj
  method set_overlay_scrolling v = Scrolled_window.set_overlay_scrolling obj v

  method propagate_natural_height = Scrolled_window.get_propagate_natural_height obj
  method set_propagate_natural_height v = Scrolled_window.set_propagate_natural_height obj v

  method propagate_natural_width = Scrolled_window.get_propagate_natural_width obj
  method set_propagate_natural_width v = Scrolled_window.set_propagate_natural_width obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Scrolled_window.get_child obj )

  method get_hadjustment : unit -> GAdjustment.adjustment = fun () -> new  GAdjustment.adjustment(Scrolled_window.get_hadjustment obj )

  method get_hscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scrolled_window.get_hscrollbar obj )

  method get_placement : unit -> Gtk_enums.cornertype = fun () -> (Scrolled_window.get_placement obj )

  method get_vadjustment : unit -> GAdjustment.adjustment = fun () -> new  GAdjustment.adjustment(Scrolled_window.get_vadjustment obj )

  method get_vscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scrolled_window.get_vscrollbar obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Scrolled_window.set_child obj child)

  method set_hadjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit = fun hadjustment -> (Scrolled_window.set_hadjustment obj ( hadjustment |> Option.map (fun x -> x#as_adjustment) ))

  method set_placement : Gtk_enums.cornertype -> unit = fun window_placement -> (Scrolled_window.set_placement obj window_placement)

  method set_policy : Gtk_enums.policytype -> Gtk_enums.policytype -> unit = fun hscrollbar_policy vscrollbar_policy -> (Scrolled_window.set_policy obj hscrollbar_policy vscrollbar_policy)

  method set_vadjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit = fun vadjustment -> (Scrolled_window.set_vadjustment obj ( vadjustment |> Option.map (fun x -> x#as_adjustment) ))

  method unset_placement : unit -> unit = fun () -> (Scrolled_window.unset_placement obj )

  method as_widget = (Scrolled_window.as_widget obj)
    method as_scrolled_window = obj
end

