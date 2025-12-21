class media_file : Media_file.t ->
  object
    method clear : unit -> unit
    method set_resource : string option -> unit
    method as_media_file : Media_file.t
  end

