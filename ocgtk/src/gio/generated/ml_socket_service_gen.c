/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketService */

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


CAMLexport CAMLprim value ml_g_socket_service_new(value unit)
{
CAMLparam1(unit);

GSocketService *obj = g_socket_service_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GSocketService(obj));
}
CAMLexport CAMLprim value ml_g_socket_service_stop(value self)
{
CAMLparam1(self);

g_socket_service_stop(GSocketService_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_socket_service_start(value self)
{
CAMLparam1(self);

g_socket_service_start(GSocketService_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_socket_service_is_active(value self)
{
CAMLparam1(self);

gboolean result = g_socket_service_is_active(GSocketService_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_socket_service_get_active(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GSocketService *obj = (GSocketService *)GSocketService_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_socket_service_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_socket_service_set_active(value self, value new_value)
{
    CAMLparam2(self, new_value);
GSocketService *obj = (GSocketService *)GSocketService_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_gtk_socket_service_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}
