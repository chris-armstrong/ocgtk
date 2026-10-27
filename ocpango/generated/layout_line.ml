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

(* High-level class for LayoutLine *)
class layout_line (obj : Raw.Layout_line.t) : layout_line_t =
  object (self)
    method get_length : unit -> int = fun () -> Raw.Layout_line.get_length obj

    method get_resolved_direction : unit -> Enums.direction =
      fun () -> Raw.Layout_line.get_resolved_direction obj

    method get_start_index : unit -> int =
      fun () -> Raw.Layout_line.get_start_index obj

    method is_paragraph_start : unit -> bool =
      fun () -> Raw.Layout_line.is_paragraph_start obj

    method ref : unit -> Raw.Layout_line.t option =
      fun () -> Raw.Layout_line.ref obj

    method as_layout_line = obj
  end
