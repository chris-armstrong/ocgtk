class type buildable_parser_t = object
  method as_buildable_parser : Buildable_parser.t
end

(* High-level class for BuildableParser *)
class buildable_parser (obj : Buildable_parser.t) : buildable_parser_t =
  object (self)
    method as_buildable_parser = obj
  end
