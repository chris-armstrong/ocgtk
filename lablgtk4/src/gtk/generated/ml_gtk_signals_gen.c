/* GENERATED CODE - DO NOT EDIT */
/* GTK4 Signal Connection Stubs */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <gtk/gtk.h>
#include "wrappers.h"

/* Signal: toggled */
static void ml_cell_renderer_toggle_connect_toggled_callback_wrapper(
    GtkCellRendererToggle *obj,
    gchar* arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_string(arg0);

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_cell_renderer_toggle_connect_toggled(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "toggled",
        G_CALLBACK(ml_cell_renderer_toggle_connect_toggled_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: parsing-error */
static void ml_css_provider_connect_parsing_error_callback_wrapper(
    GtkCssProvider *obj,
    CssSection arg0,
    GLib.Error arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;
    /* Warning: no mapping for parameter 1 */
    value ml_arg1 = Val_unit;

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_css_provider_connect_parsing_error(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "parsing-error",
        G_CALLBACK(ml_css_provider_connect_parsing_error_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: emoji-picked */
static void ml_emoji_chooser_connect_emoji_picked_callback_wrapper(
    GtkEmojiChooser *obj,
    gchar* arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_string(arg0);

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_emoji_chooser_connect_emoji_picked(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "emoji-picked",
        G_CALLBACK(ml_emoji_chooser_connect_emoji_picked_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: key-released */
static void ml_event_controller_key_connect_key_released_callback_wrapper(
    GtkEventControllerKey *obj,
    guint arg0,
    guint arg1,
    Gdk.ModifierType arg2,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = Val_int(arg0);
    value ml_arg1 = Val_int(arg1);
    /* Warning: no mapping for parameter 2 */
    value ml_arg2 = Val_unit;

    caml_callback3_exn(*closure, ml_arg0, ml_arg1, ml_arg2);
    CAMLreturn0;
}

CAMLprim value ml_event_controller_key_connect_key_released(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "key-released",
        G_CALLBACK(ml_event_controller_key_connect_key_released_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: changed */
static void ml_filter_connect_changed_callback_wrapper(
    GtkFilter *obj,
    FilterChange arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_filter_connect_changed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "changed",
        G_CALLBACK(ml_filter_connect_changed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: pressed */
static void ml_gesture_click_connect_pressed_callback_wrapper(
    GtkGestureClick *obj,
    gint arg0,
    gdouble arg1,
    gdouble arg2,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = Val_int(arg0);
    value ml_arg1 = caml_copy_double(arg1);
    value ml_arg2 = caml_copy_double(arg2);

    caml_callback3_exn(*closure, ml_arg0, ml_arg1, ml_arg2);
    CAMLreturn0;
}

CAMLprim value ml_gesture_click_connect_pressed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "pressed",
        G_CALLBACK(ml_gesture_click_connect_pressed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: released */
static void ml_gesture_click_connect_released_callback_wrapper(
    GtkGestureClick *obj,
    gint arg0,
    gdouble arg1,
    gdouble arg2,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = Val_int(arg0);
    value ml_arg1 = caml_copy_double(arg1);
    value ml_arg2 = caml_copy_double(arg2);

    caml_callback3_exn(*closure, ml_arg0, ml_arg1, ml_arg2);
    CAMLreturn0;
}

CAMLprim value ml_gesture_click_connect_released(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "released",
        G_CALLBACK(ml_gesture_click_connect_released_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: unpaired-release */
static void ml_gesture_click_connect_unpaired_release_callback_wrapper(
    GtkGestureClick *obj,
    gdouble arg0,
    gdouble arg1,
    guint arg2,
    Gdk.EventSequence arg3,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);
    value ml_arg2 = Val_int(arg2);
    /* Warning: no mapping for parameter 3 */
    value ml_arg3 = Val_unit;

    value args[4];
    args[0] = ml_arg0;
    args[1] = ml_arg1;
    args[2] = ml_arg2;
    args[3] = ml_arg3;
    caml_callbackN_exn(*closure, 4, args);
    CAMLreturn0;
}

CAMLprim value ml_gesture_click_connect_unpaired_release(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "unpaired-release",
        G_CALLBACK(ml_gesture_click_connect_unpaired_release_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: drag-begin */
static void ml_gesture_drag_connect_drag_begin_callback_wrapper(
    GtkGestureDrag *obj,
    gdouble arg0,
    gdouble arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_gesture_drag_connect_drag_begin(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "drag-begin",
        G_CALLBACK(ml_gesture_drag_connect_drag_begin_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: drag-end */
static void ml_gesture_drag_connect_drag_end_callback_wrapper(
    GtkGestureDrag *obj,
    gdouble arg0,
    gdouble arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_gesture_drag_connect_drag_end(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "drag-end",
        G_CALLBACK(ml_gesture_drag_connect_drag_end_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: drag-update */
static void ml_gesture_drag_connect_drag_update_callback_wrapper(
    GtkGestureDrag *obj,
    gdouble arg0,
    gdouble arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_gesture_drag_connect_drag_update(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "drag-update",
        G_CALLBACK(ml_gesture_drag_connect_drag_update_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: angle-changed */
static void ml_gesture_rotate_connect_angle_changed_callback_wrapper(
    GtkGestureRotate *obj,
    gdouble arg0,
    gdouble arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_gesture_rotate_connect_angle_changed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "angle-changed",
        G_CALLBACK(ml_gesture_rotate_connect_angle_changed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: swipe */
static void ml_gesture_swipe_connect_swipe_callback_wrapper(
    GtkGestureSwipe *obj,
    gdouble arg0,
    gdouble arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);
    value ml_arg1 = caml_copy_double(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_gesture_swipe_connect_swipe(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "swipe",
        G_CALLBACK(ml_gesture_swipe_connect_swipe_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: scale-changed */
static void ml_gesture_zoom_connect_scale_changed_callback_wrapper(
    GtkGestureZoom *obj,
    gdouble arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = caml_copy_double(arg0);

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_gesture_zoom_connect_scale_changed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "scale-changed",
        G_CALLBACK(ml_gesture_zoom_connect_scale_changed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: bind */
static void ml_signal_list_item_factory_connect_bind_callback_wrapper(
    GtkSignalListItemFactory *obj,
    GObject.Object arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_signal_list_item_factory_connect_bind(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "bind",
        G_CALLBACK(ml_signal_list_item_factory_connect_bind_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: setup */
static void ml_signal_list_item_factory_connect_setup_callback_wrapper(
    GtkSignalListItemFactory *obj,
    GObject.Object arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_signal_list_item_factory_connect_setup(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "setup",
        G_CALLBACK(ml_signal_list_item_factory_connect_setup_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: teardown */
static void ml_signal_list_item_factory_connect_teardown_callback_wrapper(
    GtkSignalListItemFactory *obj,
    GObject.Object arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_signal_list_item_factory_connect_teardown(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "teardown",
        G_CALLBACK(ml_signal_list_item_factory_connect_teardown_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: unbind */
static void ml_signal_list_item_factory_connect_unbind_callback_wrapper(
    GtkSignalListItemFactory *obj,
    GObject.Object arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_signal_list_item_factory_connect_unbind(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "unbind",
        G_CALLBACK(ml_signal_list_item_factory_connect_unbind_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: changed */
static void ml_sorter_connect_changed_callback_wrapper(
    GtkSorter *obj,
    SorterChange arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_sorter_connect_changed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "changed",
        G_CALLBACK(ml_sorter_connect_changed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: text-popped */
static void ml_statusbar_connect_text_popped_callback_wrapper(
    GtkStatusbar *obj,
    guint arg0,
    gchar* arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = Val_int(arg0);
    value ml_arg1 = caml_copy_string(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_statusbar_connect_text_popped(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "text-popped",
        G_CALLBACK(ml_statusbar_connect_text_popped_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: text-pushed */
static void ml_statusbar_connect_text_pushed_callback_wrapper(
    GtkStatusbar *obj,
    guint arg0,
    gchar* arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    value ml_arg0 = Val_int(arg0);
    value ml_arg1 = caml_copy_string(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_statusbar_connect_text_pushed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "text-pushed",
        G_CALLBACK(ml_statusbar_connect_text_pushed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: tag-added */
static void ml_text_tag_table_connect_tag_added_callback_wrapper(
    GtkTextTagTable *obj,
    TextTag arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_text_tag_table_connect_tag_added(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "tag-added",
        G_CALLBACK(ml_text_tag_table_connect_tag_added_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: tag-changed */
static void ml_text_tag_table_connect_tag_changed_callback_wrapper(
    GtkTextTagTable *obj,
    TextTag arg0,
    gboolean arg1,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;
    value ml_arg1 = Val_bool(arg1);

    caml_callback2_exn(*closure, ml_arg0, ml_arg1);
    CAMLreturn0;
}

CAMLprim value ml_text_tag_table_connect_tag_changed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "tag-changed",
        G_CALLBACK(ml_text_tag_table_connect_tag_changed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

/* Signal: tag-removed */
static void ml_text_tag_table_connect_tag_removed_callback_wrapper(
    GtkTextTagTable *obj,
    TextTag arg0,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(ml_args);
    value *closure = (value*)user_data;

    /* Warning: no mapping for parameter 0 */
    value ml_arg0 = Val_unit;

    caml_callback_exn(*closure, ml_arg0);
    CAMLreturn0;
}

CAMLprim value ml_text_tag_table_connect_tag_removed(value obj, value callback)
{
    CAMLparam2(obj, callback);
    CAMLlocal1(ml_signal_id);

    value *closure = ml_global_root_new(callback);
    gulong signal_id = g_signal_connect(
        G_OBJECT(Gobject_val(obj)),
        "tag-removed",
        G_CALLBACK(ml_text_tag_table_connect_tag_removed_callback_wrapper),
        closure);

    ml_signal_id = Val_long(signal_id);
    CAMLreturn(ml_signal_id);
}

