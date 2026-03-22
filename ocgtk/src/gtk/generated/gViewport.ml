class type viewport_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_scroll_to_focus : unit -> bool
    method scroll_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Scroll_info.t option -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_scroll_to_focus : bool -> unit
    method as_viewport : Viewport.t
end

(* High-level class for Viewport *)
class viewport (obj : Viewport.t) : viewport_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Viewport.get_child obj)

  method get_scroll_to_focus : unit -> bool =
    fun () ->
      (Viewport.get_scroll_to_focus obj)

  method scroll_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Scroll_info.t option -> unit =
    fun descendant scroll ->
      let descendant = descendant#as_widget in
      (Viewport.scroll_to obj descendant scroll)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Viewport.set_child obj child)

  method set_scroll_to_focus : bool -> unit =
    fun scroll_to_focus ->
      (Viewport.set_scroll_to_focus obj scroll_to_focus)

    method as_viewport = obj
end

let new_ (hadjustment : GAdjustment.adjustment_t option) (vadjustment : GAdjustment.adjustment_t option) : viewport_t =
  let hadjustment = Option.map (fun c -> c#as_adjustment) hadjustment in
  let vadjustment = Option.map (fun c -> c#as_adjustment) vadjustment in
  new viewport (Viewport.new_ hadjustment vadjustment)

