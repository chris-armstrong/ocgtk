class type font_face_t = object
    method as_font_face : Font_face.t
end

class font_face : Font_face.t -> font_face_t

