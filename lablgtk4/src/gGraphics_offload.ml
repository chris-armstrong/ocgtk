(* High-level class for GraphicsOffload *)
class graphics_offload_skel (obj : Graphics_offload.t) = object (self)
  inherit GObj.widget_impl (Graphics_offload.as_widget obj)

end

class graphics_offload obj = object
  inherit graphics_offload_skel obj
end
