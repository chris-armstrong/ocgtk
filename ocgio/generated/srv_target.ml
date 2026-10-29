class type srv_target_t = object
  (** {2:methods Methods} *)

  method get_hostname : unit -> string
  (** Gets [target]'s hostname (in ASCII form; if you are going to present this
      to the user, you should use [g_hostname_is_ascii_encoded ()] to check if
      it contains encoded Unicode segments, and use [g_hostname_to_unicode ()]
      to convert it if it does.) *)

  method get_port : unit -> UInt16.t
  (** Gets [target]'s port *)

  method get_priority : unit -> UInt16.t
  (** Gets [target]'s priority. You should not need to look at this; [GResolver]
      already sorts the targets according to the algorithm in RFC 2782. *)

  method get_weight : unit -> UInt16.t
  (** Gets [target]'s weight. You should not need to look at this; [GResolver]
      already sorts the targets according to the algorithm in RFC 2782. *)

  (** {2:conversions Conversions} *)

  method as_srv_target : Raw.Srv_target.t
end

(* High-level class for SrvTarget *)
class srv_target (obj : Raw.Srv_target.t) : srv_target_t =
  object (self)
    method get_hostname : unit -> string =
      fun () -> Raw.Srv_target.get_hostname obj

    method get_port : unit -> UInt16.t = fun () -> Raw.Srv_target.get_port obj

    method get_priority : unit -> UInt16.t =
      fun () -> Raw.Srv_target.get_priority obj

    method get_weight : unit -> UInt16.t =
      fun () -> Raw.Srv_target.get_weight obj

    method as_srv_target = obj
  end

let new_ (hostname : string) (port : UInt16.t) (priority : UInt16.t)
    (weight : UInt16.t) : srv_target_t =
  let obj_ = Raw.Srv_target.new_ hostname port priority weight in
  new srv_target obj_
