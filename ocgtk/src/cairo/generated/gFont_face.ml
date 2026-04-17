class type font_face_t = object
  method as_font_face : Font_face.t
end

(* High-level class for FontFace *)
class font_face (obj : Font_face.t) : font_face_t =
  object (self)
    method as_font_face = obj
  end
