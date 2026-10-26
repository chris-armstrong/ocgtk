class type recent_info_t = object
  method create_app_info :
    string option -> (Ocgio.App_info.app_info_t option, GError.t) result

  method exists : unit -> bool
  method get_age : unit -> int
  method get_description : unit -> string
  method get_display_name : unit -> string
  method get_gicon : unit -> Ocgio.Icon.icon_t option
  method get_mime_type : unit -> string
  method get_private_hint : unit -> bool
  method get_short_name : unit -> string
  method get_uri : unit -> string
  method get_uri_display : unit -> string option
  method has_application : string -> bool
  method has_group : string -> bool
  method is_local : unit -> bool
  method last_application : unit -> string
  method match_ : Raw.Recent_info.t -> bool
  method ref : unit -> Raw.Recent_info.t
  method as_recent_info : Raw.Recent_info.t
end

(* High-level class for RecentInfo *)
class recent_info (obj : Raw.Recent_info.t) : recent_info_t =
  object (self)
    method create_app_info :
        string option -> (Ocgio.App_info.app_info_t option, GError.t) result =
      fun app_name ->
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgio.App_info.app_info ret) ret)
          (Raw.Recent_info.create_app_info obj app_name)

    method exists : unit -> bool = fun () -> Raw.Recent_info.exists obj
    method get_age : unit -> int = fun () -> Raw.Recent_info.get_age obj

    method get_description : unit -> string =
      fun () -> Raw.Recent_info.get_description obj

    method get_display_name : unit -> string =
      fun () -> Raw.Recent_info.get_display_name obj

    method get_gicon : unit -> Ocgio.Icon.icon_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Icon.icon ret)
          (Raw.Recent_info.get_gicon obj)

    method get_mime_type : unit -> string =
      fun () -> Raw.Recent_info.get_mime_type obj

    method get_private_hint : unit -> bool =
      fun () -> Raw.Recent_info.get_private_hint obj

    method get_short_name : unit -> string =
      fun () -> Raw.Recent_info.get_short_name obj

    method get_uri : unit -> string = fun () -> Raw.Recent_info.get_uri obj

    method get_uri_display : unit -> string option =
      fun () -> Raw.Recent_info.get_uri_display obj

    method has_application : string -> bool =
      fun app_name -> Raw.Recent_info.has_application obj app_name

    method has_group : string -> bool =
      fun group_name -> Raw.Recent_info.has_group obj group_name

    method is_local : unit -> bool = fun () -> Raw.Recent_info.is_local obj

    method last_application : unit -> string =
      fun () -> Raw.Recent_info.last_application obj

    method match_ : Raw.Recent_info.t -> bool =
      fun info_b -> Raw.Recent_info.match_ obj info_b

    method ref : unit -> Raw.Recent_info.t = fun () -> Raw.Recent_info.ref obj
    method as_recent_info = obj
  end
