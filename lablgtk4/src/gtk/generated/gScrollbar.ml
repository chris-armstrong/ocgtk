(* High-level class for Scrollbar *)
class scrollbar (obj : Scrollbar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Scrollbar.as_widget obj)

  method get_adjustment : unit -> GAdjustment.adjustment =
    fun () ->
      new  GAdjustment.adjustment(Scrollbar.get_adjustment obj)

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit =
    fun adjustment ->
      let adjustment = Option.map (fun (c) -> c#as_adjustment) adjustment in
      (Scrollbar.set_adjustment obj adjustment)

  method as_widget = (Scrollbar.as_widget obj)
    method as_scrollbar = obj
end

