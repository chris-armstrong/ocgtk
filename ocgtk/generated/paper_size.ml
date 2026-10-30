class type paper_size_t = object
  (** {2:methods Methods} *)

  method get_default_bottom_margin : Enums.unit -> float
  (** Gets the default bottom margin for the [GtkPaperSize]. *)

  method get_default_left_margin : Enums.unit -> float
  (** Gets the default left margin for the [GtkPaperSize]. *)

  method get_default_right_margin : Enums.unit -> float
  (** Gets the default right margin for the [GtkPaperSize]. *)

  method get_default_top_margin : Enums.unit -> float
  (** Gets the default top margin for the [GtkPaperSize]. *)

  method get_display_name : unit -> string
  (** Gets the human-readable name of the [GtkPaperSize]. *)

  method get_height : Enums.unit -> float
  (** Gets the paper height of the [GtkPaperSize], in units of [unit]. *)

  method get_name : unit -> string
  (** Gets the name of the [GtkPaperSize]. *)

  method get_ppd_name : unit -> string
  (** Gets the PPD name of the [GtkPaperSize], which may be [None]. *)

  method get_width : Enums.unit -> float
  (** Gets the paper width of the [GtkPaperSize], in units of [unit]. *)

  method is_custom : unit -> bool
  (** Returns [true] if [size] is not a standard paper size. *)

  method is_equal : Raw.Paper_size.t -> bool
  (** Compares two [GtkPaperSize] objects. *)

  method is_ipp : unit -> bool
  (** Returns [true] if [size] is an IPP standard paper size. *)

  method set_size : float -> float -> Enums.unit -> unit
  (** Changes the dimensions of a [size] to [width] x [height]. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize a paper size to an [a{sv}] variant. *)

  (** {2:conversions Conversions} *)

  method as_paper_size : Raw.Paper_size.t
end

(* High-level class for PaperSize *)
class paper_size (obj : Raw.Paper_size.t) : paper_size_t =
  object (self)
    method get_default_bottom_margin : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_default_bottom_margin obj unit

    method get_default_left_margin : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_default_left_margin obj unit

    method get_default_right_margin : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_default_right_margin obj unit

    method get_default_top_margin : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_default_top_margin obj unit

    method get_display_name : unit -> string =
      fun () -> Raw.Paper_size.get_display_name obj

    method get_height : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_height obj unit

    method get_name : unit -> string = fun () -> Raw.Paper_size.get_name obj

    method get_ppd_name : unit -> string =
      fun () -> Raw.Paper_size.get_ppd_name obj

    method get_width : Enums.unit -> float =
      fun unit -> Raw.Paper_size.get_width obj unit

    method is_custom : unit -> bool = fun () -> Raw.Paper_size.is_custom obj

    method is_equal : Raw.Paper_size.t -> bool =
      fun size2 -> Raw.Paper_size.is_equal obj size2

    method is_ipp : unit -> bool = fun () -> Raw.Paper_size.is_ipp obj

    method set_size : float -> float -> Enums.unit -> unit =
      fun width height unit -> Raw.Paper_size.set_size obj width height unit

    method to_gvariant : unit -> Gvariant.t =
      fun () -> Raw.Paper_size.to_gvariant obj

    method as_paper_size = obj
  end

let new_ (name : string option) : paper_size_t =
  let obj_ = Raw.Paper_size.new_ name in
  new paper_size obj_

let new_custom (name : string) (display_name : string) (width : float)
    (height : float) (unit : Enums.unit) : paper_size_t =
  let obj_ = Raw.Paper_size.new_custom name display_name width height unit in
  new paper_size obj_

let new_from_gvariant (variant : Gvariant.t) : paper_size_t =
  let obj_ = Raw.Paper_size.new_from_gvariant variant in
  new paper_size obj_

let new_from_ipp (ipp_name : string) (width : float) (height : float) :
    paper_size_t =
  let obj_ = Raw.Paper_size.new_from_ipp ipp_name width height in
  new paper_size obj_

let new_from_ppd (ppd_name : string) (ppd_display_name : string) (width : float)
    (height : float) : paper_size_t =
  let obj_ =
    Raw.Paper_size.new_from_ppd ppd_name ppd_display_name width height
  in
  new paper_size obj_
