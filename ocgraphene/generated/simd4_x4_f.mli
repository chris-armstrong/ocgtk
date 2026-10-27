(** Bindings for [graphene_simd4x4f_t].

    Its methods, signals and properties are on {!class-type-simd4_x4_f_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Simd4_x4_f}. *)

(** The methods, signals and properties of a [graphene_simd4x4f_t]. *)
class type simd4_x4_f_t = object
  method as_simd4_x4_f : Raw.Simd4_x4_f.t
end

class simd4_x4_f : Raw.Simd4_x4_f.t -> simd4_x4_f_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Simd4_x4_f.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [graphene_simd4x4f_t], give one already wrapped. *)
