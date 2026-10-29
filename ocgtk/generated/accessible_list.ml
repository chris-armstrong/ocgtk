class type accessible_list_t = object
  (** {2:methods Methods} *)

  method get_objects : unit -> Accessible.accessible_t list
  (** Gets the list of objects this boxed type holds. *)

  (** {2:conversions Conversions} *)

  method as_accessible_list : Raw.Accessible_list.t
end

(* High-level class for AccessibleList *)
class accessible_list (obj : Raw.Accessible_list.t) : accessible_list_t =
  object (self)
    method get_objects : unit -> Accessible.accessible_t list =
      fun () ->
        (List.map (fun ret -> new Accessible.accessible ret))
          (Raw.Accessible_list.get_objects obj)

    method as_accessible_list = obj
  end

let new_from_array (accessibles : Raw.Accessible.t array)
    (n_accessibles : Gsize.t) : accessible_list_t =
  let obj_ = Raw.Accessible_list.new_from_array accessibles n_accessibles in
  new accessible_list obj_

let new_from_list (list : Raw.Accessible.t list) : accessible_list_t =
  let obj_ = Raw.Accessible_list.new_from_list list in
  new accessible_list obj_
