class type recent_data_t = object
  method set_display_name : string -> unit
  method set_description : string -> unit
  method set_mime_type : string -> unit
  method set_app_name : string -> unit
  method set_app_exec : string -> unit
  method set_groups : string array -> unit
  method set_is_private : bool -> unit
  method as_recent_data : Recent_data.t
end

(* High-level class for RecentData *)
class recent_data (obj : Recent_data.t) : recent_data_t =
  object (self)
    method set_display_name : string -> unit =
      fun v -> Recent_data.set_display_name obj v

    method set_description : string -> unit =
      fun v -> Recent_data.set_description obj v

    method set_mime_type : string -> unit =
      fun v -> Recent_data.set_mime_type obj v

    method set_app_name : string -> unit =
      fun v -> Recent_data.set_app_name obj v

    method set_app_exec : string -> unit =
      fun v -> Recent_data.set_app_exec obj v

    method set_groups : string array -> unit =
      fun v -> Recent_data.set_groups obj v

    method set_is_private : bool -> unit =
      fun v -> Recent_data.set_is_private obj v

    method as_recent_data = obj
  end

let make (display_name : string) (description : string) (mime_type : string)
    (app_name : string) (app_exec : string) (groups : string array)
    (is_private : bool) : recent_data_t =
  new recent_data
    (Recent_data.make display_name description mime_type app_name app_exec
       groups is_private)
