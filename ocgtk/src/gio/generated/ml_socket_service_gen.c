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

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,22,0)


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

#if GLIB_CHECK_VERSION(2,46,0)

CAMLexport CAMLprim value ml_g_socket_service_get_active(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GSocketService *obj = (GSocketService *)GSocketService_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_g_socket_service_get_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "active", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

#else

CAMLexport CAMLprim value ml_g_socket_service_get_active(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("SocketService requires GLib >= 2.46");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,46,0)

CAMLexport CAMLprim value ml_g_socket_service_set_active(value self, value new_value)
{
    CAMLparam2(self, new_value);
GSocketService *obj = (GSocketService *)GSocketService_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "active");
if (pspec == NULL) caml_failwith("ml_g_socket_service_set_active: property 'active' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "active", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_socket_service_set_active(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("SocketService requires GLib >= 2.46");
return Val_unit;
}
#endif

#else


CAMLexport CAMLprim value ml_g_socket_service_new(value unit)
{
CAMLparam1(unit);
(void)unit;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_socket_service_is_active(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_socket_service_start(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_socket_service_stop(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_socket_service_get_active(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_socket_service_set_active(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("SocketService requires GLib >= 2.22");
return Val_unit;
}


#endif
