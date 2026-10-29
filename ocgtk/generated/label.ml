class type label_t = object
  inherit Widget.widget_t
  inherit Accessible_text.accessible_text_t

  (** {2:signals Signals} *)

  method on_activate_current_link :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted when the user activates a link in the label.

      The [::activate-current-link] is a keybinding signal.

      Applications may also emit the signal with g_signal_emit_by_name() if they
      need to control activation of URIs programmatically.

      The default bindings for this signal are all forms of the <kbd>Enter</kbd>
      key. *)

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted to activate a URI.

      Applications may connect to it to override the default behaviour, which is
      to call [Gtk.FileLauncher.launch]. *)

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to copy the selection to the clipboard.

      The [::copy-clipboard] signal is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>+<kbd>c</kbd>. *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user initiates a cursor movement.

      The [::move-cursor] signal is a keybinding signal. If the cursor is not
      visible in [entry], this signal causes the viewport to be moved instead.

      Applications should not connect to it, but may emit it with
      [GObject.signal_emit_by_name] if they need to control the cursor
      programmatically.

      The default bindings for this signal come in two variants, the variant
      with the <kbd>Shift</kbd> modifier extends the selection, the variant
      without the <kbd>Shift</kbd> modifier does not. There are too many key
      combinations to list them all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual characters/lines
      - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
      - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer *)

  (** {2:methods Methods} *)

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  (** Gets the label's attribute list.

      This is the [Pango.AttrList] that was set on the label using
      [Gtk.Label.set_attributes], if any. This function does not reflect
      attributes that come from the label's markup (see [Gtk.Label.set_markup]).
      If you want to get the effective attributes for the label, use
      [pango_layout_get_attributes (gtk_label_get_layout (self))]. *)

  method get_current_uri : unit -> string option
  (** Returns the URI for the active link in the label.

      The active link is the one under the mouse pointer or, in a selectable
      label, the link in which the text cursor is currently positioned.

      This function is intended for use in a [Gtk.Label::activate-link] handler
      or for use in a [Gtk.Widget::query-tooltip] handler. *)

  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  (** Returns the ellipsization mode of the label.

      See [Gtk.Label.set_ellipsize]. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the extra menu model of the label.

      See [Gtk.Label.set_extra_menu]. *)

  method get_justify : unit -> Enums.justification
  (** Returns the justification of the label.

      See [Gtk.Label.set_justify]. *)

  method get_label : unit -> string
  (** Fetches the text from a label.

      The returned text includes any embedded underlines indicating mnemonics
      and Pango markup. (See [Gtk.Label.get_text]). *)

  method get_layout : unit -> Ocpango.Layout.layout_t
  (** Gets the Pango layout used to display the label.

      The layout is useful to e.g. convert text positions to pixel positions, in
      combination with [Gtk.Label.get_layout_offsets]. The returned layout is
      owned by the [label] so need not be freed by the caller. The [label] is
      free to recreate its layout at any time, so it should be considered
      read-only. *)

  method get_lines : unit -> int
  (** Gets the number of lines to which an ellipsized, wrapping label should be
      limited.

      See [Gtk.Label.set_lines]. *)

  method get_max_width_chars : unit -> int
  (** Retrieves the maximum width of the label in characters.

      See [Gtk.Label.set_width_chars]. *)

  method get_mnemonic_keyval : unit -> int
  (** Return the mnemonic accelerator.

      If the label has been set so that it has a mnemonic key this function
      returns the keyval used for the mnemonic accelerator. If there is no
      mnemonic set up it returns [GDK_KEY_VoidSymbol]. *)

  method get_mnemonic_widget : unit -> Widget.widget_t option
  (** Retrieves the mnemonic target of this label.

      See [Gtk.Label.set_mnemonic_widget]. *)

  method get_natural_wrap_mode : unit -> Enums.naturalwrapmode
  (** Returns natural line wrap mode used by the label.

      See [Gtk.Label.set_natural_wrap_mode]. *)

  method get_selectable : unit -> bool
  (** Returns whether the label is selectable. *)

  method get_single_line_mode : unit -> bool
  (** Returns whether the label is in single line mode. *)

  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  (** Gets the tab stops for the label.

      The returned array will be [None] if “standard” (8-space) tabs are used.
  *)

  method get_text : unit -> string
  (** Gets the text of the label.

      The returned text is as it appears on screen. This does not include any
      embedded underlines indicating mnemonics or Pango markup. (See
      [Gtk.Label.get_label]) *)

  method get_use_markup : unit -> bool
  (** Returns whether the label’s text is interpreted as Pango markup.

      See [Gtk.Label.set_use_markup]. *)

  method get_use_underline : unit -> bool
  (** Returns whether underlines in the label indicate mnemonics.

      See [Gtk.Label.set_use_underline]. *)

  method get_width_chars : unit -> int
  (** Retrieves the desired width of the label in characters.

      See [Gtk.Label.set_width_chars]. *)

  method get_wrap : unit -> bool
  (** Returns whether lines in the label are automatically wrapped.

      See [Gtk.Label.set_wrap]. *)

  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  (** Returns line wrap mode used by the label.

      See [Gtk.Label.set_wrap_mode]. *)

  method get_xalign : unit -> float
  (** Gets the [xalign] of the label.

      See the [Gtk.Label:xalign] property. *)

  method get_yalign : unit -> float
  (** Gets the [yalign] of the label.

      See the [Gtk.Label:yalign] property. *)

  method select_region : int -> int -> unit
  (** Selects a range of characters in the label, if the label is selectable.

      See [Gtk.Label.set_selectable]. If the label is not selectable, this
      function has no effect. If [start_offset] or [end_offset] are -1, then the
      end of the label will be substituted. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  (** Apply attributes to the label text.

      The attributes set with this function will be applied and merged with any
      other attributes previously effected by way of the
      [Gtk.Label:use-underline] or [Gtk.Label:use-markup] properties

      While it is not recommended to mix markup strings with manually set
      attributes, if you must; know that the attributes will be applied to the
      label after the markup string is parsed. *)

  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  (** Sets the mode used to ellipsize the text.

      The text will be ellipsized if there is not enough space to render the
      entire string. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add to the context menu of the label. *)

  method set_justify : Enums.justification -> unit
  (** Sets the alignment of lines in the label relative to each other.

      This function has no effect on labels containing only a single line.

      [Gtk.Justification.left] is the default value when the widget is first
      created with [Gtk.Label.new].

      If you instead want to set the alignment of the label as a whole, use
      [Gtk.Widget.set_halign] instead. *)

  method set_label : string -> unit
  (** Sets the text of the label.

      The label is interpreted as including embedded underlines and/or Pango
      markup depending on the values of the [Gtk.Label:use-underline] and
      [Gtk.Label:use-markup] properties. *)

  method set_lines : int -> unit
  (** Sets the number of lines to which an ellipsized, wrapping label should be
      limited.

      This has no effect if the label is not wrapping or ellipsized. Set this to
      -1 if you don’t want to limit the number of lines. *)

  method set_markup : string -> unit
  [@@ocaml.doc
    "Sets the labels text and attributes from markup.\n\n\
     The string must be marked up with Pango markup\n\
     (see [Pango.parse_markup]).\n\n\
     If [str] is external data, you may need to escape it\n\
     with [GLib.markup_escape_text] or [GLib.markup_printf_escaped]:\n\n\
     {[\n\
     GtkWidget *self = gtk_label_new (NULL);\n\
     const char *str = \"...\";\n\
     const char *format = \"<span style=\\\"italic\\\">\\%s</span>\";\n\
     char *markup;\n\n\
     markup = g_markup_printf_escaped (format, str);\n\
     gtk_label_set_markup (GTK_LABEL (self), markup);\n\
     g_free (markup);\n\
     ]}\n\n\
     This function sets the [Gtk.Label:use-markup] property\n\
     to true.\n\n\
     Also see [Gtk.Label.set_text]."]

  method set_markup_with_mnemonic : string -> unit
  (** Sets the labels text, attributes and mnemonic from markup.

      Parses [str] which is marked up with Pango markup (see
      [Pango.parse_markup]), setting the label’s text and attribute list based
      on the parse results. If characters in [str] are preceded by an
      underscore, they are underlined indicating that they represent a keyboard
      accelerator called a mnemonic.

      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

  method set_max_width_chars : int -> unit
  (** Sets the maximum width of the label in characters. *)

  method set_mnemonic_widget : Widget.widget_t option -> unit
  (** Associate the label with its mnemonic target.

      If the label has been set so that it has a mnemonic key (using i.e.
      [Gtk.Label.set_markup_with_mnemonic], [Gtk.Label.set_text_with_mnemonic],
      [Gtk.Label.new_with_mnemonic] or the [Gtk.Label:use_underline] property)
      the label can be associated with a widget that is the target of the
      mnemonic. When the label is inside a widget (like a [Gtk.Button] or a
      [Gtk.Notebook] tab) it is automatically associated with the correct
      widget, but sometimes (i.e. when the target is a [Gtk.Entry] next to the
      label) you need to set it explicitly using this function.

      The target widget will be accelerated by emitting the
      [Gtk.Widget::mnemonic-activate] signal on it. The default handler for this
      signal will activate the widget if there are no mnemonic collisions and
      toggle focus between the colliding widgets otherwise. *)

  method set_natural_wrap_mode : Enums.naturalwrapmode -> unit
  (** Selects the line wrapping for the natural size request.

      This only affects the natural size requested, for the actual wrapping
      used, see the [Gtk.Label:wrap-mode] property. *)

  method set_selectable : bool -> unit
  (** Makes text in the label selectable.

      Selectable labels allow the user to select text from the label, for
      copy-and-paste. *)

  method set_single_line_mode : bool -> unit
  (** Sets whether the label is in single line mode. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  (** Sets tab stops for the label. *)

  method set_text : string -> unit
  (** Sets the text for the label.

      It overwrites any text that was there before and clears any previously set
      mnemonic accelerators, and sets the [Gtk.Label:use-underline] and
      [Gtk.Label:use-markup] properties to false.

      Also see [Gtk.Label.set_markup]. *)

  method set_text_with_mnemonic : string -> unit
  (** Sets the text for the label, with mnemonics.

      If characters in [str] are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

  method set_use_markup : bool -> unit
  (** Sets whether the text of the label contains markup.

      See [Gtk.Label.set_markup]. *)

  method set_use_underline : bool -> unit
  (** Sets whether underlines in the text indicate mnemonics. *)

  method set_width_chars : int -> unit
  (** Sets the desired width in characters of the label. *)

  method set_wrap : bool -> unit
  (** Toggles line wrapping within the label.

      True makes it break lines if text exceeds the widget’s size. false lets
      the text get cut off by the edge of the widget if it exceeds the widget
      size.

      Note that setting line wrapping to true does not make the label wrap at
      its parent widget’s width, because GTK widgets conceptually can’t make
      their requisition depend on the parent widget’s size. For a label that
      wraps at a specific position, set the label’s width using
      [Gtk.Widget.set_size_request]. *)

  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  (** Controls how line wrapping is done.

      This only affects the label if line wrapping is on. (See
      [Gtk.Label.set_wrap])

      The default is [Pango.WrapMode.word], which means wrap on word boundaries.

      For sizing behavior, also consider the [Gtk.Label:natural-wrap-mode]
      property. *)

  method set_xalign : float -> unit
  (** Sets the [xalign] of the label.

      See the [Gtk.Label:xalign] property. *)

  method set_yalign : float -> unit
  (** Sets the [yalign] of the label.

      See the [Gtk.Label:yalign] property. *)

  (** {2:conversions Conversions} *)

  method as_label : Raw.Label.t
end

(* High-level class for Label *)
class label (obj : Raw.Label.t) : label_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    method on_activate_current_link ?(after = false) ~callback () =
      Raw.Label.on_activate_current_link ~after self#as_label ~callback

    method on_activate_link ?(after = false) ~callback () =
      Raw.Label.on_activate_link ~after self#as_label ~callback

    method on_copy_clipboard ?(after = false) ~callback () =
      Raw.Label.on_copy_clipboard ~after self#as_label ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Label.on_move_cursor ~after self#as_label ~callback

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Label.get_attributes obj)

    method get_current_uri : unit -> string option =
      fun () -> Raw.Label.get_current_uri obj

    method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode =
      fun () -> Raw.Label.get_ellipsize obj

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Label.get_extra_menu obj)

    method get_justify : unit -> Enums.justification =
      fun () -> Raw.Label.get_justify obj

    method get_label : unit -> string = fun () -> Raw.Label.get_label obj

    method get_layout : unit -> Ocpango.Layout.layout_t =
      fun () -> new Ocpango.Layout.layout (Raw.Label.get_layout obj)

    method get_lines : unit -> int = fun () -> Raw.Label.get_lines obj

    method get_max_width_chars : unit -> int =
      fun () -> Raw.Label.get_max_width_chars obj

    method get_mnemonic_keyval : unit -> int =
      fun () -> Raw.Label.get_mnemonic_keyval obj

    method get_mnemonic_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Label.get_mnemonic_widget obj)

    method get_natural_wrap_mode : unit -> Enums.naturalwrapmode =
      fun () -> Raw.Label.get_natural_wrap_mode obj

    method get_selectable : unit -> bool =
      fun () -> Raw.Label.get_selectable obj

    method get_single_line_mode : unit -> bool =
      fun () -> Raw.Label.get_single_line_mode obj

    method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Tab_array.tab_array ret)
          (Raw.Label.get_tabs obj)

    method get_text : unit -> string = fun () -> Raw.Label.get_text obj

    method get_use_markup : unit -> bool =
      fun () -> Raw.Label.get_use_markup obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Label.get_use_underline obj

    method get_width_chars : unit -> int =
      fun () -> Raw.Label.get_width_chars obj

    method get_wrap : unit -> bool = fun () -> Raw.Label.get_wrap obj

    method get_wrap_mode : unit -> Ocpango.Enums.wrapmode =
      fun () -> Raw.Label.get_wrap_mode obj

    method get_xalign : unit -> float = fun () -> Raw.Label.get_xalign obj
    method get_yalign : unit -> float = fun () -> Raw.Label.get_yalign obj

    method select_region : int -> int -> unit =
      fun start_offset end_offset ->
        Raw.Label.select_region obj start_offset end_offset

    method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit =
      fun attrs ->
        let attrs = Option.map (fun c -> c#as_attr_list) attrs in
        Raw.Label.set_attributes obj attrs

    method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit =
      fun mode -> Raw.Label.set_ellipsize obj mode

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Label.set_extra_menu obj model

    method set_justify : Enums.justification -> unit =
      fun jtype -> Raw.Label.set_justify obj jtype

    method set_label : string -> unit = fun str -> Raw.Label.set_label obj str
    method set_lines : int -> unit = fun lines -> Raw.Label.set_lines obj lines
    method set_markup : string -> unit = fun str -> Raw.Label.set_markup obj str

    method set_markup_with_mnemonic : string -> unit =
      fun str -> Raw.Label.set_markup_with_mnemonic obj str

    method set_max_width_chars : int -> unit =
      fun n_chars -> Raw.Label.set_max_width_chars obj n_chars

    method set_mnemonic_widget : Widget.widget_t option -> unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Label.set_mnemonic_widget obj widget

    method set_natural_wrap_mode : Enums.naturalwrapmode -> unit =
      fun wrap_mode -> Raw.Label.set_natural_wrap_mode obj wrap_mode

    method set_selectable : bool -> unit =
      fun setting -> Raw.Label.set_selectable obj setting

    method set_single_line_mode : bool -> unit =
      fun single_line_mode ->
        Raw.Label.set_single_line_mode obj single_line_mode

    method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit =
      fun tabs ->
        let tabs = Option.map (fun c -> c#as_tab_array) tabs in
        Raw.Label.set_tabs obj tabs

    method set_text : string -> unit = fun str -> Raw.Label.set_text obj str

    method set_text_with_mnemonic : string -> unit =
      fun str -> Raw.Label.set_text_with_mnemonic obj str

    method set_use_markup : bool -> unit =
      fun setting -> Raw.Label.set_use_markup obj setting

    method set_use_underline : bool -> unit =
      fun setting -> Raw.Label.set_use_underline obj setting

    method set_width_chars : int -> unit =
      fun n_chars -> Raw.Label.set_width_chars obj n_chars

    method set_wrap : bool -> unit = fun wrap -> Raw.Label.set_wrap obj wrap

    method set_wrap_mode : Ocpango.Enums.wrapmode -> unit =
      fun wrap_mode -> Raw.Label.set_wrap_mode obj wrap_mode

    method set_xalign : float -> unit =
      fun xalign -> Raw.Label.set_xalign obj xalign

    method set_yalign : float -> unit =
      fun yalign -> Raw.Label.set_yalign obj yalign

    method as_label = obj
  end

let new_ (str : string option) : label_t =
  let obj_ = Raw.Label.new_ str in
  new label obj_

let new_with_mnemonic (str : string option) : label_t =
  let obj_ = Raw.Label.new_with_mnemonic str in
  new label obj_
