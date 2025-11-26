(* High-level class for FlowBoxChild *)
class flow_box_child_skel (obj : Flow_box_child.t) = object (self)
  inherit GObj.widget_impl (Flow_box_child.as_widget obj)

end

class flow_box_child obj = object
  inherit flow_box_child_skel obj
end
