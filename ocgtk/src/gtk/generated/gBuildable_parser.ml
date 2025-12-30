(* High-level class for BuildableParser *)
class buildable_parser (obj : Buildable_parser.t) = object (self)

    method as_buildable_parser = obj
end

