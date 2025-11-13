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

/* Minimal GLib C bindings for LablGTK4
 *
 * This file provides basic GLib functionality needed for GTK4:
 * - Application name get/set
 * - Program name get/set
 * - List conversions (GList/GSList <-> OCaml list)
 * - Error handling (GError)
 *
 * Additional GLib bindings (main loop, I/O channels, etc.) will be
 * added in Phase 2.
 */

#include <string.h>
#include <locale.h>
#include <glib.h>
#include <gtk/gtk.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/threads.h>

#include "wrappers.h"
#include "glib_tags.h"

/* ==================================================================== */
/* GLib Initialization */
/* ==================================================================== */

CAMLprim value ml_glib_init(value unit)
{
    /* Initialize GLib error domain mappings */
    /* More error domains will be registered as needed */
    return Val_unit;
}

/* ==================================================================== */
/* Application/Program Name Functions */
/* ==================================================================== */

CAMLprim value ml_g_get_prgname(value unit)
{
    const char *name = g_get_prgname();
    if (name == NULL)
        return Val_int(0); /* None */
    else {
        value res = caml_alloc(1, 0); /* Some */
        Store_field(res, 0, caml_copy_string(name));
        return res;
    }
}

CAMLprim value ml_g_set_prgname(value name)
{
    g_set_prgname(String_val(name));
    return Val_unit;
}

CAMLprim value ml_g_get_application_name(value unit)
{
    const char *name = g_get_application_name();
    if (name == NULL)
        return Val_int(0); /* None */
    else {
        value res = caml_alloc(1, 0); /* Some */
        Store_field(res, 0, caml_copy_string(name));
        return res;
    }
}

CAMLprim value ml_g_set_application_name(value name)
{
    g_set_application_name(String_val(name));
    return Val_unit;
}

/* ==================================================================== */
/* List Conversion Utilities */
/* ==================================================================== */

/* Convert GList to OCaml list */
CAMLprim value Val_GList(GList *list, value (*func)(gpointer))
{
    CAMLparam0();
    CAMLlocal3(res, cons, tmp);

    res = Val_emptylist;
    GList *tmp_list = g_list_last(list);

    while (tmp_list != NULL) {
        tmp = func(tmp_list->data);
        cons = caml_alloc_small(2, 0);
        Field(cons, 0) = tmp;
        Field(cons, 1) = res;
        res = cons;
        tmp_list = tmp_list->prev;
    }

    CAMLreturn(res);
}

/* Convert GList to OCaml list and free the GList */
CAMLprim value Val_GList_free(GList *list, value (*func)(gpointer))
{
    value res = Val_GList(list, func);
    g_list_free(list);
    return res;
}

/* Convert OCaml list to GList */
CAMLprim GList *GList_val(value list, gpointer (*func)(value))
{
    GList *res = NULL;

    while (list != Val_emptylist) {
        res = g_list_prepend(res, func(Field(list, 0)));
        list = Field(list, 1);
    }

    return g_list_reverse(res);
}

/* Convert GSList to OCaml list
 * Note: GSList is a singly-linked list (no ->prev pointer)
 */
CAMLprim value Val_GSList(GSList *list, value (*func)(gpointer))
{
    CAMLparam0();
    CAMLlocal3(res, cons, tmp);

    res = Val_emptylist;

    /* Build list in reverse by collecting elements first */
    GList *glist = NULL;
    GSList *tmp_list = list;
    while (tmp_list != NULL) {
        glist = g_list_prepend(glist, tmp_list->data);
        tmp_list = tmp_list->next;
    }

    /* Now convert in reverse order */
    GList *g = glist;
    while (g != NULL) {
        tmp = func(g->data);
        cons = caml_alloc_small(2, 0);
        Field(cons, 0) = tmp;
        Field(cons, 1) = res;
        res = cons;
        g = g->next;
    }

    g_list_free(glist);
    CAMLreturn(res);
}

/* Convert GSList to OCaml list and free the GSList */
CAMLprim value Val_GSList_free(GSList *list, value (*func)(gpointer))
{
    value res = Val_GSList(list, func);
    g_slist_free(list);
    return res;
}

/* Convert OCaml list to GSList */
CAMLprim GSList *GSList_val(value list, gpointer (*func)(value))
{
    GSList *res = NULL;

    while (list != Val_emptylist) {
        res = g_slist_prepend(res, func(Field(list, 0)));
        list = Field(list, 1);
    }

    return g_slist_reverse(res);
}

/* ==================================================================== */
/* Error Handling (GError) */
/* ==================================================================== */

/* Raise OCaml exception from GError */
CAMLprim void ml_raise_gerror(GError *err)
{
    static const value *exn = NULL;
    CAMLparam0();
    CAMLlocal1(arg);

    if (exn == NULL)
        exn = caml_named_value("gerror");

    if (err) {
        arg = caml_alloc_small(2, 0);
        Field(arg, 0) = Val_int(err->code);
        Field(arg, 1) = caml_copy_string(err->message);
        g_error_free(err);
    } else {
        arg = caml_alloc_small(2, 0);
        Field(arg, 0) = Val_int(0);
        Field(arg, 1) = caml_copy_string("Unknown GLib error");
    }

    caml_raise_with_arg(*exn, arg);
    CAMLreturn0;
}

/* ==================================================================== */
/* String Utilities */
/* ==================================================================== */

/* Copy a NULL-terminated array of strings to OCaml string list */
value copy_string_v(const gchar * const *v)
{
    CAMLparam0();
    CAMLlocal4(h, p, c, s);

    h = p = Val_emptylist;
    while (*v != NULL) {
        s = caml_copy_string(*v);
        c = caml_alloc_small(2, 0);
        Field(c, 0) = s;
        Field(c, 1) = Val_emptylist;
        if (p == Val_emptylist)
            h = c;
        else
            Store_field(p, 1, c);
        p = c;
        v++;
    }

    CAMLreturn(h);
}

/* Copy a string and free it with g_free */
CAMLprim value copy_string_g_free(char *str)
{
    value res = caml_copy_string(str != NULL ? str : "");
    g_free(str);
    return res;
}

/* Check if string is NULL and copy appropriately */
value copy_string_check(const char *str)
{
    if (str == NULL)
        return caml_copy_string("");
    else
        return caml_copy_string(str);
}
