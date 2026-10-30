class type message_dialog_t = object
  inherit Dialog.dialog_t

  (** {2:methods Methods} *)

  method get_message_area : unit -> Widget.widget_t
  (** Returns the message area of the dialog.

      This is the box where the dialog’s primary and secondary labels are
      packed. You can add your own extra content to that box and it will appear
      below those labels. See [Gtk.Dialog.get_content_area] for the
      corresponding function in the parent [Gtk.Dialog]. *)

  method set_markup : string -> unit
  (** Sets the text of the message dialog. *)

  (** {2:properties Properties} *)

  method message_type : Enums.messagetype
  (** The type of the message. *)

  method set_message_type : Enums.messagetype -> unit
  (** The type of the message. *)

  method secondary_text : string
  (** The secondary text of the message dialog. *)

  method set_secondary_text : string -> unit
  (** The secondary text of the message dialog. *)

  method secondary_use_markup : bool
  (** [true] if the secondary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method set_secondary_use_markup : bool -> unit
  (** [true] if the secondary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method text : string
  (** The primary text of the message dialog.

      If the dialog has a secondary text, this will appear as the title. *)

  method set_text : string -> unit
  (** The primary text of the message dialog.

      If the dialog has a secondary text, this will appear as the title. *)

  method use_markup : bool
  (** [true] if the primary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method set_use_markup : bool -> unit
  (** [true] if the primary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  (** {2:conversions Conversions} *)

  method as_message_dialog : Raw.Message_dialog.t
end

(* High-level class for MessageDialog *)
class message_dialog (obj : Raw.Message_dialog.t) : message_dialog_t =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)

    method get_message_area : unit -> Widget.widget_t =
      fun () -> new Widget.widget (Raw.Message_dialog.get_message_area obj)

    method set_markup : string -> unit =
      fun str -> Raw.Message_dialog.set_markup obj str

    method message_type = Raw.Message_dialog.get_message_type obj
    method set_message_type v = Raw.Message_dialog.set_message_type obj v
    method secondary_text = Raw.Message_dialog.get_secondary_text obj
    method set_secondary_text v = Raw.Message_dialog.set_secondary_text obj v

    method secondary_use_markup =
      Raw.Message_dialog.get_secondary_use_markup obj

    method set_secondary_use_markup v =
      Raw.Message_dialog.set_secondary_use_markup obj v

    method text = Raw.Message_dialog.get_text obj
    method set_text v = Raw.Message_dialog.set_text obj v
    method use_markup = Raw.Message_dialog.get_use_markup obj
    method set_use_markup v = Raw.Message_dialog.set_use_markup obj v
    method as_message_dialog = obj
  end
