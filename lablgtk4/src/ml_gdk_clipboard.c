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

/*
 * ml_gdk_clipboard.c - GdkClipboard bindings (new in GTK4)
 *
 * GTK4 completely replaced GtkClipboard with GdkClipboard using GValue
 * and GType instead of opaque atoms. This provides a cleaner, more
 * type-safe clipboard API.
 */

#include <string.h>
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"

/* ==================================================================== */
/* Type Conversions */
/* ==================================================================== */

/* GdkClipboard - GObject, use direct cast */
#define GdkClipboard_val(val) ((GdkClipboard*)(val))
#define Val_GdkClipboard(obj) ((value)(obj))

/* GdkContentProvider - GObject, use direct cast */
#define GdkContentProvider_val(val) ((GdkContentProvider*)(val))
#define Val_GdkContentProvider(obj) ((value)(obj))

/* GdkContentFormats - Boxed type, use pointer */
#define GdkContentFormats_val(val) ((GdkContentFormats*)Pointer_val(val))

/* Wrapper for GdkContentFormats to OCaml value */
static value Val_GdkContentFormats(GdkContentFormats *formats)
{
    CAMLparam0();
    CAMLlocal1(val);

    if (!formats) {
        CAMLreturn(Val_none);
    }

    /* Allocate a block to hold the pointer */
    val = caml_alloc_small(1, Abstract_tag);
    Field(val, 0) = (value)gdk_content_formats_ref(formats);
    CAMLreturn(val);
}

/* ==================================================================== */
/* Getting Clipboard Instances */
/* ==================================================================== */

CAMLprim value ml_gdk_display_get_clipboard(value display)
{
    CAMLparam1(display);
    GdkClipboard *clipboard;

    clipboard = gdk_display_get_clipboard(GdkDisplay_val(display));
    CAMLreturn(Val_GdkClipboard(clipboard));
}

CAMLprim value ml_gdk_display_get_primary_clipboard(value display)
{
    CAMLparam1(display);
    GdkClipboard *clipboard;

    clipboard = gdk_display_get_primary_clipboard(GdkDisplay_val(display));
    CAMLreturn(Val_GdkClipboard(clipboard));
}

/* ==================================================================== */
/* Synchronous Write Operations */
/* ==================================================================== */

CAMLprim value ml_gdk_clipboard_set_text(value clipboard, value text)
{
    CAMLparam2(clipboard, text);

    /* Set text on clipboard */
    gdk_clipboard_set_text(GdkClipboard_val(clipboard), String_val(text));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_clipboard_set_content(value clipboard, value provider)
{
    CAMLparam2(clipboard, provider);
    gboolean result;

    result = gdk_clipboard_set_content(
        GdkClipboard_val(clipboard),
        GdkContentProvider_val(provider)
    );

    CAMLreturn(Val_bool(result));
}

/* ==================================================================== */
/* Asynchronous Read Operations */
/* ==================================================================== */

/* Callback data structure for async operations */
typedef struct {
    value callback;  /* OCaml callback function */
} ml_clipboard_callback_data;

/* Async callback for read_text_async */
static void ml_read_text_callback(GObject *source_object,
                                   GAsyncResult *res,
                                   gpointer user_data)
{
    CAMLparam0();
    CAMLlocal1(result);
    GError *error = NULL;
    char *text = NULL;
    ml_clipboard_callback_data *data = (ml_clipboard_callback_data *)user_data;

    /* Check for valid callback data */
    if (!data) {
        CAMLreturn0;
    }

    /* Read the text result */
    text = gdk_clipboard_read_text_finish(GDK_CLIPBOARD(source_object), res, &error);

    /* Convert result to OCaml option */
    if (text && !error) {
        result = Val_some(caml_copy_string(text));
        g_free(text);
    } else {
        result = Val_none;
        if (error) {
            g_error_free(error);
        }
    }

    /* Call OCaml callback with exception handling */
    value exn_result = caml_callback_exn(data->callback, result);
    if (Is_exception_result(exn_result)) {
        /* Log error but don't crash - callback exceptions are handled in OCaml */
    }

    /* Clean up */
    caml_remove_global_root(&data->callback);
    g_free(data);

    CAMLreturn0;
}

CAMLprim value ml_gdk_clipboard_read_text_async(value clipboard, value callback)
{
    CAMLparam2(clipboard, callback);
    ml_clipboard_callback_data *data;

    /* Allocate callback data - check for allocation failure */
    data = (ml_clipboard_callback_data *)g_malloc(sizeof(ml_clipboard_callback_data));
    if (!data) {
        caml_failwith("ml_gdk_clipboard_read_text_async: memory allocation failed");
    }

    /* Store callback and protect from GC */
    data->callback = callback;
    caml_register_global_root(&data->callback);

    /* Initiate async read */
    gdk_clipboard_read_text_async(
        GdkClipboard_val(clipboard),
        NULL,  /* cancellable */
        ml_read_text_callback,
        data
    );

    CAMLreturn(Val_unit);
}

/* ==================================================================== */
/* Content Queries */
/* ==================================================================== */

CAMLprim value ml_gdk_clipboard_get_formats(value clipboard)
{
    CAMLparam1(clipboard);
    GdkContentFormats *formats;

    formats = gdk_clipboard_get_formats(GdkClipboard_val(clipboard));
    CAMLreturn(Val_GdkContentFormats(formats));
}

CAMLprim value ml_gdk_clipboard_is_local(value clipboard)
{
    CAMLparam1(clipboard);
    gboolean is_local;

    is_local = gdk_clipboard_is_local(GdkClipboard_val(clipboard));
    CAMLreturn(Val_bool(is_local));
}

/* ==================================================================== */
/* Content Formats Queries */
/* ==================================================================== */

CAMLprim value ml_gdk_content_formats_contain_gtype_text(value formats)
{
    CAMLparam1(formats);
    gboolean contains;

    contains = gdk_content_formats_contain_gtype(
        GdkContentFormats_val(formats),
        G_TYPE_STRING
    );

    CAMLreturn(Val_bool(contains));
}

CAMLprim value ml_gdk_content_formats_get_mime_types(value formats)
{
    CAMLparam1(formats);
    CAMLlocal1(result);
    const char * const *mime_types;
    gsize n_mime_types;
    gsize i;

    mime_types = gdk_content_formats_get_mime_types(
        GdkContentFormats_val(formats),
        &n_mime_types
    );

    /* Validate n_mime_types to prevent integer overflow */
    if (n_mime_types > (gsize)Max_long) {
        caml_invalid_argument("ml_gdk_content_formats_get_mime_types: too many MIME types");
    }

    /* Allocate OCaml array */
    result = caml_alloc(n_mime_types, 0);

    /* Fill array with MIME type strings */
    for (i = 0; i < n_mime_types; i++) {
        if (mime_types[i]) {
            Store_field(result, i, caml_copy_string(mime_types[i]));
        } else {
            Store_field(result, i, caml_copy_string(""));
        }
    }

    CAMLreturn(result);
}

/* ==================================================================== */
/* Content Providers */
/* ==================================================================== */

CAMLprim value ml_gdk_content_provider_new_for_value(value gvalue)
{
    CAMLparam1(gvalue);
    GdkContentProvider *provider;
    GValue *val;

    /* Get GValue from OCaml wrapper */
    val = GValue_val(gvalue);
    if (!val) {
        caml_invalid_argument("ml_gdk_content_provider_new_for_value: invalid GValue");
    }

    /* Create content provider from value */
    provider = gdk_content_provider_new_for_value(val);

    CAMLreturn(Val_GdkContentProvider(provider));
}
