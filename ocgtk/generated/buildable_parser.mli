(** A sub-parser for [GtkBuildable] implementations.

    Its methods, signals and properties are on {!class-type-buildable_parser_t}.
    The functions it is built on are in {!Ocgtk.Raw.Buildable_parser}. *)

(** The methods, signals and properties of a [GtkBuildableParser]. *)
class type buildable_parser_t = object
  method as_buildable_parser : Raw.Buildable_parser.t
end

class buildable_parser : Raw.Buildable_parser.t -> buildable_parser_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Buildable_parser.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkBuildableParser], give one already wrapped. *)
