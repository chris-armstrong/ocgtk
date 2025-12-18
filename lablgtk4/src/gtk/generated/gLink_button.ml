(* Signal class defined in glink_button_signals.ml *)

(* High-level class for LinkButton *)
class link_button (obj : Link_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Link_button.as_widget obj)
  inherit Glink_button_signals.link_button_signals obj

  method uri = Link_button.get_uri obj
  method set_uri v = Link_button.set_uri obj v

  method visited = Link_button.get_visited obj
  method set_visited v = Link_button.set_visited obj v

  method as_widget = (Link_button.as_widget obj)
    method as_link_button = obj
end

