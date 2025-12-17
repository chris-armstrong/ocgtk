(* High-level class for RecentInfo *)
class recent_info (obj : Recent_info.t) = object (self)

  method exists : unit -> bool = fun () -> (Recent_info.exists obj )

  method get_age : unit -> int = fun () -> (Recent_info.get_age obj )

  method get_description : unit -> string = fun () -> (Recent_info.get_description obj )

  method get_display_name : unit -> string = fun () -> (Recent_info.get_display_name obj )

  method get_mime_type : unit -> string = fun () -> (Recent_info.get_mime_type obj )

  method get_private_hint : unit -> bool = fun () -> (Recent_info.get_private_hint obj )

  method get_uri : unit -> string = fun () -> (Recent_info.get_uri obj )

  method has_application : string -> bool = fun app_name -> (Recent_info.has_application obj app_name)

  method has_group : string -> bool = fun group_name -> (Recent_info.has_group obj group_name)

  method is_local : unit -> bool = fun () -> (Recent_info.is_local obj )

  method match_ : Recent_info.t -> bool = fun info_b -> (Recent_info.match_ obj info_b)

  method ref : unit -> Recent_info.t = fun () -> (Recent_info.ref obj )

  method unref : unit -> unit = fun () -> (Recent_info.unref obj )

    method as_recent_info = obj
end

