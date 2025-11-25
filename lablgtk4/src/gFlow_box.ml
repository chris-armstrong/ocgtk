(* High-level class for FlowBox *)
class flow_box_skel (obj : Flow_box.t) = object (self)
  inherit GObj.widget_impl (Flow_box.as_widget obj)

end

class flow_box obj = object
  inherit flow_box_skel obj
end
