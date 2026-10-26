class type initable_t = object
  method init : Cancellable.cancellable_t option -> (bool, GError.t) result
  method as_initable : Raw.Initable.t
end

(* High-level class for Initable *)
class initable (obj : Raw.Initable.t) : initable_t =
  object (self)
    method init : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Initable.init obj cancellable

    method as_initable = obj
  end
