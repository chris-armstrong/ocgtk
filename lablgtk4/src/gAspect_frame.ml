(* High-level class for AspectFrame *)
class aspect_frame_skel (obj : Aspect_frame.t) = object (self)
  inherit GObj.widget_impl (Aspect_frame.as_widget obj)

end

class aspect_frame obj = object
  inherit aspect_frame_skel obj
end
