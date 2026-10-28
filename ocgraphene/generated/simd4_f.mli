(** Bindings for [Simd4F].

    Its methods, signals and properties are on {!class-type-simd4_f_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Simd4_f}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Simd4F].} *)
class type simd4_f_t = object
  (** {2:conversions Conversions} *)

  method as_simd4_f : Raw.Simd4_f.t
end

class simd4_f : Raw.Simd4_f.t -> simd4_f_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Simd4_f.t}. *)
