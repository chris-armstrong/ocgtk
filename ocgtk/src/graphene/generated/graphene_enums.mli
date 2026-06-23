(* GENERATED CODE - DO NOT EDIT *)
(* Graphene Enumeration and Bitfield Types *)

(* EulerOrder - enumeration *)
type eulerorder = [
  (** Rotate in the default order; the
  default order is one of the following enumeration values *)
  | `DEFAULT
  (** Rotate in the X, Y, and Z order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXYZ *)
  | `XYZ
  (** Rotate in the Y, Z, and X order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYZX *)
  | `YZX
  (** Rotate in the Z, X, and Y order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZXY *)
  | `ZXY
  (** Rotate in the X, Z, and Y order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXZY *)
  | `XZY
  (** Rotate in the Y, X, and Z order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYXZ *)
  | `YXZ
  (** Rotate in the Z, Y, and X order. Deprecated in
  Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZYX *)
  | `ZYX
  (** Defines a static rotation along the X, Y, and Z axes (Since: 1.10) *)
  | `SXYZ
  (** Defines a static rotation along the X, Y, and X axes (Since: 1.10) *)
  | `SXYX
  (** Defines a static rotation along the X, Z, and Y axes (Since: 1.10) *)
  | `SXZY
  (** Defines a static rotation along the X, Z, and X axes (Since: 1.10) *)
  | `SXZX
  (** Defines a static rotation along the Y, Z, and X axes (Since: 1.10) *)
  | `SYZX
  (** Defines a static rotation along the Y, Z, and Y axes (Since: 1.10) *)
  | `SYZY
  (** Defines a static rotation along the Y, X, and Z axes (Since: 1.10) *)
  | `SYXZ
  (** Defines a static rotation along the Y, X, and Y axes (Since: 1.10) *)
  | `SYXY
  (** Defines a static rotation along the Z, X, and Y axes (Since: 1.10) *)
  | `SZXY
  (** Defines a static rotation along the Z, X, and Z axes (Since: 1.10) *)
  | `SZXZ
  (** Defines a static rotation along the Z, Y, and X axes (Since: 1.10) *)
  | `SZYX
  (** Defines a static rotation along the Z, Y, and Z axes (Since: 1.10) *)
  | `SZYZ
  (** Defines a relative rotation along the Z, Y, and X axes (Since: 1.10) *)
  | `RZYX
  (** Defines a relative rotation along the X, Y, and X axes (Since: 1.10) *)
  | `RXYX
  (** Defines a relative rotation along the Y, Z, and X axes (Since: 1.10) *)
  | `RYZX
  (** Defines a relative rotation along the X, Z, and X axes (Since: 1.10) *)
  | `RXZX
  (** Defines a relative rotation along the X, Z, and Y axes (Since: 1.10) *)
  | `RXZY
  (** Defines a relative rotation along the Y, Z, and Y axes (Since: 1.10) *)
  | `RYZY
  (** Defines a relative rotation along the Z, X, and Y axes (Since: 1.10) *)
  | `RZXY
  (** Defines a relative rotation along the Y, X, and Y axes (Since: 1.10) *)
  | `RYXY
  (** Defines a relative rotation along the Y, X, and Z axes (Since: 1.10) *)
  | `RYXZ
  (** Defines a relative rotation along the Z, X, and Z axes (Since: 1.10) *)
  | `RZXZ
  (** Defines a relative rotation along the X, Y, and Z axes (Since: 1.10) *)
  | `RXYZ
  (** Defines a relative rotation along the Z, Y, and Z axes (Since: 1.10) *)
  | `RZYZ
]

val eulerorder_of_int : int -> eulerorder
val eulerorder_to_int : eulerorder -> int

(* RayIntersectionKind - enumeration *)
type rayintersectionkind = [
  (** No intersection *)
  | `NONE
  (** The ray is entering the intersected
  object *)
  | `ENTER
  (** The ray is leaving the intersected
  object *)
  | `LEAVE
]

val rayintersectionkind_of_int : int -> rayintersectionkind
val rayintersectionkind_to_int : rayintersectionkind -> int

