(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type font_face_t = object
  method describe : unit -> Raw.Font_description.t
  method get_face_name : unit -> string
  method get_family : unit -> font_family_t
  method is_synthesized : unit -> bool
  method as_font_face : Raw.Font_face.t
end

and font_family_t = object
  inherit Ocgio.List_model.list_model_t
  method get_face : string option -> font_face_t option
  method get_name : unit -> string
  method is_monospace : unit -> bool
  method is_variable : unit -> bool
  method item_type : Gobject.Type.t
  method n_items : int
  method as_font_family : Raw.Font_family.t
end

class font_face (obj : Raw.Font_face.t) : font_face_t =
  object (self)
    method describe : unit -> Raw.Font_description.t =
      fun () -> Raw.Font_face.describe obj

    method get_face_name : unit -> string =
      fun () -> Raw.Font_face.get_face_name obj

    method get_family : unit -> font_family_t =
      fun () -> new font_family (Raw.Font_face.get_family obj)

    method is_synthesized : unit -> bool =
      fun () -> Raw.Font_face.is_synthesized obj

    method as_font_face = obj
  end

and font_family (obj : Raw.Font_family.t) : font_family_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_face : string option -> font_face_t option =
      fun name ->
        Option.map
          (fun ret -> new font_face ret)
          (Raw.Font_family.get_face obj name)

    method get_name : unit -> string = fun () -> Raw.Font_family.get_name obj

    method is_monospace : unit -> bool =
      fun () -> Raw.Font_family.is_monospace obj

    method is_variable : unit -> bool =
      fun () -> Raw.Font_family.is_variable obj

    method item_type = Raw.Font_family.get_item_type obj
    method n_items = Raw.Font_family.get_n_items obj
    method as_font_family = obj
  end
