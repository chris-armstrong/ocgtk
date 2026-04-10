
class type font_face_t = object
    method describe : unit -> Font_description.t
    method get_face_name : unit -> string
    method get_family : unit -> font_family_t
    method is_synthesized : unit -> bool
    method as_font_face : Font_face_and__font_family.Font_face.t
end

and font_family_t = object
    method get_face : string option -> font_face_t option
    method get_name : unit -> string
    method is_monospace : unit -> bool
    method is_variable : unit -> bool
    method item_type : int
    method n_items : int
    method as_font_family : Font_face_and__font_family.Font_family.t
end


class font_face : Font_face_and__font_family.Font_face.t -> font_face_t

and font_family : Font_face_and__font_family.Font_family.t -> font_family_t
