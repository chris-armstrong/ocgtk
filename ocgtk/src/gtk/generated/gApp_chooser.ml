class type app_chooser_t = object
    method get_app_info : unit -> Ocgtk_gio.Gio.App_info.app_info_t option
    method get_content_type : unit -> string
    method refresh : unit -> unit
    method as_app_chooser : App_chooser.t
end

(* High-level class for AppChooser *)
class app_chooser (obj : App_chooser.t) : app_chooser_t = object (self)

  method get_app_info : unit -> Ocgtk_gio.Gio.App_info.app_info_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.App_info.app_info ret) (App_chooser.get_app_info obj)

  method get_content_type : unit -> string =
    fun () ->
      (App_chooser.get_content_type obj)

  method refresh : unit -> unit =
    fun () ->
      (App_chooser.refresh obj)

    method as_app_chooser = obj
end

