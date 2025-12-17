(* High-level class for WidgetClass *)
class widget_class (obj : Widget_class.t) = object (self)

  method add_shortcut : 'p1. (#GShortcut.shortcut as 'p1) -> unit = fun shortcut -> (Widget_class.add_shortcut obj ( shortcut#as_shortcut ))

  method get_accessible_role : unit -> Gtk_enums.accessiblerole = fun () -> (Widget_class.get_accessible_role obj )

  method get_activate_signal : unit -> int = fun () -> (Widget_class.get_activate_signal obj )

  method get_css_name : unit -> string = fun () -> (Widget_class.get_css_name obj )

  method install_property_action : string -> string -> unit = fun action_name property_name -> (Widget_class.install_property_action obj action_name property_name)

  method set_accessible_role : Gtk_enums.accessiblerole -> unit = fun accessible_role -> (Widget_class.set_accessible_role obj accessible_role)

  method set_activate_signal : int -> unit = fun signal_id -> (Widget_class.set_activate_signal obj signal_id)

  method set_activate_signal_from_name : string -> unit = fun signal_name -> (Widget_class.set_activate_signal_from_name obj signal_name)

  method set_css_name : string -> unit = fun name -> (Widget_class.set_css_name obj name)

  method set_template_from_resource : string -> unit = fun resource_name -> (Widget_class.set_template_from_resource obj resource_name)

  method set_template_scope : GBuilder_scope.builder_scope -> unit = fun scope -> (Widget_class.set_template_scope obj ( scope#as_builder_scope ))

    method as_widget_class = obj
end

