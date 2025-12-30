/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketListener */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_socket_listener_new(value unit)
{
CAMLparam1(unit);
GSocketListener *obj = g_socket_listener_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GSocketListener(obj));
}

CAMLexport CAMLprim value ml_g_socket_listener_set_backlog(value self, value arg1)
{
CAMLparam2(self, arg1);

g_socket_listener_set_backlog(GSocketListener_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_socket_listener_close(value self)
{
CAMLparam1(self);

g_socket_listener_close(GSocketListener_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_socket_listener_get_listen_backlog(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSocketListener *obj = (GSocketListener *)GSocketListener_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "listen-backlog");
if (pspec == NULL) caml_failwith("ml_gtk_socket_listener_get_listen_backlog: property 'listen-backlog' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "listen-backlog", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_socket_listener_set_listen_backlog(value self, value new_value)
{
CAMLparam2(self, new_value);
GSocketListener *obj = (GSocketListener *)GSocketListener_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "listen-backlog");
if (pspec == NULL) caml_failwith("ml_gtk_socket_listener_set_listen_backlog: property 'listen-backlog' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "listen-backlog", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
