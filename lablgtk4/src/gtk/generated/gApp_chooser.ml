(* High-level class for AppChooser *)
class app_chooser (obj : App_chooser.t) = object (self)

  method refresh : unit -> unit = fun () -> (App_chooser.refresh obj )

    method as_app_chooser = obj
end

