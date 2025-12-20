(* High-level class for ConverterIface *)
class converter_iface (obj : Converter_iface.t) = object (self)

    method as_converter_iface = obj
end

