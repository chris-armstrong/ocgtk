(* High-level class for AppChooser *)
class app_chooser (obj : App_chooser.t) = object (self)

  method content_type = App_chooser.get_content_type obj

  method refresh : unit -> unit = fun () -> (App_chooser.refresh obj )

    method as_app_chooser = obj
end

