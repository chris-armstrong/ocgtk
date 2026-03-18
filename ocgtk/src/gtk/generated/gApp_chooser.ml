(* High-level class for AppChooser *)
class app_chooser (obj : App_chooser.t) = object (self)

  method get_app_info : unit -> Ocgtk_gio.Gio.app_info option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.app_info ret) (App_chooser.get_app_info obj)

  method get_content_type : unit -> string =
    fun () ->
      (App_chooser.get_content_type obj)

  method refresh : unit -> unit =
    fun () ->
      (App_chooser.refresh obj)

    method as_app_chooser = obj
end

