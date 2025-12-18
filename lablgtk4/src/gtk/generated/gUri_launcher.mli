class uri_launcher : Uri_launcher.t ->
  object
    method uri : string
    method set_uri : string -> unit
    method as_uri_launcher : Uri_launcher.t
  end

