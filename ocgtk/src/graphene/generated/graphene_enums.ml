(* GENERATED CODE - DO NOT EDIT *)
(* Graphene Enumeration and Bitfield Converters *)

type eulerorder =
  [ `DEFAULT
  | `XYZ
  | `YZX
  | `ZXY
  | `XZY
  | `YXZ
  | `ZYX
  | `SXYZ
  | `SXYX
  | `SXZY
  | `SXZX
  | `SYZX
  | `SYZY
  | `SYXZ
  | `SYXY
  | `SZXY
  | `SZXZ
  | `SZYX
  | `SZYZ
  | `RZYX
  | `RXYX
  | `RYZX
  | `RXZX
  | `RXZY
  | `RYZY
  | `RZXY
  | `RYXY
  | `RYXZ
  | `RZXZ
  | `RXYZ
  | `RZYZ ]

let eulerorder_of_int n =
  match n with
  | -1 -> `DEFAULT
  | 0 -> `XYZ
  | 1 -> `YZX
  | 2 -> `ZXY
  | 3 -> `XZY
  | 4 -> `YXZ
  | 5 -> `ZYX
  | 6 -> `SXYZ
  | 7 -> `SXYX
  | 8 -> `SXZY
  | 9 -> `SXZX
  | 10 -> `SYZX
  | 11 -> `SYZY
  | 12 -> `SYXZ
  | 13 -> `SYXY
  | 14 -> `SZXY
  | 15 -> `SZXZ
  | 16 -> `SZYX
  | 17 -> `SZYZ
  | 18 -> `RZYX
  | 19 -> `RXYX
  | 20 -> `RYZX
  | 21 -> `RXZX
  | 22 -> `RXZY
  | 23 -> `RYZY
  | 24 -> `RZXY
  | 25 -> `RYXY
  | 26 -> `RYXZ
  | 27 -> `RZXZ
  | 28 -> `RXYZ
  | 29 -> `RZYZ
  | n -> failwith (Printf.sprintf "EulerOrder: unknown int %d" n)

let eulerorder_to_int v =
  match v with
  | `DEFAULT -> -1
  | `XYZ -> 0
  | `YZX -> 1
  | `ZXY -> 2
  | `XZY -> 3
  | `YXZ -> 4
  | `ZYX -> 5
  | `SXYZ -> 6
  | `SXYX -> 7
  | `SXZY -> 8
  | `SXZX -> 9
  | `SYZX -> 10
  | `SYZY -> 11
  | `SYXZ -> 12
  | `SYXY -> 13
  | `SZXY -> 14
  | `SZXZ -> 15
  | `SZYX -> 16
  | `SZYZ -> 17
  | `RZYX -> 18
  | `RXYX -> 19
  | `RYZX -> 20
  | `RXZX -> 21
  | `RXZY -> 22
  | `RYZY -> 23
  | `RZXY -> 24
  | `RYXY -> 25
  | `RYXZ -> 26
  | `RZXZ -> 27
  | `RXYZ -> 28
  | `RZYZ -> 29

type rayintersectionkind = [ `NONE | `ENTER | `LEAVE ]

let rayintersectionkind_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `ENTER
  | 2 -> `LEAVE
  | n -> failwith (Printf.sprintf "RayIntersectionKind: unknown int %d" n)

let rayintersectionkind_to_int v =
  match v with `NONE -> 0 | `ENTER -> 1 | `LEAVE -> 2
