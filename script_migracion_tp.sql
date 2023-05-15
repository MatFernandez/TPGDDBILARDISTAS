go

create schema BILARDISTAS;
go


create procedure BILARDISTAS.Creacion_Tablas 
as
begin

create table BILARDISTAS.Estado_Envio_Mensajeria(
	ENVIO_MENSAJERIA_ESTADO nvarchar(50),
	ENVIO_MENSAJERIA_ESTADO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Tipo_Movilidad(
	REPARTIDOR_TIPO_MOVILIDAD nvarchar(50),
	TIPO_MOVILIDAD_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Paquete_Tipo(
	PAQUTE_TIPO nvarchar(50),
	PAQUETE_ALTO_MAX decimal(18,2),
	PAQUETE_ANCHO_MAX decimal(18,2),
	PAQUETE_LARGO_MAX decimal(18,2),
	PAQUETE_PESO_MAX decimal(18,2),
	PAQUETE_TIPO_PRECIO decimal(18,2)
	);

create table BILARDISTAS.Operador(
	OPERADOR_CODIGO int identity (1,1),
	OPERADOR_RECLAMO_NOMBRE nvarchar(255),
	OPERADOR_RECLAMO_APELLIDO nvarchar(255),
	OPERADOR_RECLAMO_DNI decimal(18,2),
	OPERADOR_RECLAMO_TELEFONO decimal(18,2),
	OPERADOR_RECLAMO_DIRECCION nvarchar(255),
	OPERADOR_RECLAMO_MAIL nvarchar(255),
	OPERADOR_RECLAMO_FECHA_NAC date
	);

create table BILARDISTAS.Tipo_Reclamo(
	RECLAMO_TIPO nvarchar(50),
	RECLAMO_TIPO_DETALLE nvarchar(50)
	);


create table BILARDISTAS.Estado_Reclamo(
	RECLAMO_ESTADO nvarchar(50),
	RECLAMO_ESTADO_DETALLE nvarchar(50)
	);


create table BILARDISTAS.Tipo_Reclamo_Cupon(
	CUPON_RECLAMO_TIPO nvarchar(50),
	CUPON_RECLAMO_TIPO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Tipo_Cupon(
	CUPON_TIPO nvarchar(50),
	CUPON_TIPO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Reclamo(
	RECLAMO_NUMERO decimal(18,0),
	RECLAMO_USUARIO int,
	RECLAMO_PEDIDO decimal(18,2),
	RECLAMO_NRO_CUPON decimal(18,2),
	RECLAMO_TIPO nvarchar(50),
	RECLAMO_ESTADO nvarchar(50),
	RECLAMO_FECHA datetime2(3),
	RECLAMO_DESCRIPCION nvarchar(255),
	RECLAMO_FECHA_SOLUCION datetime2(3),
	RECLAMO_SOLUCION nvarchar(255),
	RECLAMO_CALIFICACION decimal(18,0)
	);

create table BILARDISTAS.Cupon_Reclamo(
	CUPON_RECLAMO_NRO decimal(18,0),
	CUPON_RECLAMO_MONTO decimal(18,0),
	CUPON_RECLAMO_FECHA_ALTA datetime2(3),
	CUPON_RECLAMO_FECHA_VENCIMIENTO datetime2(3),
	CUPON_RECLAMO_TIPO nvarchar(50)
	);

create table BILARDISTAS.Cupon(
	CUPON_NRO decimal(18,0),
	CUPON_CODIGO_USUARIO int,
	CUPON_TIPO nvarchar(50),
	CUPON_MONTO decimal(18,2),
	CUPON_FECHA_ALTA datetime2(3),
	CUPON_FECHA_VENCIMIENTO datetime2(3)
	);

create table BILARDISTAS.Usuario(
	USUARIO_CODIGO int identity(1,1),
	USUARIO_NOMBRE nvarchar(255),
	USUARIO_APELLIDO nvarchar(255),
	USUARIO_DNI decimal(18),
	USUARIO_FECHA_REGISTRO datetime2(3),
	USUARIO_TELEFONO decimal(18),
	USUARIO_FECHA_NAC date,
	USUARIO_MAIL nvarchar(255)
	);


create table BILARDISTAS.Provincia(
	PROVINCIA nvarchar(255),
	LOCALIDAD nvarchar(255),
	PROVINCIA_DETALLE nvarchar(255)
	);

create table BILARDISTAS.Localidad(
	LOCALIDAD nvarchar(255),
	LOCALIDAD_DETALLE nvarchar(255)
	);

create table BILARDISTAS.Direccion_Usuario(
	DIRECCION_USUARIO_CODIGO_USUARIO int,
	DIRECCION_USUARIO_NOMBRE nvarchar(50),
	DIRECCION_USUARIO_DIRECCION nvarchar(255),
	DIRECCION_USUARIO_LOCALIDAD nvarchar(255),
	DIRECCION_USUARIO_PROVINCIA nvarchar(255)
	);

create table BILARDISTAS.Envio_Mensajeria(
	ENVIO_MENSAJERIA_NRO decimal(18),
	ENVIO_MENSAJERIA_USUARIO int,
	ENVIO_MENSAJERIA_REPARTIDOR int,
	ENVIO_MENSAJERIA_PAQUETE_TIPO nvarchar(50),
	ENVIO_MENSAJERIA_MEDIO_PAGO int,
	ENVIO_MENSAJERIA_ESTADO nvarchar(50),
	ENVIO_MENSAJERIA_DIR_ORIGEN nvarchar(255),
	ENVIO_MENSAJERIA_DIR_DESTINO nvarchar(255),
	ENVIO_MENSAJERIA_PROVINCIA nvarchar(255),
	ENVIO_MENSAJERIA_LOCALIDAD nvarchar(255),
	ENVIO_MENSAJERIA_KM decimal(18,2),
	ENVIO_MENSAJERIA_PRECIO_ENVIO decimal(18,2),
	ENVIO_MENSAJERIA_PRECIO_SEGURO decimal(18,2),
	ENVIO_MENSAJERIA_PROPINA decimal(18,2),
	ENVIO_MENSAJERIA_TOTAL decimal(18,2),
	ENVIO_MENSAJERIA_OBSERV nvarchar(255),
	ENVIO_MENSAJERIA_FECHA datetime2(3),
	ENVIO_MENSAJERIA_FECHA_ENTREGA datetime2(3),
	ENVIO_MENSAJERIA_TIEMPO_ESTIMADO decimal(18,2),
	ENVIO_MENSAJERIA_CALIFICACION decimal(18,2)
	);

create table BILARDISTAS.Repartidor(
	REPARTIDOR_CODIGO int identity(1,1),
	REPARTIDOR_TIPO_MOVILIDAD nvarchar(50),
	REPARTIDOR_NOMBRE nvarchar(255),
	REPARTIDOR_APELLIDO nvarchar(255),
	REPARTIDOR_DNI decimal(18),
	REPARTIDOR_TELEFONO decimal(18),
	REPARTIDOR_DIRECCION nvarchar(255),
	REPARTIDOR_EMAIL nvarchar(255),
	REPARTIDOR_FECHA_NAC date,
	REPARTIDOR_LOCALIDAD nvarchar(255)
	);

create table BILARDISTAS.Repartidor_Localidad(
	LOCALIDAD nvarchar(255),
	REPARTIDOR int,
	ESTADO nvarchar(50)
	);

create table BILARDISTAS.Estado_Repartidor_Localidad(
	ESTADO nvarchar(50),
	DETALLE nvarchar(255)
	);

create table BILARDISTAS.Medio_Pago_Tipo(
	MEDIO_PAGO_TIPO nvarchar(50),
	MEDIO_PAGO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Marca_Tarjeta(
	MARCA_TARJETA nvarchar(100),
	MARCA_TARJETA_DETALLE nvarchar(100)
	);

create table BILARDISTAS.Medio_De_Pago(
	MEDIO_PAGO_CODIGO int identity(1,1),
	MEDIO_PAGO_USUARIO int,
	MEDIO_PAGO_TIPO nvarchar(50),
	MARCA_TARJETA nvarchar(100),
	MEDIO_PAGO_NRO_TARJETA nvarchar(50)
	);

create table BILARDISTAS.Producto(
	PRODUCTO_CODIGO nvarchar(50),
	PRODUCTO_NOMBRE nvarchar(50),
	PRODUCTO_DESCRIPCION nvarchar(255),
	PRODUCTO_PRECIO decimal(18,2)
	);

create table BILARDISTAS.Producto_Local(
	PRODUCTO_LOCAL_CODIGO_LOCAL int,
	PRODUCTO_LOCAL_CODIGO_PRODUCTO nvarchar(50)
	);

create table BILARDISTAS.Local_Tienda(
	LOCAL_CODIGO int identity(1,1),
	LOCAL_CATEGORIA nvarchar(50),
	LOCAL_TIPO nvarchar(50),
	LOCAL_NOMBRE nvarchar(50),
	LOCAL_DESCRIPCION nvarchar(255),
	LOCAL_DIRECCION nvarchar(255),
	LOCAL_LOCALIDAD nvarchar(255),
	LOCAL_PROVINCIA nvarchar(255)
	);

create table BILARDISTAS.Tipo_Local(
	LOCAL_TIPO nvarchar(50),
	TIPO_LOCAL_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Categoria_Local(
	LOCAL_CATEGORIA nvarchar(50),
	LOCAL_TIPO nvarchar(50),
	CATEGORIA_LOCAL_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Horario_Local(
	HORARIO_LOCAL_CODIGO_DIA nvarchar(50),
	HORARIO_LOCAL_CODIGO_LOCAL int,
	HORARIO_LOCAL_HORA_APERTURA decimal(18,2),
	HORARIO_LOCAL_HORA_CIERRE decimal(18,2)
	);

create table BILARDISTAS.Dia(
	HORARIO_LOCAL_DIA nvarchar(50),
	HORARIO_LOCAL_DIA_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Pedido_Estado(
	PEDIDO_ESTADO nvarchar(50),
	PEDIDO_ESTADO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Pedido(
	PEDIDO_NRO decimal(18),
	PEDIDO_USUARIO int,
	PEDIDO_LOCAL int,
	PEDIDO_MEDIO_PAGO int,
	PEDIDO_ESTADO nvarchar(50),
	PEDIDO_ENVIO int,
	PEDIDO_OBSERV nvarchar(255),
	PEDIDO_FECHA datetime2(3),
	PEDIDO_FECHA_ENTREGA datetime2(3),
	PEDIDO_TIEMPO_ESTIMADO_ENTREGA decimal(18,2),
	PEDIDO_CALIFICACION decimal(18,0),
	PEDIDO_TOTAL_PRODUCTOS decimal(18,2),
	PEDIDO_TARIFA_SERVICIO decimal(18,2),
	PEDIDO_TOTAL_CUPONES decimal(18,2),
	PEDIDO_TOTAL decimal(18,2)
	);

create table BILARDISTAS.Producto_Por_Pedido(
	PEDIDO_NRO decimal(18),
	PEDIDO_LOCAL_CODIGO_LOCAL int,
	PRODUCTO_LOCAL_CODIGO nvarchar(50),
	PRODUCTO_CANTIDAD decimal(18,2),
	PRODUCTO_PRECIO decimal (18,2),
	PRODUCTO_TOTAL decimal (18,2)
	);

create table BILARDISTAS.Envio_Pedido(
	ENVIO_PEDIDO_CODIGO int identity(1,1),
	ENVIO_REPARTIDOR int,
	ENVIO_DIRECCION int,
	ENVIO_PRECIO decimal(18,2),
	ENVIO_PROPINA decimal(18,2)
	);

create table BILARDISTAS.Pedido_Cupon(
	CUPON_NRO decimal(18,2),
	CUPON_NRO_PEDIDO decimal(18)
	);


--ACA VAN LAS PKS Y FKS


end
go


create procedure BILARDISTAS.Eliminar_Tablas 
as
begin 
drop table BILARDISTAS.Categoria_Local
drop table BILARDISTAS.Cupon
drop table BILARDISTAS.Cupon_Reclamo
drop table BILARDISTAS.Dia
drop table BILARDISTAS.Direccion_Usuario
drop table BILARDISTAS.Envio_Mensajeria
drop table BILARDISTAS.Envio_Pedido
drop table BILARDISTAS.Estado_Envio_Mensajeria
drop table BILARDISTAS.Estado_Reclamo
drop table BILARDISTAS.Estado_Repartidor_Localidad
drop table BILARDISTAS.Horario_Local
drop table BILARDISTAS.Local_Tienda
drop table BILARDISTAS.Localidad
drop table BILARDISTAS.Marca_Tarjeta
drop table BILARDISTAS.Medio_De_Pago
drop table BILARDISTAS.Medio_Pago_Tipo
drop table BILARDISTAS.Operador
drop table BILARDISTAS.Paquete_Tipo
drop table BILARDISTAS.Pedido
drop table BILARDISTAS.Pedido_Cupon
drop table BILARDISTAS.Pedido_Estado
drop table BILARDISTAS.Producto
drop table BILARDISTAS.Producto_Local
drop table BILARDISTAS.Producto_Por_Pedido
drop table BILARDISTAS.Provincia
drop table BILARDISTAS.Reclamo
drop table BILARDISTAS.Repartidor
drop table BILARDISTAS.Repartidor_Localidad
drop table BILARDISTAS.Tipo_Cupon
drop table BILARDISTAS.Tipo_Local
drop table BILARDISTAS.Tipo_Movilidad
drop table BILARDISTAS.Tipo_Reclamo
drop table BILARDISTAS.Tipo_Reclamo_Cupon
drop table BILARDISTAS.Usuario
end
go



---------------------------------------------------------------------------------------------------------
--------------------------------------- EJECUCION DE STORED PROCEDURES ----------------------------------
---------------------------------------------------------------------------------------------------------




exec BILARDISTAS.Creacion_Tablas





---------------------------------------------------------------------------------------------------------
------------------------------------------------- EXTRAS ------------------------------------------------
---------------------------------------------------------------------------------------------------------

exec BILARDISTAS.Eliminar_Tablas
drop procedure BILARDISTAS.Creacion_Tablas
drop procedure BILARDISTAS.Eliminar_Tablas
drop schema BILARDISTAS

