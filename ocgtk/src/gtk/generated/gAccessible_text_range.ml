class type accessible_text_range_t = object
  method get_start : Gsize.t
  method set_start : Gsize.t -> unit
  method get_length : Gsize.t
  method set_length : Gsize.t -> unit
  method as_accessible_text_range : Accessible_text_range.t
end

(* High-level class for AccessibleTextRange *)
class accessible_text_range (obj : Accessible_text_range.t) :
  accessible_text_range_t =
  object (self)
    method get_start : Gsize.t = Accessible_text_range.get_start obj

    method set_start : Gsize.t -> unit =
      fun v -> Accessible_text_range.set_start obj v

    method get_length : Gsize.t = Accessible_text_range.get_length obj

    method set_length : Gsize.t -> unit =
      fun v -> Accessible_text_range.set_length obj v

    method as_accessible_text_range = obj
  end

let make (start : Gsize.t) (length : Gsize.t) : accessible_text_range_t =
  new accessible_text_range (Accessible_text_range.make start length)
