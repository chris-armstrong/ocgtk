class vfs : Vfs.t ->
  object
    method is_active : unit -> bool
    method unregister_uri_scheme : string -> bool
    method as_vfs : Vfs.t
  end

