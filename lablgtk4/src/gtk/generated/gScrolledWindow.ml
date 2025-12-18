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

(** High-level GtkScrolled_window wrapper for GTK4 *)

(** {1 GtkScrolled_window} *)

class scrolled_window_skel (obj : Scrolled_window.t) = object (self)
  inherit GObj.widget_impl (Scrolled_window.as_widget obj)

  method set_child (child : GObj.widget option) =
    let widget_opt = match child with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Scrolled_window.set_child obj widget_opt

  method child =
    let w = Scrolled_window.get_child obj in
    w |> Option.map (fun w -> new GObj.widget w)

  method add (child : GObj.widget) =
    self#set_child (Some child)

  method set_policy ~hpolicy ~vpolicy =
    Scrolled_window.set_policy obj hpolicy vpolicy

  (* NOTE: the generated get_policy binding is incorrectly typed; return defaults for now *)
  method policy : Gtk_enums.policytype * Gtk_enums.policytype = Scrolled_window.get_policy obj

  method hscrollbar =
    Some (new GObj.widget (Scrolled_window.get_hscrollbar obj))

  method vscrollbar =
    Some (new GObj.widget (Scrolled_window.get_vscrollbar obj))

  method min_content_width = Scrolled_window.get_min_content_width obj
  method set_min_content_width w = Scrolled_window.set_min_content_width obj w

  method min_content_height = Scrolled_window.get_min_content_height obj
  method set_min_content_height h = Scrolled_window.set_min_content_height obj h
end

class scrolled_window obj = object
  inherit scrolled_window_skel obj
end

(** Create a new scrolled window *)
let scrolled_window
    ?(hpolicy=`AUTOMATIC)
  ?(vpolicy=`AUTOMATIC)
  ?(min_content_width=(-1))
  ?(min_content_height=(-1))
  () =
  let sw = Scrolled_window.new_ () in
  Scrolled_window.set_policy sw hpolicy vpolicy;
  if min_content_width >= 0 then
    Scrolled_window.set_min_content_width sw min_content_width;
  if min_content_height >= 0 then
    Scrolled_window.set_min_content_height sw min_content_height;
  new scrolled_window sw
