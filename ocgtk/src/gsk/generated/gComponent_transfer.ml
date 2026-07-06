class type component_transfer_t = object
  method as_component_transfer : Component_transfer.t
end

(* High-level class for ComponentTransfer *)
class component_transfer (obj : Component_transfer.t) : component_transfer_t =
  object (self)
    method as_component_transfer = obj
  end

let new_discrete (n : int) (values : float array) : component_transfer_t =
  let obj_ = Component_transfer.new_discrete n values in
  new component_transfer obj_

let new_gamma (amp : float) (exp : float) (ofs : float) : component_transfer_t =
  let obj_ = Component_transfer.new_gamma amp exp ofs in
  new component_transfer obj_

let new_identity () : component_transfer_t =
  new component_transfer (Component_transfer.new_identity ())

let new_levels (n : float) : component_transfer_t =
  let obj_ = Component_transfer.new_levels n in
  new component_transfer obj_

let new_linear (m : float) (b : float) : component_transfer_t =
  let obj_ = Component_transfer.new_linear m b in
  new component_transfer obj_

let new_table (n : int) (values : float array) : component_transfer_t =
  let obj_ = Component_transfer.new_table n values in
  new component_transfer obj_
