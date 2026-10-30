(* GENERATED CODE - DO NOT EDIT *)
(* Settings: Settings *)

(** Provides a mechanism to share global settings between applications.

    On the X window system, this sharing is realized by an XSettings manager
    that is usually part of the desktop environment, along with utilities that
    let the user change these settings.

    On Wayland, the settings are obtained either via a settings portal, or by
    reading desktop settings from {{!Ocgio.Raw.Settings}[Gio.Settings]}.

    On macOS, the settings are obtained from [NSUserDefaults].

    In the absence of these sharing mechanisms, GTK reads default values for
    settings from [settings.ini] files in [/etc/gtk-4.0],
    [$XDG_CONFIG_DIRS/gtk-4.0] and [$XDG_CONFIG_HOME/gtk-4.0]. These files must
    be valid key files (see [GKeyFile]), and have a section called Settings.
    Themes can also provide default values for settings by installing a
    [settings.ini] file next to their [gtk.css] file.

    Applications can override system-wide settings by setting the property of
    the [GtkSettings] object with [g_object_set ()]. This should be restricted
    to special cases though; [GtkSettings] are not meant as an application
    configuration facility.

    There is one [GtkSettings] instance per display. It can be obtained with
    [Gtk.Settings.get_for_display], but in many cases, it is more convenient to
    use {{!Ocgtk.Raw.Widget.val-get_settings}[Gtk.Widget.get_settings]}.

    The class built on this module is in {!Ocgtk.Settings}. *)

type t = [ `settings | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_settings_get_type"

(* Methods *)

external reset_property : t -> string -> unit = "ml_gtk_settings_reset_property"
(** Undoes the effect of calling [g_object_set ()] to install an
    application-specific value for a setting.

    After this call, the setting will again follow the session-wide value for
    this setting. *)

(* Properties *)

external get_gtk_alternative_button_order : t -> bool
  = "ml_gtk_settings_get_gtk_alternative_button_order"
(** Whether buttons in dialogs should use the alternative button order. *)

external set_gtk_alternative_button_order : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_alternative_button_order"
(** Whether buttons in dialogs should use the alternative button order. *)

external get_gtk_alternative_sort_arrows : t -> bool
  = "ml_gtk_settings_get_gtk_alternative_sort_arrows"
(** Controls the direction of the sort indicators in sorted list and tree views.

    By default an arrow pointing down means the column is sorted in ascending
    order. When set to [true], this order will be inverted. *)

external set_gtk_alternative_sort_arrows : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_alternative_sort_arrows"
(** Controls the direction of the sort indicators in sorted list and tree views.

    By default an arrow pointing down means the column is sorted in ascending
    order. When set to [true], this order will be inverted. *)

external get_gtk_application_prefer_dark_theme : t -> bool
  = "ml_gtk_settings_get_gtk_application_prefer_dark_theme"
(** Whether the application prefers to use a dark theme.

    If a GTK theme includes a dark variant, it will be used instead of the
    configured theme.

    Some applications benefit from minimizing the amount of light pollution that
    interferes with the content. Good candidates for dark themes are photo and
    video editors that make the actual content get all the attention and
    minimize the distraction of the chrome.

    Dark themes should not be used for documents, where large spaces are
    white/light and the dark chrome creates too much contrast (web browser, text
    editor...). *)

external set_gtk_application_prefer_dark_theme : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_application_prefer_dark_theme"
(** Whether the application prefers to use a dark theme.

    If a GTK theme includes a dark variant, it will be used instead of the
    configured theme.

    Some applications benefit from minimizing the amount of light pollution that
    interferes with the content. Good candidates for dark themes are photo and
    video editors that make the actual content get all the attention and
    minimize the distraction of the chrome.

    Dark themes should not be used for documents, where large spaces are
    white/light and the dark chrome creates too much contrast (web browser, text
    editor...). *)

external get_gtk_cursor_aspect_ratio : t -> float
  = "ml_gtk_settings_get_gtk_cursor_aspect_ratio"
(** The aspect ratio of the text caret. *)

external set_gtk_cursor_aspect_ratio : t -> float -> unit
  = "ml_gtk_settings_set_gtk_cursor_aspect_ratio"
(** The aspect ratio of the text caret. *)

external get_gtk_cursor_blink : t -> bool
  = "ml_gtk_settings_get_gtk_cursor_blink"
(** Whether the cursor should blink.

    Also see the
    {{!Ocgtk.Raw.Settings.val-get_gtk_cursor_blink_timeout}[Gtk.Settings:gtk-cursor-blink-timeout]}
    setting, which allows more flexible control over cursor blinking. *)

external set_gtk_cursor_blink : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_cursor_blink"
(** Whether the cursor should blink.

    Also see the
    {{!Ocgtk.Raw.Settings.val-get_gtk_cursor_blink_timeout}[Gtk.Settings:gtk-cursor-blink-timeout]}
    setting, which allows more flexible control over cursor blinking. *)

external get_gtk_cursor_blink_time : t -> int
  = "ml_gtk_settings_get_gtk_cursor_blink_time"
(** Length of the cursor blink cycle, in milliseconds. *)

external set_gtk_cursor_blink_time : t -> int -> unit
  = "ml_gtk_settings_set_gtk_cursor_blink_time"
(** Length of the cursor blink cycle, in milliseconds. *)

external get_gtk_cursor_blink_timeout : t -> int
  = "ml_gtk_settings_get_gtk_cursor_blink_timeout"
(** Time after which the cursor stops blinking, in seconds.

    The timer is reset after each user interaction.

    Setting this to zero has the same effect as setting
    {{!Ocgtk.Raw.Settings.val-get_gtk_cursor_blink}[Gtk.Settings:gtk-cursor-blink]}
    to [false]. *)

external set_gtk_cursor_blink_timeout : t -> int -> unit
  = "ml_gtk_settings_set_gtk_cursor_blink_timeout"
(** Time after which the cursor stops blinking, in seconds.

    The timer is reset after each user interaction.

    Setting this to zero has the same effect as setting
    {{!Ocgtk.Raw.Settings.val-get_gtk_cursor_blink}[Gtk.Settings:gtk-cursor-blink]}
    to [false]. *)

external get_gtk_cursor_theme_name : t -> string
  = "ml_gtk_settings_get_gtk_cursor_theme_name"
(** Name of the cursor theme to use.

    Use [None] to use the default theme. *)

external set_gtk_cursor_theme_name : t -> string -> unit
  = "ml_gtk_settings_set_gtk_cursor_theme_name"
(** Name of the cursor theme to use.

    Use [None] to use the default theme. *)

external get_gtk_cursor_theme_size : t -> int
  = "ml_gtk_settings_get_gtk_cursor_theme_size"
(** The size to use for cursors.

    0 means to use the default size. *)

external set_gtk_cursor_theme_size : t -> int -> unit
  = "ml_gtk_settings_set_gtk_cursor_theme_size"
(** The size to use for cursors.

    0 means to use the default size. *)

external get_gtk_decoration_layout : t -> string
  = "ml_gtk_settings_get_gtk_decoration_layout"
[@@ocaml.doc
  "Determines which buttons should be put in the\n\
   titlebar of client-side decorated windows, and whether they\n\
   should be placed on the left or right.\n\n\
   The format of the string is button names, separated by commas.\n\
   A colon separates the buttons that should appear on the left\n\
   from those on the right. Recognized button names are minimize,\n\
   maximize, close, icon (the window icon) and menu (a menu button\n\
   for the fallback app menu).\n\n\
   For example, \"menu:minimize,maximize,close\" specifies a menu\n\
   on the left, and minimize, maximize and close buttons on the right.\n\n\
   Note that buttons will only be shown when they are meaningful.\n\
   E.g. a menu button only appears when the desktop shell does not\n\
   show the app menu, and a close button only appears on a window\n\
   that can be closed.\n\n\
   Also note that the setting can be overridden with the\n\
   {{!Ocgtk.Raw.Header_bar.val-get_decoration_layout}[Gtk.HeaderBar:decoration-layout]} \
   property."]

external set_gtk_decoration_layout : t -> string -> unit
  = "ml_gtk_settings_set_gtk_decoration_layout"
[@@ocaml.doc
  "Determines which buttons should be put in the\n\
   titlebar of client-side decorated windows, and whether they\n\
   should be placed on the left or right.\n\n\
   The format of the string is button names, separated by commas.\n\
   A colon separates the buttons that should appear on the left\n\
   from those on the right. Recognized button names are minimize,\n\
   maximize, close, icon (the window icon) and menu (a menu button\n\
   for the fallback app menu).\n\n\
   For example, \"menu:minimize,maximize,close\" specifies a menu\n\
   on the left, and minimize, maximize and close buttons on the right.\n\n\
   Note that buttons will only be shown when they are meaningful.\n\
   E.g. a menu button only appears when the desktop shell does not\n\
   show the app menu, and a close button only appears on a window\n\
   that can be closed.\n\n\
   Also note that the setting can be overridden with the\n\
   {{!Ocgtk.Raw.Header_bar.val-get_decoration_layout}[Gtk.HeaderBar:decoration-layout]} \
   property."]

external get_gtk_dialogs_use_header : t -> bool
  = "ml_gtk_settings_get_gtk_dialogs_use_header"
(** Whether builtin GTK dialogs such as the file chooser, the color chooser or
    the font chooser will use a header bar at the top to show action widgets, or
    an action area at the bottom.

    This setting does not affect custom dialogs using [GtkDialog] directly, or
    message dialogs. *)

external set_gtk_dialogs_use_header : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_dialogs_use_header"
(** Whether builtin GTK dialogs such as the file chooser, the color chooser or
    the font chooser will use a header bar at the top to show action widgets, or
    an action area at the bottom.

    This setting does not affect custom dialogs using [GtkDialog] directly, or
    message dialogs. *)

external get_gtk_dnd_drag_threshold : t -> int
  = "ml_gtk_settings_get_gtk_dnd_drag_threshold"
(** The number of pixels the cursor can move before dragging. *)

external set_gtk_dnd_drag_threshold : t -> int -> unit
  = "ml_gtk_settings_set_gtk_dnd_drag_threshold"
(** The number of pixels the cursor can move before dragging. *)

external get_gtk_double_click_distance : t -> int
  = "ml_gtk_settings_get_gtk_double_click_distance"
(** The maximum distance allowed between two clicks for them to be considered a
    double click, in pixels. *)

external set_gtk_double_click_distance : t -> int -> unit
  = "ml_gtk_settings_set_gtk_double_click_distance"
(** The maximum distance allowed between two clicks for them to be considered a
    double click, in pixels. *)

external get_gtk_double_click_time : t -> int
  = "ml_gtk_settings_get_gtk_double_click_time"
(** The maximum time to allow between two clicks for them to be considered a
    double click, in milliseconds. *)

external set_gtk_double_click_time : t -> int -> unit
  = "ml_gtk_settings_set_gtk_double_click_time"
(** The maximum time to allow between two clicks for them to be considered a
    double click, in milliseconds. *)

external get_gtk_enable_accels : t -> bool
  = "ml_gtk_settings_get_gtk_enable_accels"
(** Whether menu items should have visible accelerators which can be activated.
*)

external set_gtk_enable_accels : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_enable_accels"
(** Whether menu items should have visible accelerators which can be activated.
*)

external get_gtk_enable_animations : t -> bool
  = "ml_gtk_settings_get_gtk_enable_animations"
(** Whether to enable toolkit-wide animations. *)

external set_gtk_enable_animations : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_enable_animations"
(** Whether to enable toolkit-wide animations. *)

external get_gtk_enable_event_sounds : t -> bool
  = "ml_gtk_settings_get_gtk_enable_event_sounds"
(** Whether to play any event sounds at all.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external set_gtk_enable_event_sounds : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_enable_event_sounds"
(** Whether to play any event sounds at all.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external get_gtk_enable_input_feedback_sounds : t -> bool
  = "ml_gtk_settings_get_gtk_enable_input_feedback_sounds"
(** Whether to play event sounds as feedback to user input.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external set_gtk_enable_input_feedback_sounds : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_enable_input_feedback_sounds"
(** Whether to play event sounds as feedback to user input.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external get_gtk_enable_primary_paste : t -> bool
  = "ml_gtk_settings_get_gtk_enable_primary_paste"
(** Whether a middle click on a mouse should paste the 'PRIMARY' clipboard
    content at the cursor location. *)

external set_gtk_enable_primary_paste : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_enable_primary_paste"
(** Whether a middle click on a mouse should paste the 'PRIMARY' clipboard
    content at the cursor location. *)

external get_gtk_entry_password_hint_timeout : t -> int
  = "ml_gtk_settings_get_gtk_entry_password_hint_timeout"
(** How long to show the last input character in hidden entries.

    This value is in milliseconds. 0 disables showing the last char. 600 is a
    good value for enabling it. *)

external set_gtk_entry_password_hint_timeout : t -> int -> unit
  = "ml_gtk_settings_set_gtk_entry_password_hint_timeout"
(** How long to show the last input character in hidden entries.

    This value is in milliseconds. 0 disables showing the last char. 600 is a
    good value for enabling it. *)

external get_gtk_entry_select_on_focus : t -> bool
  = "ml_gtk_settings_get_gtk_entry_select_on_focus"
(** Whether to select the contents of an entry when it is focused. *)

external set_gtk_entry_select_on_focus : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_entry_select_on_focus"
(** Whether to select the contents of an entry when it is focused. *)

external get_gtk_error_bell : t -> bool = "ml_gtk_settings_get_gtk_error_bell"
(** When [true], keyboard navigation and other input-related errors will cause a
    beep.

    Since the error bell is implemented using
    {{!Ocgdk.Raw.Surface.val-beep}[gdk_surface_beep ()]}, the windowing system
    may offer ways to configure the error bell in many ways, such as flashing
    the window or similar visual effects. *)

external set_gtk_error_bell : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_error_bell"
(** When [true], keyboard navigation and other input-related errors will cause a
    beep.

    Since the error bell is implemented using
    {{!Ocgdk.Raw.Surface.val-beep}[gdk_surface_beep ()]}, the windowing system
    may offer ways to configure the error bell in many ways, such as flashing
    the window or similar visual effects. *)

external get_gtk_font_name : t -> string = "ml_gtk_settings_get_gtk_font_name"
(** The default font to use.

    GTK uses the family name and size from this string. *)

external set_gtk_font_name : t -> string -> unit
  = "ml_gtk_settings_set_gtk_font_name"
(** The default font to use.

    GTK uses the family name and size from this string. *)

external get_gtk_font_rendering : t -> Ocgtk_enums.fontrendering
  = "ml_gtk_settings_get_gtk_font_rendering"
(** How GTK font rendering is set up.

    When set to
    {{!Ocgtk.Enums.type-fontrendering.constructor-MANUAL}[Gtk.FontRendering.MANUAL]},
    GTK respects the low-level font-related settings
    ({{!Ocgtk.Raw.Settings.val-get_gtk_hint_font_metrics}[Gtk.Settings:gtk-hint-font-metrics]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_antialias}[Gtk.Settings:gtk-xft-antialias]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_hinting}[Gtk.Settings:gtk-xft-hinting]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_hintstyle}[Gtk.Settings:gtk-xft-hintstyle]}
    and {{!Ocgtk.Raw.Settings.val-get_gtk_xft_rgba}[Gtk.Settings:gtk-xft-rgba]})
    as much as practical.

    When set to
    {{!Ocgtk.Enums.type-fontrendering.constructor-AUTOMATIC}[Gtk.FontRendering.AUTOMATIC]},
    GTK will consider factors such as screen resolution and scale in deciding
    how to render fonts. *)

external set_gtk_font_rendering : t -> Ocgtk_enums.fontrendering -> unit
  = "ml_gtk_settings_set_gtk_font_rendering"
(** How GTK font rendering is set up.

    When set to
    {{!Ocgtk.Enums.type-fontrendering.constructor-MANUAL}[Gtk.FontRendering.MANUAL]},
    GTK respects the low-level font-related settings
    ({{!Ocgtk.Raw.Settings.val-get_gtk_hint_font_metrics}[Gtk.Settings:gtk-hint-font-metrics]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_antialias}[Gtk.Settings:gtk-xft-antialias]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_hinting}[Gtk.Settings:gtk-xft-hinting]},
    {{!Ocgtk.Raw.Settings.val-get_gtk_xft_hintstyle}[Gtk.Settings:gtk-xft-hintstyle]}
    and {{!Ocgtk.Raw.Settings.val-get_gtk_xft_rgba}[Gtk.Settings:gtk-xft-rgba]})
    as much as practical.

    When set to
    {{!Ocgtk.Enums.type-fontrendering.constructor-AUTOMATIC}[Gtk.FontRendering.AUTOMATIC]},
    GTK will consider factors such as screen resolution and scale in deciding
    how to render fonts. *)

external get_gtk_fontconfig_timestamp : t -> int
  = "ml_gtk_settings_get_gtk_fontconfig_timestamp"
(** Timestamp of the current fontconfig configuration. *)

external set_gtk_fontconfig_timestamp : t -> int -> unit
  = "ml_gtk_settings_set_gtk_fontconfig_timestamp"
(** Timestamp of the current fontconfig configuration. *)

external get_gtk_hint_font_metrics : t -> bool
  = "ml_gtk_settings_get_gtk_hint_font_metrics"
(** Whether hinting should be applied to font metrics.

    Note that this also turns off subpixel positioning of glyphs, since it
    conflicts with metrics hinting. *)

external set_gtk_hint_font_metrics : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_hint_font_metrics"
(** Whether hinting should be applied to font metrics.

    Note that this also turns off subpixel positioning of glyphs, since it
    conflicts with metrics hinting. *)

external get_gtk_icon_theme_name : t -> string
  = "ml_gtk_settings_get_gtk_icon_theme_name"
(** Name of the icon theme to use.

    See {{!Ocgtk.Raw.Icon_theme}[Gtk.IconTheme]} for details about how GTK
    handles icon themes. *)

external set_gtk_icon_theme_name : t -> string -> unit
  = "ml_gtk_settings_set_gtk_icon_theme_name"
(** Name of the icon theme to use.

    See {{!Ocgtk.Raw.Icon_theme}[Gtk.IconTheme]} for details about how GTK
    handles icon themes. *)

external get_gtk_im_module : t -> string = "ml_gtk_settings_get_gtk_im_module"
(** Which IM (input method) module should be used by default.

    This is the input method that will be used if the user has not explicitly
    chosen another input method from the IM context menu. This also can be a
    colon-separated list of input methods, which GTK will try in turn until it
    finds one available on the system.

    See {{!Ocgtk.Raw.Im_context}[Gtk.IMContext]}. *)

external set_gtk_im_module : t -> string -> unit
  = "ml_gtk_settings_set_gtk_im_module"
(** Which IM (input method) module should be used by default.

    This is the input method that will be used if the user has not explicitly
    chosen another input method from the IM context menu. This also can be a
    colon-separated list of input methods, which GTK will try in turn until it
    finds one available on the system.

    See {{!Ocgtk.Raw.Im_context}[Gtk.IMContext]}. *)

external get_gtk_interface_color_scheme : t -> Ocgtk_enums.interfacecolorscheme
  = "ml_gtk_settings_get_gtk_interface_color_scheme"
(** The color scheme used for rendering the user interface.

    This setting communicates the system-wide preference. The color scheme that
    is actually used when applying CSS styles can be set with the
    {{!Ocgtk.Raw.Css_provider.val-get_prefers_color_scheme}[Gtk.CssProvider:prefers-color-scheme]}
    property. *)

external set_gtk_interface_color_scheme :
  t -> Ocgtk_enums.interfacecolorscheme -> unit
  = "ml_gtk_settings_set_gtk_interface_color_scheme"
(** The color scheme used for rendering the user interface.

    This setting communicates the system-wide preference. The color scheme that
    is actually used when applying CSS styles can be set with the
    {{!Ocgtk.Raw.Css_provider.val-get_prefers_color_scheme}[Gtk.CssProvider:prefers-color-scheme]}
    property. *)

external get_gtk_interface_contrast : t -> Ocgtk_enums.interfacecontrast
  = "ml_gtk_settings_get_gtk_interface_contrast"
(** The level of contrast to use for the user interface.

    This setting communicates the system-wide preference. The contrast level
    that is actually used when applying CSS styles can be set with the
    {{!Ocgtk.Raw.Css_provider.val-get_prefers_contrast}[Gtk.CssProvider:prefers-contrast]}
    property. *)

external set_gtk_interface_contrast : t -> Ocgtk_enums.interfacecontrast -> unit
  = "ml_gtk_settings_set_gtk_interface_contrast"
(** The level of contrast to use for the user interface.

    This setting communicates the system-wide preference. The contrast level
    that is actually used when applying CSS styles can be set with the
    {{!Ocgtk.Raw.Css_provider.val-get_prefers_contrast}[Gtk.CssProvider:prefers-contrast]}
    property. *)

external get_gtk_keynav_use_caret : t -> bool
  = "ml_gtk_settings_get_gtk_keynav_use_caret"
(** Whether GTK should make sure that text can be navigated with a caret, even
    if it is not editable.

    This is useful when using a screen reader. *)

external set_gtk_keynav_use_caret : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_keynav_use_caret"
(** Whether GTK should make sure that text can be navigated with a caret, even
    if it is not editable.

    This is useful when using a screen reader. *)

external get_gtk_label_select_on_focus : t -> bool
  = "ml_gtk_settings_get_gtk_label_select_on_focus"
(** Whether to select the contents of a selectable label when it is focused. *)

external set_gtk_label_select_on_focus : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_label_select_on_focus"
(** Whether to select the contents of a selectable label when it is focused. *)

external get_gtk_long_press_time : t -> int
  = "ml_gtk_settings_get_gtk_long_press_time"
(** The time for a button or touch press to be considered a “long press”.

    See {{!Ocgtk.Raw.Gesture_long_press}[Gtk.GestureLongPress]}. *)

external set_gtk_long_press_time : t -> int -> unit
  = "ml_gtk_settings_set_gtk_long_press_time"
(** The time for a button or touch press to be considered a “long press”.

    See {{!Ocgtk.Raw.Gesture_long_press}[Gtk.GestureLongPress]}. *)

external get_gtk_overlay_scrolling : t -> bool
  = "ml_gtk_settings_get_gtk_overlay_scrolling"
(** Whether scrolled windows may use overlaid scrolling indicators.

    If this is set to [false], scrolled windows will have permanent scrollbars.
*)

external set_gtk_overlay_scrolling : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_overlay_scrolling"
(** Whether scrolled windows may use overlaid scrolling indicators.

    If this is set to [false], scrolled windows will have permanent scrollbars.
*)

external get_gtk_primary_button_warps_slider : t -> bool
  = "ml_gtk_settings_get_gtk_primary_button_warps_slider"
(** If the value of this setting is [true], clicking the primary button in a
    [GtkRange] trough will move the slider, and hence set the range’s value, to
    the point that you clicked.

    If it is [false], a primary click will cause the slider/value to move by the
    range’s page-size towards the point clicked.

    Whichever action you choose for the primary button, the other action will be
    available by holding Shift and primary-clicking, or clicking the middle
    mouse button. *)

external set_gtk_primary_button_warps_slider : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_primary_button_warps_slider"
(** If the value of this setting is [true], clicking the primary button in a
    [GtkRange] trough will move the slider, and hence set the range’s value, to
    the point that you clicked.

    If it is [false], a primary click will cause the slider/value to move by the
    range’s page-size towards the point clicked.

    Whichever action you choose for the primary button, the other action will be
    available by holding Shift and primary-clicking, or clicking the middle
    mouse button. *)

external get_gtk_print_backends : t -> string
  = "ml_gtk_settings_get_gtk_print_backends"
[@@ocaml.doc
  "A comma-separated list of print backends to use in the print\n\
   dialog.\n\n\
   Available print backends depend on the GTK installation,\n\
   and may include \"file\", \"cups\", \"lpr\" or \"papi\"."]

external set_gtk_print_backends : t -> string -> unit
  = "ml_gtk_settings_set_gtk_print_backends"
[@@ocaml.doc
  "A comma-separated list of print backends to use in the print\n\
   dialog.\n\n\
   Available print backends depend on the GTK installation,\n\
   and may include \"file\", \"cups\", \"lpr\" or \"papi\"."]

external get_gtk_print_preview_command : t -> string
  = "ml_gtk_settings_get_gtk_print_preview_command"
(** A command to run for displaying the print preview.

    The command should contain a [%f] placeholder, which will get replaced by
    the path to the pdf file. The command may also contain a [%s] placeholder,
    which will get replaced by the path to a file containing the print settings
    in the format produced by
    {{!Ocgtk.Raw.Print_settings.val-to_file}[Gtk.PrintSettings.to_file]}.

    The preview application is responsible for removing the pdf file and the
    print settings file when it is done. *)

external set_gtk_print_preview_command : t -> string -> unit
  = "ml_gtk_settings_set_gtk_print_preview_command"
(** A command to run for displaying the print preview.

    The command should contain a [%f] placeholder, which will get replaced by
    the path to the pdf file. The command may also contain a [%s] placeholder,
    which will get replaced by the path to a file containing the print settings
    in the format produced by
    {{!Ocgtk.Raw.Print_settings.val-to_file}[Gtk.PrintSettings.to_file]}.

    The preview application is responsible for removing the pdf file and the
    print settings file when it is done. *)

external get_gtk_recent_files_enabled : t -> bool
  = "ml_gtk_settings_get_gtk_recent_files_enabled"
(** Whether GTK should keep track of items inside the recently used resources
    list.

    If set to [false], the list will always be empty. *)

external set_gtk_recent_files_enabled : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_recent_files_enabled"
(** Whether GTK should keep track of items inside the recently used resources
    list.

    If set to [false], the list will always be empty. *)

external get_gtk_recent_files_max_age : t -> int
  = "ml_gtk_settings_get_gtk_recent_files_max_age"
(** The maximum age, in days, of the items inside the recently used resources
    list.

    Items older than this setting will be excised from the list. If set to 0,
    the list will always be empty; if set to -1, no item will be removed. *)

external set_gtk_recent_files_max_age : t -> int -> unit
  = "ml_gtk_settings_set_gtk_recent_files_max_age"
(** The maximum age, in days, of the items inside the recently used resources
    list.

    Items older than this setting will be excised from the list. If set to 0,
    the list will always be empty; if set to -1, no item will be removed. *)

external get_gtk_shell_shows_app_menu : t -> bool
  = "ml_gtk_settings_get_gtk_shell_shows_app_menu"
(** Set to [true] if the desktop environment is displaying the app menu, [false]
    if the app should display it itself. *)

external set_gtk_shell_shows_app_menu : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_shell_shows_app_menu"
(** Set to [true] if the desktop environment is displaying the app menu, [false]
    if the app should display it itself. *)

external get_gtk_shell_shows_desktop : t -> bool
  = "ml_gtk_settings_get_gtk_shell_shows_desktop"
(** Set to [true] if the desktop environment is displaying the desktop folder,
    [false] if not. *)

external set_gtk_shell_shows_desktop : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_shell_shows_desktop"
(** Set to [true] if the desktop environment is displaying the desktop folder,
    [false] if not. *)

external get_gtk_shell_shows_menubar : t -> bool
  = "ml_gtk_settings_get_gtk_shell_shows_menubar"
(** Set to [true] if the desktop environment is displaying the menubar, [false]
    if the app should display it itself. *)

external set_gtk_shell_shows_menubar : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_shell_shows_menubar"
(** Set to [true] if the desktop environment is displaying the menubar, [false]
    if the app should display it itself. *)

external get_gtk_show_status_shapes : t -> bool
  = "ml_gtk_settings_get_gtk_show_status_shapes"
(** When [true], widgets like switches include shapes to indicate their on/off
    state. *)

external set_gtk_show_status_shapes : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_show_status_shapes"
(** When [true], widgets like switches include shapes to indicate their on/off
    state. *)

external get_gtk_sound_theme_name : t -> string
  = "ml_gtk_settings_get_gtk_sound_theme_name"
(** The XDG sound theme to use for event sounds.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external set_gtk_sound_theme_name : t -> string -> unit
  = "ml_gtk_settings_set_gtk_sound_theme_name"
(** The XDG sound theme to use for event sounds.

    See the Sound Theme Specifications for more information on event sounds and
    sound themes.

    GTK itself does not support event sounds, you have to use a loadable module
    like the one that comes with libcanberra. *)

external get_gtk_split_cursor : t -> bool
  = "ml_gtk_settings_get_gtk_split_cursor"
(** Whether two cursors should be displayed for mixed left-to-right and
    right-to-left text. *)

external set_gtk_split_cursor : t -> bool -> unit
  = "ml_gtk_settings_set_gtk_split_cursor"
(** Whether two cursors should be displayed for mixed left-to-right and
    right-to-left text. *)

external get_gtk_theme_name : t -> string = "ml_gtk_settings_get_gtk_theme_name"
(** Name of the theme to load.

    See {{!Ocgtk.Raw.Css_provider}[Gtk.CssProvider]} for details about how GTK
    finds the CSS stylesheet for a theme. *)

external set_gtk_theme_name : t -> string -> unit
  = "ml_gtk_settings_set_gtk_theme_name"
(** Name of the theme to load.

    See {{!Ocgtk.Raw.Css_provider}[Gtk.CssProvider]} for details about how GTK
    finds the CSS stylesheet for a theme. *)

external get_gtk_titlebar_double_click : t -> string
  = "ml_gtk_settings_get_gtk_titlebar_double_click"
(** Determines the action to take when a double-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external set_gtk_titlebar_double_click : t -> string -> unit
  = "ml_gtk_settings_set_gtk_titlebar_double_click"
(** Determines the action to take when a double-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external get_gtk_titlebar_middle_click : t -> string
  = "ml_gtk_settings_get_gtk_titlebar_middle_click"
(** Determines the action to take when a middle-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external set_gtk_titlebar_middle_click : t -> string -> unit
  = "ml_gtk_settings_set_gtk_titlebar_middle_click"
(** Determines the action to take when a middle-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external get_gtk_titlebar_right_click : t -> string
  = "ml_gtk_settings_get_gtk_titlebar_right_click"
(** Determines the action to take when a right-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external set_gtk_titlebar_right_click : t -> string -> unit
  = "ml_gtk_settings_set_gtk_titlebar_right_click"
(** Determines the action to take when a right-click occurs on the titlebar of
    client-side decorated windows.

    Recognized actions are minimize, toggle-maximize, menu, lower or none. *)

external get_gtk_xft_antialias : t -> int
  = "ml_gtk_settings_get_gtk_xft_antialias"
(** Whether to antialias fonts.

    The values are 0 for no, 1 for yes, or -1 for the system default. *)

external set_gtk_xft_antialias : t -> int -> unit
  = "ml_gtk_settings_set_gtk_xft_antialias"
(** Whether to antialias fonts.

    The values are 0 for no, 1 for yes, or -1 for the system default. *)

external get_gtk_xft_dpi : t -> int = "ml_gtk_settings_get_gtk_xft_dpi"
(** The font resolution, in 1024 * dots/inch.

    -1 to use the default value. *)

external set_gtk_xft_dpi : t -> int -> unit = "ml_gtk_settings_set_gtk_xft_dpi"
(** The font resolution, in 1024 * dots/inch.

    -1 to use the default value. *)

external get_gtk_xft_hinting : t -> int = "ml_gtk_settings_get_gtk_xft_hinting"
(** Whether to enable font hinting.

    The values are 0 for no, 1 for yes, or -1 for the system default. *)

external set_gtk_xft_hinting : t -> int -> unit
  = "ml_gtk_settings_set_gtk_xft_hinting"
(** Whether to enable font hinting.

    The values are 0 for no, 1 for yes, or -1 for the system default. *)

external get_gtk_xft_hintstyle : t -> string
  = "ml_gtk_settings_get_gtk_xft_hintstyle"
(** What degree of font hinting to use.

    The possible vaues are hintnone, hintslight, hintmedium, hintfull. *)

external set_gtk_xft_hintstyle : t -> string -> unit
  = "ml_gtk_settings_set_gtk_xft_hintstyle"
(** What degree of font hinting to use.

    The possible vaues are hintnone, hintslight, hintmedium, hintfull. *)

external get_gtk_xft_rgba : t -> string = "ml_gtk_settings_get_gtk_xft_rgba"
(** The type of subpixel antialiasing to use.

    The possible values are none, rgb, bgr, vrgb, vbgr.

    Note that GSK does not support subpixel antialiasing, and this setting has
    no effect on font rendering in GTK. *)

external set_gtk_xft_rgba : t -> string -> unit
  = "ml_gtk_settings_set_gtk_xft_rgba"
(** The type of subpixel antialiasing to use.

    The possible values are none, rgb, bgr, vrgb, vbgr.

    Note that GSK does not support subpixel antialiasing, and this setting has
    no effect on font rendering in GTK. *)
