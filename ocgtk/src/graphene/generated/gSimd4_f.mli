class type simd4_f_t = object
  method as_simd4_f : Simd4_f.t
end

class simd4_f : Simd4_f.t -> simd4_f_t
