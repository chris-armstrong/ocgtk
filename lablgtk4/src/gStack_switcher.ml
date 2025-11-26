(* High-level class for StackSwitcher *)
class stack_switcher_skel (obj : Stack_switcher.t) = object (self)
  inherit GObj.widget_impl (Stack_switcher.as_widget obj)

end

class stack_switcher obj = object
  inherit stack_switcher_skel obj
end
