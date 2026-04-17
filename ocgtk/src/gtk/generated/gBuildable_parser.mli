class type buildable_parser_t = object
    method as_buildable_parser : Buildable_parser.t
end

class buildable_parser : Buildable_parser.t -> buildable_parser_t

