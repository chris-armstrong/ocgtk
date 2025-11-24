(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level GtkFixed wrapper for GTK4 *)

(** {1 GtkFixed Container} *)

class fixed_skel (obj : Fixed.t) = object (self)
  inherit GObj.widget_impl (Fixed.as_widget obj)

  method put ~x ~y (child : GObj.widget) =
    Fixed.put obj child#as_widget ~x ~y

  method move ~x ~y (child : GObj.widget) =
    Fixed.move obj child#as_widget ~x ~y

  method remove (child : GObj.widget) =
    Fixed.remove obj child#as_widget

  method get_child_position (child : GObj.widget) =
    Fixed.get_child_position obj child#as_widget
end

class fixed obj = object
  inherit fixed_skel obj
end

(** Create a new fixed container *)
let create () =
  let fixed = Fixed.create () in
  new fixed fixed
