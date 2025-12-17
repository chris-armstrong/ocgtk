(* High-level class for Settings *)
class settings (obj : Settings.t) = object (self)

  method reset_property : string -> unit = fun name -> (Settings.reset_property obj name)

    method as_settings = obj
end

