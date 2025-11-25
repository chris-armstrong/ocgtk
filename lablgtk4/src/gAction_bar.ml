(* High-level class for ActionBar *)
class action_bar_skel (obj : Action_bar.t) = object (self)
  inherit GObj.widget_impl (Action_bar.as_widget obj)

end

class action_bar obj = object
  inherit action_bar_skel obj
end
