(** Provides context for parsing GtkBuilder UI files.

    [GtkBuildableParseContext] is an opaque struct.

    Its methods, signals and properties are on
    {!class-type-buildable_parse_context_t}. The functions it is built on are in
    {!Ocgtk.Raw.Buildable_parse_context}. *)

(** The methods, signals and properties of a [GtkBuildableParseContext]. *)
class type buildable_parse_context_t = object
  method get_element : unit -> string option
  method get_element_stack : unit -> string array
  method as_buildable_parse_context : Raw.Buildable_parse_context.t
end

class buildable_parse_context :
  Raw.Buildable_parse_context.t ->
  buildable_parse_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Buildable_parse_context.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkBuildableParseContext], give one already wrapped.
*)
