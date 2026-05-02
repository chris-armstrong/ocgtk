(* GENERATED CODE - DO NOT EDIT *)
(* GdkPixbuf Enumeration and Bitfield Converters *)

type colorspace = [ `RGB ]

let colorspace_of_int n =
  match n with
  | 0 -> `RGB
  | n -> failwith (Printf.sprintf "Colorspace: unknown int %d" n)

let colorspace_to_int v = match v with `RGB -> 0

type interptype = [ `NEAREST | `TILES | `BILINEAR | `HYPER ]

let interptype_of_int n =
  match n with
  | 0 -> `NEAREST
  | 1 -> `TILES
  | 2 -> `BILINEAR
  | 3 -> `HYPER
  | n -> failwith (Printf.sprintf "InterpType: unknown int %d" n)

let interptype_to_int v =
  match v with `NEAREST -> 0 | `TILES -> 1 | `BILINEAR -> 2 | `HYPER -> 3

type pixbufalphamode = [ `BILEVEL | `FULL ]

let pixbufalphamode_of_int n =
  match n with
  | 0 -> `BILEVEL
  | 1 -> `FULL
  | n -> failwith (Printf.sprintf "PixbufAlphaMode: unknown int %d" n)

let pixbufalphamode_to_int v = match v with `BILEVEL -> 0 | `FULL -> 1

type pixbuferror =
  [ `CORRUPT_IMAGE
  | `INSUFFICIENT_MEMORY
  | `BAD_OPTION
  | `UNKNOWN_TYPE
  | `UNSUPPORTED_OPERATION
  | `FAILED
  | `INCOMPLETE_ANIMATION ]

let pixbuferror_of_int n =
  match n with
  | 0 -> `CORRUPT_IMAGE
  | 1 -> `INSUFFICIENT_MEMORY
  | 2 -> `BAD_OPTION
  | 3 -> `UNKNOWN_TYPE
  | 4 -> `UNSUPPORTED_OPERATION
  | 5 -> `FAILED
  | 6 -> `INCOMPLETE_ANIMATION
  | n -> failwith (Printf.sprintf "PixbufError: unknown int %d" n)

let pixbuferror_to_int v =
  match v with
  | `CORRUPT_IMAGE -> 0
  | `INSUFFICIENT_MEMORY -> 1
  | `BAD_OPTION -> 2
  | `UNKNOWN_TYPE -> 3
  | `UNSUPPORTED_OPERATION -> 4
  | `FAILED -> 5
  | `INCOMPLETE_ANIMATION -> 6

type pixbufrotation = [ `NONE | `COUNTERCLOCKWISE | `UPSIDEDOWN | `CLOCKWISE ]

let pixbufrotation_of_int n =
  match n with
  | 0 -> `NONE
  | 90 -> `COUNTERCLOCKWISE
  | 180 -> `UPSIDEDOWN
  | 270 -> `CLOCKWISE
  | n -> failwith (Printf.sprintf "PixbufRotation: unknown int %d" n)

let pixbufrotation_to_int v =
  match v with
  | `NONE -> 0
  | `COUNTERCLOCKWISE -> 90
  | `UPSIDEDOWN -> 180
  | `CLOCKWISE -> 270

type pixbufformatflags_flag = [ `WRITABLE | `SCALABLE | `THREADSAFE ]
type pixbufformatflags = pixbufformatflags_flag list

let pixbufformatflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `WRITABLE :: acc else acc in
  let acc = if flags land 2 <> 0 then `SCALABLE :: acc else acc in
  let acc = if flags land 4 <> 0 then `THREADSAFE :: acc else acc in
  acc

let pixbufformatflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `WRITABLE -> acc lor 1
      | `SCALABLE -> acc lor 2
      | `THREADSAFE -> acc lor 4)
    0 flags
