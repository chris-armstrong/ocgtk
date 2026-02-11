
class font_face : Font_face_and__font_family.Font_face.t ->
  object
    method describe : unit -> Font_description.t
    method get_face_name : unit -> string
    method get_family : unit -> font_family
    method is_synthesized : unit -> bool
    method as_font_face : Font_face_and__font_family.Font_face.t
  end

and font_family : Font_face_and__font_family.Font_family.t ->
  object
    method get_face : string option -> font_face option
    method get_name : unit -> string
    method is_monospace : unit -> bool
    method is_variable : unit -> bool
    method n_items : int
    method as_font_family : Font_face_and__font_family.Font_family.t
  end
