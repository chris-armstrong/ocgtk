class widget_class : Widget_class.t ->
  object
    method add_shortcut : #GShortcut.shortcut -> unit
    method get_accessible_role : unit -> Gtk_enums.accessiblerole
    method get_activate_signal : unit -> int
    method get_css_name : unit -> string
    method install_property_action : string -> string -> unit
    method set_accessible_role : Gtk_enums.accessiblerole -> unit
    method set_activate_signal : int -> unit
    method set_activate_signal_from_name : string -> unit
    method set_css_name : string -> unit
    method set_template_from_resource : string -> unit
    method set_template_scope : GBuilder_scope.builder_scope -> unit
    method as_widget_class : Widget_class.t
  end

