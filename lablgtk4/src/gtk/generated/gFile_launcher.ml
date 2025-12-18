(* High-level class for FileLauncher *)
class file_launcher (obj : File_launcher.t) = object (self)

  method always_ask = File_launcher.get_always_ask obj
  method set_always_ask v = File_launcher.set_always_ask obj v

  method writable = File_launcher.get_writable obj
  method set_writable v = File_launcher.set_writable obj v

    method as_file_launcher = obj
end

