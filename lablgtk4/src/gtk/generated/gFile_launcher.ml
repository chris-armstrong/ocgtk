(* High-level class for FileLauncher *)
class file_launcher (obj : File_launcher.t) = object (self)

  method get_always_ask : unit -> bool = fun () -> (File_launcher.get_always_ask obj )

  method get_writable : unit -> bool = fun () -> (File_launcher.get_writable obj )

  method set_always_ask : bool -> unit = fun always_ask -> (File_launcher.set_always_ask obj always_ask)

  method set_writable : bool -> unit = fun writable -> (File_launcher.set_writable obj writable)

    method as_file_launcher = obj
end

