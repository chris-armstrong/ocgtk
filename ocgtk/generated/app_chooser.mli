class type app_chooser_t = object
  method get_app_info : unit -> Ocgio.App_info.app_info_t option
  method get_content_type : unit -> string
  method refresh : unit -> unit
  method as_app_chooser : Raw.App_chooser.t
end

class app_chooser : Raw.App_chooser.t -> app_chooser_t
