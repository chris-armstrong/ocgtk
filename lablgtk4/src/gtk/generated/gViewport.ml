(* High-level class for Viewport *)
class viewport (obj : Viewport.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Viewport.as_widget obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Viewport.get_child obj )

  method get_scroll_to_focus : unit -> bool = fun () -> (Viewport.get_scroll_to_focus obj )

  method scroll_to : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> Scroll_info.t option -> unit =
    fun descendant scroll ->
      let descendant = descendant#as_widget in
      (Viewport.scroll_to obj descendant scroll)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Viewport.set_child obj child)

  method set_scroll_to_focus : bool -> unit = fun scroll_to_focus -> (Viewport.set_scroll_to_focus obj scroll_to_focus)

  method as_widget = (Viewport.as_widget obj)
    method as_viewport = obj
end

