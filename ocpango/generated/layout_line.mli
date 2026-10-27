(** A [PangoLayoutLine] represents one of the lines resulting from laying out a
    paragraph via [PangoLayout].

    [PangoLayoutLine] structures are obtained by calling [Pango.Layout.get_line]
    and are only valid until the text, attributes, or settings of the parent
    [PangoLayout] are modified.

    Its methods, signals and properties are on {!class-type-layout_line_t}. The
    functions it is built on are in {!Ocpango.Raw.Layout_line}. *)

(** The methods, signals and properties of a [PangoLayoutLine]. *)
class type layout_line_t = object
  method get_length : unit -> int
  (** Returns the length of the line, in bytes. *)

  method get_resolved_direction : unit -> Enums.direction
  (** Returns the resolved direction of the line. *)

  method get_start_index : unit -> int
  (** Returns the start index of the line, as byte index into the text of the
      layout. *)

  method is_paragraph_start : unit -> bool
  (** Returns whether this is the first line of the paragraph. *)

  method ref : unit -> Raw.Layout_line.t option
  (** Increase the reference count of a [PangoLayoutLine] by one. *)

  method as_layout_line : Raw.Layout_line.t
end

class layout_line : Raw.Layout_line.t -> layout_line_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Layout_line.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoLayoutLine], give one already wrapped. *)
