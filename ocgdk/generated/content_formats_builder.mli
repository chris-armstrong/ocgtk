(** Creates [GdkContentFormats] objects.

    Its methods, signals and properties are on
    {!class-type-content_formats_builder_t}. The functions it is built on are in
    {!Ocgdk.Raw.Content_formats_builder}. *)

(** The methods, signals and properties of a [GdkContentFormatsBuilder]. *)
class type content_formats_builder_t = object
  method add_formats : Raw.Content_formats.t -> unit
  method add_gtype : Gobject.Type.t -> unit
  method add_mime_type : string -> unit
  method ref : unit -> Raw.Content_formats_builder.t
  method to_formats : unit -> Raw.Content_formats.t
  method as_content_formats_builder : Raw.Content_formats_builder.t
end

class content_formats_builder :
  Raw.Content_formats_builder.t ->
  content_formats_builder_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_formats_builder.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkContentFormatsBuilder], give one already wrapped.
*)

val new_ : unit -> content_formats_builder_t
