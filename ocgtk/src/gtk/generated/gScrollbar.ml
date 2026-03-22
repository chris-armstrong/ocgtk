class type scrollbar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t option -> unit
    method as_scrollbar : Scrollbar.t
end

(* High-level class for Scrollbar *)
class scrollbar (obj : Scrollbar.t) : scrollbar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_adjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Scrollbar.get_adjustment obj)

  method set_adjustment : GAdjustment.adjustment_t option -> unit =
    fun adjustment ->
      let adjustment = Option.map (fun (c) -> c#as_adjustment) adjustment in
      (Scrollbar.set_adjustment obj adjustment)

    method as_scrollbar = obj
end

