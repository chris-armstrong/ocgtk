class uri_launcher : Uri_launcher.t ->
  object
    method get_uri : unit -> string option
    method set_uri : string option -> unit
    method as_uri_launcher : Uri_launcher.t
  end

