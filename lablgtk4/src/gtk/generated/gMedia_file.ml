(* High-level class for MediaFile *)
class media_file (obj : Media_file.t) = object (self)

  method clear : unit -> unit = fun () -> (Media_file.clear obj )

  method set_filename : string option -> unit = fun filename -> (Media_file.set_filename obj filename)

  method set_resource : string option -> unit = fun resource_path -> (Media_file.set_resource obj resource_path)

    method as_media_file = obj
end

