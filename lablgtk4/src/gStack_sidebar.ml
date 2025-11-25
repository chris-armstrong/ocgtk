(* High-level class for StackSidebar *)
class stack_sidebar_skel (obj : Stack_sidebar.t) = object (self)
  inherit GObj.widget_impl (Stack_sidebar.as_widget obj)

end

class stack_sidebar obj = object
  inherit stack_sidebar_skel obj
end
