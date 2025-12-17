(* Signal class defined in gpaned_signals.ml *)

(* High-level class for Paned *)
class paned (obj : Paned.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Paned.as_widget obj)
  inherit Gpaned_signals.paned_signals obj

  method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_end_child obj )

  method get_position : unit -> int = fun () -> (Paned.get_position obj )

  method get_resize_end_child : unit -> bool = fun () -> (Paned.get_resize_end_child obj )

  method get_resize_start_child : unit -> bool = fun () -> (Paned.get_resize_start_child obj )

  method get_shrink_end_child : unit -> bool = fun () -> (Paned.get_shrink_end_child obj )

  method get_shrink_start_child : unit -> bool = fun () -> (Paned.get_shrink_start_child obj )

  method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_start_child obj )

  method get_wide_handle : unit -> bool = fun () -> (Paned.get_wide_handle obj )

  method set_end_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_end_child obj child)

  method set_position : int -> unit = fun position -> (Paned.set_position obj position)

  method set_resize_end_child : bool -> unit = fun resize -> (Paned.set_resize_end_child obj resize)

  method set_resize_start_child : bool -> unit = fun resize -> (Paned.set_resize_start_child obj resize)

  method set_shrink_end_child : bool -> unit = fun resize -> (Paned.set_shrink_end_child obj resize)

  method set_shrink_start_child : bool -> unit = fun resize -> (Paned.set_shrink_start_child obj resize)

  method set_start_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_start_child obj child)

  method set_wide_handle : bool -> unit = fun wide -> (Paned.set_wide_handle obj wide)

  method as_widget = (Paned.as_widget obj)
    method as_paned = obj
end

