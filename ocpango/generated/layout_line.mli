(** A [PangoLayoutLine] represents one of the lines resulting from laying out a
    paragraph via [PangoLayout].

    Its methods, signals and properties are on {!class-type-layout_line_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Layout_line}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LayoutLine].}

    A [PangoLayoutLine] represents one of the lines resulting from laying out a
    paragraph via [PangoLayout].

    [PangoLayoutLine] structures are obtained by calling [Pango.Layout.get_line]
    and are only valid until the text, attributes, or settings of the parent
    [PangoLayout] are modified. *)
class type layout_line_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_layout_line : Raw.Layout_line.t
end

class layout_line : Raw.Layout_line.t -> layout_line_t
(** Wraps a raw handle of {!Ocpango.Raw.Layout_line.t}. *)

(** {1:description Description}

    A [PangoLayoutLine] represents one of the lines resulting from laying out a
    paragraph via [PangoLayout].

    [PangoLayoutLine] structures are obtained by calling [Pango.Layout.get_line]
    and are only valid until the text, attributes, or settings of the parent
    [PangoLayout] are modified. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
