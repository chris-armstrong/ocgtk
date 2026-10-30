class type simd4_f_t = object
  (** {2:conversions Conversions} *)

  method as_simd4_f : Raw.Simd4_f.t
end

(* High-level class for Simd4F *)
class simd4_f (obj : Raw.Simd4_f.t) : simd4_f_t =
  object (self)
    method as_simd4_f = obj
  end
