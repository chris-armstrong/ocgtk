(* High-level class for Tooltip *)
class tooltip (obj : Tooltip.t) = object (self)

  method set_custom : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun custom_widget ->
      let custom_widget = Option.map (fun (c) -> c#as_widget) custom_widget in
      (Tooltip.set_custom obj custom_widget)

  method set_icon_from_icon_name : string option -> unit = fun icon_name -> (Tooltip.set_icon_from_icon_name obj icon_name)

  method set_markup : string option -> unit = fun markup -> (Tooltip.set_markup obj markup)

  method set_text : string option -> unit = fun text -> (Tooltip.set_text obj text)

    method as_tooltip = obj
end

