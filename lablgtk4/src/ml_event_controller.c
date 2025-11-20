/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"
#include "ml_gobject.h"
#include "gdk4_tags.h"

/* ==================================================================== */
/* Event Controller Type Conversions */
/* ==================================================================== */

#define GtkEventController_val(val) ((GtkEventController*)ext_of_val(val))
#define Val_GtkEventController(obj) ((value)(val_of_ext(obj)))

/* ==================================================================== */
/* Enum conversions for propagation phase and limit */
/* ==================================================================== */

/* Pre-calculated variant hash values for event controller enums */
#define EVCTL_NONE         ((value)(37469934*2+1))
#define EVCTL_CAPTURE      ((value)(928956893*2+1))
#define EVCTL_BUBBLE       ((value)(477126522*2+1))
#define EVCTL_TARGET       ((value)(780720412*2+1))
#define EVCTL_SAME_NATIVE  ((value)(14915700*2+1))

static const lookup_info propagation_phase_table[] = {
    { EVCTL_NONE, GTK_PHASE_NONE },
    { EVCTL_CAPTURE, GTK_PHASE_CAPTURE },
    { EVCTL_BUBBLE, GTK_PHASE_BUBBLE },
    { EVCTL_TARGET, GTK_PHASE_TARGET },
    { 0, 0 }
};

static const lookup_info propagation_limit_table[] = {
    { EVCTL_NONE, GTK_LIMIT_NONE },
    { EVCTL_SAME_NATIVE, GTK_LIMIT_SAME_NATIVE },
    { 0, 0 }
};

#define PropagationPhase_val(v) \
    (GtkPropagationPhase)ml_lookup_to_c(propagation_phase_table, v)
#define Val_PropagationPhase(v) \
    ml_lookup_from_c(propagation_phase_table, (int)v)

#define PropagationLimit_val(v) \
    (GtkPropagationLimit)ml_lookup_to_c(propagation_limit_table, v)
#define Val_PropagationLimit(v) \
    ml_lookup_from_c(propagation_limit_table, (int)v)

/* ==================================================================== */
/* GdkEvent type (placeholder - will be properly implemented in Gdk) */
/* ==================================================================== */

#define GdkEvent_val(val) ((GdkEvent*)val_of_ext(val))
#define Val_GdkEvent(obj) ((value)(ext_of_val(obj)))

/* ==================================================================== */
/* Base Event Controller Methods */
/* ==================================================================== */

// CAMLprim value ml_gtk_event_controller_get_widget(value controller)
// {
//     CAMLparam1(controller);
//     GtkWidget *widget = gtk_event_controller_get_widget(
//         GtkEventController_val(controller)
//     );
//     CAMLreturn(Val_option(widget, Val_GtkWidget));
// }
//
// CAMLprim value ml_gtk_event_controller_get_propagation_phase(value controller)
// {
//     CAMLparam1(controller);
//     GtkPropagationPhase phase = gtk_event_controller_get_propagation_phase(
//         GtkEventController_val(controller)
//     );
//     CAMLreturn(Val_PropagationPhase(phase));
// }
//
// CAMLprim value ml_gtk_event_controller_set_propagation_phase(value controller, value phase)
// {
//     CAMLparam2(controller, phase);
//     gtk_event_controller_set_propagation_phase(
//         GtkEventController_val(controller),
//         PropagationPhase_val(phase)
//     );
//     CAMLreturn(Val_unit);
// }
//
// CAMLprim value ml_gtk_event_controller_get_propagation_limit(value controller)
// {
//     CAMLparam1(controller);
//     GtkPropagationLimit limit = gtk_event_controller_get_propagation_limit(
//         GtkEventController_val(controller)
//     );
//     CAMLreturn(Val_PropagationLimit(limit));
// }
//
// CAMLprim value ml_gtk_event_controller_set_propagation_limit(value controller, value limit)
// {
//     CAMLparam2(controller, limit);
//     gtk_event_controller_set_propagation_limit(
//         GtkEventController_val(controller),
//         PropagationLimit_val(limit)
//     );
//     CAMLreturn(Val_unit);
// }

// ML_1(gtk_event_controller_reset, GtkEventController_val, Unit)

// CAMLprim value ml_gtk_event_controller_get_current_event(value controller)
// {
//     CAMLparam1(controller);
//     GdkEvent *event = gtk_event_controller_get_current_event(
//         GtkEventController_val(controller)
//     );
//     CAMLreturn(Val_option(event, Val_GdkEvent));
// }
//
// CAMLprim value ml_gtk_event_controller_get_current_event_time(value controller)
// {
//     CAMLparam1(controller);
//     guint32 time = gtk_event_controller_get_current_event_time(
//         GtkEventController_val(controller)
//     );
//     CAMLreturn(Val_int(time));
// }
//
/* ==================================================================== */
/* Keyboard Event Controller */
/* ==================================================================== */

// CAMLprim value ml_gtk_event_controller_key_new(value unit)
// {
//     CAMLparam1(unit);
//     GtkEventController *controller = gtk_event_controller_key_new();
//     CAMLreturn(Val_GtkEventController(controller));
// }

/* Key press signal callback wrapper */
static gboolean key_pressed_callback_wrapper(
    GtkEventControllerKey *controller,
    guint keyval,
    guint keycode,
    GdkModifierType state,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal2(result, state_val);

    value *ocaml_callback = (value*)user_data;

    /* Convert modifier state to OCaml list */
    state_val = Val_gdk4_modifier_type(state);

    /* Call OCaml callback with keyval, keycode, state */
    result = caml_callback3_exn(*ocaml_callback,
                                Val_int(keyval),
                                Val_int(keycode),
                                state_val);

    gboolean handled = FALSE;
    if (Is_exception_result(result)) {
        /* Log error but don't crash */
        g_warning("Exception in key_pressed callback");
    } else {
        handled = Bool_val(result);
    }

    CAMLreturnT(gboolean, handled);
}

CAMLprim value ml_gtk_event_controller_key_connect_key_pressed(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    /* Register callback as global root to prevent GC */
    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "key-pressed",
        G_CALLBACK(key_pressed_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

/* Key release signal callback wrapper */
static void key_released_callback_wrapper(
    GtkEventControllerKey *controller,
    guint keyval,
    guint keycode,
    GdkModifierType state,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal2(state_val, result);

    value *ocaml_callback = (value*)user_data;

    /* Convert modifier state to OCaml list */
    state_val = Val_gdk4_modifier_type(state);

    /* Call OCaml callback */
    result = caml_callback3_exn(*ocaml_callback,
                                      Val_int(keyval),
                                      Val_int(keycode),
                                      state_val);

    if (Is_exception_result(result)) {
        g_warning("Exception in key_released callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_event_controller_key_connect_key_released(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "key-released",
        G_CALLBACK(key_released_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

/* Modifiers signal callback wrapper */
static gboolean modifiers_callback_wrapper(
    GtkEventControllerKey *controller,
    GdkModifierType state,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal2(result, state_val);

    value *ocaml_callback = (value*)user_data;

    /* Convert modifier state to OCaml list */
    state_val = Val_gdk4_modifier_type(state);

    result = caml_callback_exn(*ocaml_callback, state_val);

    gboolean handled = FALSE;
    if (Is_exception_result(result)) {
        g_warning("Exception in modifiers callback");
    } else {
        handled = Bool_val(result);
    }

    CAMLreturnT(gboolean, handled);
}

CAMLprim value ml_gtk_event_controller_key_connect_modifiers(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "modifiers",
        G_CALLBACK(modifiers_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

// CAMLprim value ml_gtk_event_controller_key_forward(value controller, value widget)
// {
//     CAMLparam2(controller, widget);
//     gboolean result = gtk_event_controller_key_forward(
//         GTK_EVENT_CONTROLLER_KEY(GtkEventController_val(controller)),
//         GtkWidget_val(widget)
//     );
//     CAMLreturn(Val_bool(result));
// }
//
// CAMLprim value ml_gtk_event_controller_key_get_group(value controller)
// {
//     CAMLparam1(controller);
//     guint group = gtk_event_controller_key_get_group(
//         GTK_EVENT_CONTROLLER_KEY(GtkEventController_val(controller))
//     );
//     CAMLreturn(Val_int(group));
// }

/* ==================================================================== */
/* Motion Event Controller */
/* ==================================================================== */

// CAMLprim value ml_gtk_event_controller_motion_new(value unit)
// {
//     CAMLparam1(unit);
//     GtkEventController *controller = gtk_event_controller_motion_new();
//     CAMLreturn(Val_GtkEventController(controller));
// }

/* Motion callback wrapper (for enter and motion signals) */
static void motion_callback_wrapper(
    GtkEventControllerMotion *controller,
    gdouble x,
    gdouble y,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);

    value *ocaml_callback = (value*)user_data;

    /* Call OCaml callback with x, y coordinates */
    result = caml_callback2_exn(*ocaml_callback,
                                      caml_copy_double(x),
                                      caml_copy_double(y));

    if (Is_exception_result(result)) {
        g_warning("Exception in motion callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_event_controller_motion_connect_enter(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "enter",
        G_CALLBACK(motion_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

/* Leave callback wrapper (no parameters) */
static void leave_callback_wrapper(
    GtkEventControllerMotion *controller,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);

    value *ocaml_callback = (value*)user_data;

    result = caml_callback_exn(*ocaml_callback, Val_unit);

    if (Is_exception_result(result)) {
        g_warning("Exception in leave callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_event_controller_motion_connect_leave(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "leave",
        G_CALLBACK(leave_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

CAMLprim value ml_gtk_event_controller_motion_connect_motion(
    value controller,
    value callback)
{
    CAMLparam2(controller, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(controller),
        "motion",
        G_CALLBACK(motion_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

// CAMLprim value ml_gtk_event_controller_motion_contains_pointer(value controller)
// {
//     CAMLparam1(controller);
//     gboolean result = gtk_event_controller_motion_contains_pointer(
//         GTK_EVENT_CONTROLLER_MOTION(GtkEventController_val(controller))
//     );
//     CAMLreturn(Val_bool(result));
// }

// CAMLprim value ml_gtk_event_controller_motion_is_pointer(value controller)
// {
//     CAMLparam1(controller);
//     gboolean result = gtk_event_controller_motion_is_pointer(
//         GTK_EVENT_CONTROLLER_MOTION(GtkEventController_val(controller))
//     );
//     CAMLreturn(Val_bool(result));
// }

/* ==================================================================== */
/* Gesture Click */
/* ==================================================================== */

// CAMLprim value ml_gtk_gesture_click_new(value unit)
// {
//     CAMLparam1(unit);
//     GtkGesture *gesture = gtk_gesture_click_new();
//     CAMLreturn(Val_GtkEventController((GtkEventController*)gesture));
// }
//
/* Pressed/Released callback wrapper */
static void gesture_pressed_callback_wrapper(
    GtkGestureClick *gesture,
    gint n_press,
    gdouble x,
    gdouble y,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);

    value *ocaml_callback = (value*)user_data;

    result = caml_callback3_exn(*ocaml_callback,
                                      Val_int(n_press),
                                      caml_copy_double(x),
                                      caml_copy_double(y));

    if (Is_exception_result(result)) {
        g_warning("Exception in gesture pressed/released callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_gesture_click_connect_pressed(
    value gesture,
    value callback)
{
    CAMLparam2(gesture, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(gesture),
        "pressed",
        G_CALLBACK(gesture_pressed_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

CAMLprim value ml_gtk_gesture_click_connect_released(
    value gesture,
    value callback)
{
    CAMLparam2(gesture, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(gesture),
        "released",
        G_CALLBACK(gesture_pressed_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

/* Stopped callback wrapper (no parameters) */
static void gesture_stopped_callback_wrapper(
    GtkGestureClick *gesture,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);

    value *ocaml_callback = (value*)user_data;

    result = caml_callback_exn(*ocaml_callback, Val_unit);

    if (Is_exception_result(result)) {
        g_warning("Exception in gesture stopped callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_gesture_click_connect_stopped(
    value gesture,
    value callback)
{
    CAMLparam2(gesture, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(gesture),
        "stopped",
        G_CALLBACK(gesture_stopped_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

/* Unpaired release callback wrapper */
static void gesture_unpaired_release_callback_wrapper(
    GtkGestureClick *gesture,
    gdouble x,
    gdouble y,
    guint button,
    GdkEventSequence *sequence,
    gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);

    value *ocaml_callback = (value*)user_data;

    /* Note: sequence is ignored for now (would need GdkEventSequence bindings) */
    result = caml_callback3_exn(*ocaml_callback,
                                      caml_copy_double(x),
                                      caml_copy_double(y),
                                      Val_int(button));

    if (Is_exception_result(result)) {
        g_warning("Exception in gesture unpaired release callback");
    }

    CAMLreturn0;
}

CAMLprim value ml_gtk_gesture_click_connect_unpaired_release(
    value gesture,
    value callback)
{
    CAMLparam2(gesture, callback);

    value *callback_root = g_new(value, 1);
    *callback_root = callback;
    caml_register_global_root(callback_root);

    gulong signal_id = g_signal_connect_data(
        GtkEventController_val(gesture),
        "unpaired-release",
        G_CALLBACK(gesture_unpaired_release_callback_wrapper),
        callback_root,
        NULL,
        0
    );

    CAMLreturn(Val_long(signal_id));
}

CAMLprim value ml_gtk_gesture_click_set_button(value gesture, value button)
{
    CAMLparam2(gesture, button);

    gtk_gesture_single_set_button(
        GTK_GESTURE_SINGLE(GtkEventController_val(gesture)),
        Int_val(button)
    );

    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_click_get_button(value gesture)
{
    CAMLparam1(gesture);

    guint button = gtk_gesture_single_get_button(
        GTK_GESTURE_SINGLE(GtkEventController_val(gesture))
    );

    CAMLreturn(Val_int(button));
}

/* ==================================================================== */
/* Widget Controller Attachment */
/* ==================================================================== */

CAMLprim value ml_gtk_widget_add_controller(value widget, value controller)
{
    CAMLparam2(widget, controller);

    /* Security: Check for NULL pointers */
    GtkWidget *w = GtkWidget_val(widget);
    GtkEventController *c = GtkEventController_val(controller);

    if (w == NULL || c == NULL) {
        caml_failwith("ml_gtk_widget_add_controller: NULL pointer");
    }

    gtk_widget_add_controller(w, c);

    /* Note: widget takes ownership of controller */
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_remove_controller(value widget, value controller)
{
    CAMLparam2(widget, controller);

    /* Security: Check for NULL pointers */
    GtkWidget *w = GtkWidget_val(widget);
    GtkEventController *c = GtkEventController_val(controller);

    if (w == NULL || c == NULL) {
        caml_failwith("ml_gtk_widget_remove_controller: NULL pointer");
    }

    gtk_widget_remove_controller(w, c);

    CAMLreturn(Val_unit);
}
