(* High-level class for ProgressBar *)
class progress_bar_skel (obj : Progress_bar.t) = object (self)
  inherit GObj.widget_impl (Progress_bar.as_widget obj)

end

class progress_bar obj = object
  inherit progress_bar_skel obj
end
