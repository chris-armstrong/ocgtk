class type simd4_x4_f_t = object
    method as_simd4_x4_f : Simd4_x4_f.t
end

(* High-level class for Simd4X4F *)
class simd4_x4_f (obj : Simd4_x4_f.t) : simd4_x4_f_t = object (self)

    method as_simd4_x4_f = obj
end

