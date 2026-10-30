class type buildable_parser_t = object
  (** {2:conversions Conversions} *)

  method as_buildable_parser : Raw.Buildable_parser.t
end

(* High-level class for BuildableParser *)
class buildable_parser (obj : Raw.Buildable_parser.t) : buildable_parser_t =
  object (self)
    method as_buildable_parser = obj
  end
