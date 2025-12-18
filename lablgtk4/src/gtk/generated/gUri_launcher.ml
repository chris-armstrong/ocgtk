(* High-level class for UriLauncher *)
class uri_launcher (obj : Uri_launcher.t) = object (self)

  method uri = Uri_launcher.get_uri obj
  method set_uri v = Uri_launcher.set_uri obj v

    method as_uri_launcher = obj
end

