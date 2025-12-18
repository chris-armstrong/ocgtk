(* Signal class defined in gexpander_signals.ml *)

(* High-level class for Expander *)
class expander (obj : Expander.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Expander.as_widget obj)
  inherit Gexpander_signals.expander_signals obj

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Expander.get_child obj )

  method get_expanded : unit -> bool = fun () -> (Expander.get_expanded obj )

  method get_label : unit -> string option = fun () -> (Expander.get_label obj )

  method get_label_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Expander.get_label_widget obj )

  method get_resize_toplevel : unit -> bool = fun () -> (Expander.get_resize_toplevel obj )

  method get_use_markup : unit -> bool = fun () -> (Expander.get_use_markup obj )

  method get_use_underline : unit -> bool = fun () -> (Expander.get_use_underline obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Expander.set_child obj child)

  method set_expanded : bool -> unit = fun expanded -> (Expander.set_expanded obj expanded)

  method set_label : string option -> unit = fun label -> (Expander.set_label obj label)

  method set_label_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun label_widget ->
      let label_widget = Option.map (fun (c) -> c#as_widget) label_widget in
      (Expander.set_label_widget obj label_widget)

  method set_resize_toplevel : bool -> unit = fun resize_toplevel -> (Expander.set_resize_toplevel obj resize_toplevel)

  method set_use_markup : bool -> unit = fun use_markup -> (Expander.set_use_markup obj use_markup)

  method set_use_underline : bool -> unit = fun use_underline -> (Expander.set_use_underline obj use_underline)

  method as_widget = (Expander.as_widget obj)
    method as_expander = obj
end

