(* Signal class defined in gbutton_signals.ml *)

(* High-level class for Button *)
class button (obj : Button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Button.as_widget obj)
  inherit Gbutton_signals.button_signals obj

  method get_can_shrink : unit -> bool = fun () -> (Button.get_can_shrink obj )

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Button.get_child obj )

  method get_has_frame : unit -> bool = fun () -> (Button.get_has_frame obj )

  method get_icon_name : unit -> string option = fun () -> (Button.get_icon_name obj )

  method get_label : unit -> string option = fun () -> (Button.get_label obj )

  method get_use_underline : unit -> bool = fun () -> (Button.get_use_underline obj )

  method set_can_shrink : bool -> unit = fun can_shrink -> (Button.set_can_shrink obj can_shrink)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Button.set_child obj child)

  method set_has_frame : bool -> unit = fun has_frame -> (Button.set_has_frame obj has_frame)

  method set_icon_name : string -> unit = fun icon_name -> (Button.set_icon_name obj icon_name)

  method set_label : string -> unit = fun label -> (Button.set_label obj label)

  method set_use_underline : bool -> unit = fun use_underline -> (Button.set_use_underline obj use_underline)

  method as_widget = (Button.as_widget obj)
    method as_button = obj
end

