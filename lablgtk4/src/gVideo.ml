(* High-level class for Video *)
class video_skel (obj : Video.t) = object (self)
  inherit GObj.widget_impl (Video.as_widget obj)

end

class video obj = object
  inherit video_skel obj
end
