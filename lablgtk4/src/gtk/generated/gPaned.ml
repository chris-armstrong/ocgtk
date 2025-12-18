(* Signal class defined in gpaned_signals.ml *)

(* High-level class for Paned *)
class paned (obj : Paned.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Paned.as_widget obj)
  inherit Gpaned_signals.paned_signals obj

  method max_position = Paned.get_max_position obj

  method min_position = Paned.get_min_position obj

  method position = Paned.get_position obj
  method set_position v = Paned.set_position obj v

  method position_set = Paned.get_position_set obj
  method set_position_set v = Paned.set_position_set obj v

  method resize_end_child = Paned.get_resize_end_child obj
  method set_resize_end_child v = Paned.set_resize_end_child obj v

  method resize_start_child = Paned.get_resize_start_child obj
  method set_resize_start_child v = Paned.set_resize_start_child obj v

  method shrink_end_child = Paned.get_shrink_end_child obj
  method set_shrink_end_child v = Paned.set_shrink_end_child obj v

  method shrink_start_child = Paned.get_shrink_start_child obj
  method set_shrink_start_child v = Paned.set_shrink_start_child obj v

  method wide_handle = Paned.get_wide_handle obj
  method set_wide_handle v = Paned.set_wide_handle obj v

  method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_end_child obj )

  method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_start_child obj )

  method set_end_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_end_child obj child)

  method set_start_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_start_child obj child)

  method as_widget = (Paned.as_widget obj)
    method as_paned = obj
end

