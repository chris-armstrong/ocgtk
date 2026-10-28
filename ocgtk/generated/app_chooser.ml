class type app_chooser_t = object
  (** {2:methods Methods} *)

  method get_app_info : unit -> Ocgio.App_info.app_info_t option
  (** Returns the currently selected application. *)

  method get_content_type : unit -> string
  (** Returns the content type for which the [GtkAppChooser] shows applications.
  *)

  method refresh : unit -> unit
  (** Reloads the list of applications. *)

  (** {2:conversions Conversions} *)

  method as_app_chooser : Raw.App_chooser.t
end

(* High-level class for AppChooser *)
class app_chooser (obj : Raw.App_chooser.t) : app_chooser_t =
  object (self)
    method get_app_info : unit -> Ocgio.App_info.app_info_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.App_info.app_info ret)
          (Raw.App_chooser.get_app_info obj)

    method get_content_type : unit -> string =
      fun () -> Raw.App_chooser.get_content_type obj

    method refresh : unit -> unit = fun () -> Raw.App_chooser.refresh obj
    method as_app_chooser = obj
  end
