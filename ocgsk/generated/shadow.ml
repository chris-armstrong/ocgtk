class type shadow_t = object
  method as_shadow : Shadow.t
end

(* High-level class for Shadow *)
class shadow (obj : Shadow.t) : shadow_t =
  object (self)
    method as_shadow = obj
  end
