use [GD1C2023]
go

go
create schema BILARDISTAS;
go


create procedure BILARDISTAS.Creacion_Tablas 
as
begin

create table BILARDISTAS.Estado_Envio_Mensajeria(
	ESTADO_ENVIO_MENSAJERIA nvarchar(50) not null,
	ESTADO_ENVIO_MENSAJERIA_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Tipo_Movilidad(
	TIPO_MOVILIDAD_REPARTIDOR nvarchar(50) not null,
	TIPO_MOVILIDAD_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Paquete_Tipo(
	PAQUETE_TIPO nvarchar(50) not null,
	PAQUETE_ALTO_MAX decimal(18,2),
	PAQUETE_ANCHO_MAX decimal(18,2),
	PAQUETE_LARGO_MAX decimal(18,2),
	PAQUETE_PESO_MAX decimal(18,2),
	PAQUETE_TIPO_PRECIO decimal(18,2)
	);

create table BILARDISTAS.Operador(
	OPERADOR_CODIGO int identity (1,1) not null,
	OPERADOR_RECLAMO_NOMBRE nvarchar(255),
	OPERADOR_RECLAMO_APELLIDO nvarchar(255),
	OPERADOR_RECLAMO_DNI decimal(18,2),
	OPERADOR_RECLAMO_TELEFONO decimal(18,2),
	OPERADOR_RECLAMO_DIRECCION nvarchar(255),
	OPERADOR_RECLAMO_MAIL nvarchar(255),
	OPERADOR_RECLAMO_FECHA_NAC date
	);

create table BILARDISTAS.Tipo_Reclamo(
	TIPO_RECLAMO nvarchar(50) not null,
	TIPO_RECLAMO_DETALLE nvarchar(50)
	);


create table BILARDISTAS.Estado_Reclamo(
	ESTADO_RECLAMO nvarchar(50) not null,
	ESTADO_RECLAMO_DETALLE nvarchar(50)
	);


create table BILARDISTAS.Tipo_Cupon_Reclamo(
	TIPO_CUPON_RECLAMO nvarchar(50) not null,
	TIPO_CUPON_RECLAMO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Tipo_Cupon(
	TIPO_CUPON nvarchar(50) not null,
	TIPO_CUPON_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Reclamo(
	RECLAMO_NUMERO decimal(18,0) not null,
	RECLAMO_USUARIO int not null,
	RECLAMO_OPERADOR int not null,
	RECLAMO_PEDIDO decimal(18,0) not null,
	RECLAMO_TIPO nvarchar(50) not null,
	RECLAMO_ESTADO nvarchar(50) not null,
	RECLAMO_FECHA datetime2(3),
	RECLAMO_DESCRIPCION nvarchar(255),
	RECLAMO_FECHA_SOLUCION datetime2(3),
	RECLAMO_SOLUCION nvarchar(255),
	RECLAMO_CALIFICACION decimal(18,0)
	);

create table BILARDISTAS.Cupon_Reclamo(
	CUPON_RECLAMO_CUPON decimal(18,0) not null,
    CUPON_RECLAMO_CODIGO_RECLAMO decimal(18,0) not null,
    CUPON_RECLAMO_NRO decimal(18,0) not null,
    CUPON_RECLAMO_MONTO decimal(18,2),
    CUPON_RECLAMO_FECHA_ALTA datetime2(3),
    CUPON_RECLAMO_FECHA_VENCIMIENTO datetime2(3),
    CUPON_RECLAMO_TIPO nvarchar(50) not null
	);

create table BILARDISTAS.Cupon(
	CUPON_NRO decimal(18,0) not null,
	CUPON_CODIGO_USUARIO int not null,
	CUPON_TIPO nvarchar(50) not null,
	CUPON_MONTO decimal(18,2),
	CUPON_FECHA_ALTA datetime2(3),
	CUPON_FECHA_VENCIMIENTO datetime2(3)
	);

create table BILARDISTAS.Usuario(
	USUARIO_CODIGO int identity(1,1) not null,
	USUARIO_NOMBRE nvarchar(255),
	USUARIO_APELLIDO nvarchar(255),
	USUARIO_DNI decimal(18),
	USUARIO_FECHA_REGISTRO datetime2(3),
	USUARIO_TELEFONO decimal(18),
	USUARIO_FECHA_NAC date,
	USUARIO_MAIL nvarchar(255)
	);


create table BILARDISTAS.Provincia(
	PROVINCIA nvarchar(255) not null,
	PROVINCIA_DETALLE nvarchar(255)
	);

create table BILARDISTAS.Localidad(
	LOCALIDAD int identity(1,1) not null,
	LOCALIDAD_PROVINCIA nvarchar(255) not null,
	LOCALIDAD_DETALLE nvarchar(255)
	);

create table BILARDISTAS.Direccion_Usuario(
	DIRECCION_USUARIO_CODIGO_USUARIO int not null,
	DIRECCION_USUARIO_NOMBRE nvarchar(50) not null,
	DIRECCION_USUARIO_DIRECCION nvarchar(255),
	DIRECCION_USUARIO_LOCALIDAD int
	);

create table BILARDISTAS.Envio_Mensajeria(
	ENVIO_MENSAJERIA_NRO decimal(18) not null,
	ENVIO_MENSAJERIA_USUARIO int,
	ENVIO_MENSAJERIA_REPARTIDOR int,
	ENVIO_MENSAJERIA_PAQUETE_TIPO nvarchar(50),
	ENVIO_MENSAJERIA_MEDIO_PAGO int,
	ENVIO_MENSAJERIA_ESTADO nvarchar(50),
	ENVIO_MENSAJERIA_DIR_ORIGEN nvarchar(255),
	ENVIO_MENSAJERIA_DIR_DESTINO nvarchar(255),
	ENVIO_MENSAJERIA_LOCALIDAD int,
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
	REPARTIDOR_CODIGO int identity(1,1) not null ,
	REPARTIDOR_TIPO_MOVILIDAD nvarchar(50),
	REPARTIDOR_NOMBRE nvarchar(255),
	REPARTIDOR_APELLIDO nvarchar(255),
	REPARTIDOR_DNI decimal(18),
	REPARTIDOR_TELEFONO decimal(18),
	REPARTIDOR_DIRECCION nvarchar(255),
	REPARTIDOR_EMAIL nvarchar(255),
	REPARTIDOR_FECHA_NAC date
	);

create table BILARDISTAS.Repartidor_Localidad(
	LOCALIDAD int not null,
	REPARTIDOR int not null,
	ESTADO nvarchar(50)
	);

create table BILARDISTAS.Estado_Repartidor_Localidad(
	ESTADO nvarchar(50) not null,
	DETALLE nvarchar(255)
	);

create table BILARDISTAS.Medio_Pago_Tipo(
	MEDIO_PAGO_TIPO nvarchar(50) not null,
	MEDIO_PAGO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Marca_Tarjeta(
	MARCA_TARJETA nvarchar(100) not null,
	MARCA_TARJETA_DETALLE nvarchar(100)
	);

create table BILARDISTAS.Medio_De_Pago(
	MEDIO_PAGO_CODIGO int identity(1,1) not null,
	MEDIO_PAGO_USUARIO int,
	MEDIO_PAGO_TIPO nvarchar(50),
	MEDIO_PAGO_MARCA_TARJETA nvarchar(100),
	MEDIO_PAGO_NRO_TARJETA nvarchar(50)
	);

create table BILARDISTAS.Producto(
	PRODUCTO_CODIGO nvarchar(50) not null,
	PRODUCTO_NOMBRE nvarchar(50),
	PRODUCTO_DESCRIPCION nvarchar(255),
	PRODUCTO_PRECIO decimal(18,2)
	);

create table BILARDISTAS.Producto_Local(
	PRODUCTO_LOCAL_CODIGO_LOCAL int not null,
	PRODUCTO_LOCAL_CODIGO_PRODUCTO nvarchar(50) not null
	);

create table BILARDISTAS.Local_Tienda(
	LOCAL_CODIGO int identity(1,1) not null,
	LOCAL_CATEGORIA nvarchar(50),
	LOCAL_TIPO int,
	LOCAL_NOMBRE nvarchar(50),
	LOCAL_DESCRIPCION nvarchar(255),
	LOCAL_DIRECCION nvarchar(255),
	LOCAL_LOCALIDAD int
	);

create table BILARDISTAS.Tipo_Local(
	TIPO_LOCAL int identity(1,1) not null,
	TIPO_LOCAL_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Categoria_Local(
	CATEGORIA_LOCAL nvarchar(50) not null,
	CATEGORIA_LOCAL_TIPO int,
	CATEGORIA_LOCAL_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Horario_Local(
	HORARIO_LOCAL_CODIGO int identity (1,1) not null,
	HORARIO_LOCAL_CODIGO_DIA nvarchar(50),
	HORARIO_LOCAL_CODIGO_LOCAL int,
	HORARIO_LOCAL_HORA_APERTURA decimal(18,2),
	HORARIO_LOCAL_HORA_CIERRE decimal(18,2)
	);

create table BILARDISTAS.Dia(
	DIA_HORARIO_LOCAL nvarchar(50) not null,
	DIA_HORARIO_LOCAL_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Estado_Pedido(
	ESTADO_PEDIDO nvarchar(50) not null,
	ESTADO_PEDIDO_DETALLE nvarchar(50)
	);

create table BILARDISTAS.Pedido(
	PEDIDO_NRO decimal(18,0) not null,
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
	PRODUCTO_PEDIDO_NRO decimal(18) not null,
	PRODUCTO_PEDIDO_LOCAL_CODIGO nvarchar(50) not null,
	PRODUCTO_CANTIDAD decimal(18,2),
	PRODUCTO_PRECIO decimal (18,2),
	PRODUCTO_TOTAL decimal (18,2)
	);

create table BILARDISTAS.Envio_Pedido(
	ENVIO_PEDIDO_CODIGO int identity(1,1) not null,
	ENVIO_REPARTIDOR int,
	ENVIO_DIRECCION int,
	ENVIO_PRECIO decimal(18,2),
	ENVIO_PROPINA decimal(18,2)
	);

create table BILARDISTAS.Pedido_Cupon(
	PEDIDO_CUPON_NRO_CUPON decimal(18,0) not null,
	PEDIDO_CUPON_NRO_PEDIDO decimal(18,0) not null
	);

	print ' Estructura de tablas creadas con exito ';
end
go


---------------------------------------------------------------------------------------------------------
--------------------------------------- CREACION DE PRIMARY KEYS ----------------------------------------
---------------------------------------------------------------------------------------------------------

create procedure BILARDISTAS.Creacion_PKs
as
begin

alter table BILARDISTAS.Paquete_Tipo
add primary key (PAQUETE_TIPO)

alter table BILARDISTAS.Usuario
add primary key (USUARIO_CODIGO)

alter table BILARDISTAS.Operador
add primary key (OPERADOR_CODIGO)

alter table BILARDISTAS.Tipo_Reclamo
add primary key (TIPO_RECLAMO)

alter table BILARDISTAS.Estado_Reclamo
add primary key (ESTADO_RECLAMO)

alter table BILARDISTAS.Estado_Envio_Mensajeria
add primary key (ESTADO_ENVIO_MENSAJERIA)

alter table BILARDISTAS.Tipo_Movilidad
add primary key (TIPO_MOVILIDAD_REPARTIDOR)

alter table BILARDISTAS.Envio_Pedido
add primary key (ENVIO_PEDIDO_CODIGO)

alter table BILARDISTAS.Tipo_Cupon_Reclamo
add primary key (TIPO_CUPON_RECLAMO)

alter table BILARDISTAS.Tipo_Cupon
add primary key (TIPO_CUPON)

alter table BILARDISTAS.Reclamo
add primary key (RECLAMO_NUMERO)

alter table BILARDISTAS.Cupon_Reclamo 
add primary key (CUPON_RECLAMO_CUPON, CUPON_RECLAMO_CODIGO_RECLAMO)

alter table BILARDISTAS.Cupon
add primary key (CUPON_NRO)

alter table BILARDISTAS.Local_Tienda
add primary key (LOCAL_CODIGO)

alter table BILARDISTAS.Tipo_Local
add primary key (TIPO_LOCAL)

alter table BILARDISTAS.Categoria_Local
add primary key (CATEGORIA_LOCAL)

alter table BILARDISTAS.Provincia
add primary key (PROVINCIA)

alter table BILARDISTAS.Localidad
add primary key (LOCALIDAD)

alter table BILARDISTAS.Direccion_Usuario
add primary key (DIRECCION_USUARIO_CODIGO_USUARIO)

alter table BILARDISTAS.Envio_Mensajeria 
add primary key (ENVIO_MENSAJERIA_NRO)

alter table BILARDISTAS.Repartidor
add primary key (REPARTIDOR_CODIGO)

alter table BILARDISTAS.Estado_Repartidor_Localidad
add primary key (ESTADO)

alter table BILARDISTAS.Medio_Pago_Tipo
add primary key (MEDIO_PAGO_TIPO)

alter table BILARDISTAS.Marca_Tarjeta
add primary key (MARCA_TARJETA)

alter table BILARDISTAS.Medio_de_Pago
add primary key (MEDIO_PAGO_CODIGO)

alter table BILARDISTAS.Producto
add primary key (PRODUCTO_CODIGO)

alter table BILARDISTAS.Dia
add primary key (DIA_HORARIO_LOCAL)

alter table BILARDISTAS.Horario_Local
add primary key (HORARIO_LOCAL_CODIGO)

alter table BILARDISTAS.Estado_Pedido 
add primary key (ESTADO_PEDIDO)

alter table BILARDISTAS.Pedido
add primary key (PEDIDO_NRO)

alter table BILARDISTAS.Pedido_Cupon
add primary key (PEDIDO_CUPON_NRO_CUPON, PEDIDO_CUPON_NRO_PEDIDO)

alter table BILARDISTAS.Producto_Por_Pedido 
add primary key (PRODUCTO_PEDIDO_NRO, PRODUCTO_PEDIDO_LOCAL_CODIGO)

alter table BILARDISTAS.Repartidor_Localidad 
add primary key (REPARTIDOR,LOCALIDAD)

alter table BILARDISTAS.Producto_Local
add primary key (PRODUCTO_LOCAL_CODIGO_LOCAL, PRODUCTO_LOCAL_CODIGO_PRODUCTO)

	print ' Primary Keys creadas con exito ';
end
go


create procedure BILARDISTAS.Creacion_Fks
as
begin

---------------------------------------------------------------------------------------------------------
--------------------------------------- CREACION DE FOREING KEYS ----------------------------------------
---------------------------------------------------------------------------------------------------------

alter table BILARDISTAS.Reclamo
	add constraint FK_Reclamo_Usuario foreign key (RECLAMO_USUARIO) references BILARDISTAS.Usuario (USUARIO_CODIGO)

alter table BILARDISTAS.Reclamo
	add constraint FK_Reclamo_Pedido foreign key (RECLAMO_PEDIDO) references BILARDISTAS.Pedido (PEDIDO_NRO)

alter table BILARDISTAS.Reclamo
	add constraint FK_Reclamo_Tipo foreign key (RECLAMO_TIPO) references BILARDISTAS.Tipo_Reclamo (TIPO_RECLAMO)

alter table BILARDISTAS.Reclamo
	add constraint FK_Reclamo_Estado foreign key (RECLAMO_ESTADO) references BILARDISTAS.Estado_Reclamo (ESTADO_RECLAMO)

alter table BILARDISTAS.Cupon_Reclamo
	add constraint FK_Cupon_Reclamo_Cupon foreign key (CUPON_RECLAMO_CUPON) references BILARDISTAS.Cupon (CUPON_NRO)

alter table BILARDISTAS.Cupon_Reclamo 
	add constraint FK_Cupon_Reclamo_Codigo_Reclamo foreign key (CUPON_RECLAMO_CODIGO_RECLAMO) references BILARDISTAS.Reclamo (RECLAMO_NUMERO)

alter table BILARDISTAS.Cupon
	add constraint FK_Cupon_Usuario foreign key (CUPON_CODIGO_USUARIO) references BILARDISTAS.Usuario (USUARIO_CODIGO)

alter table BILARDISTAS.Cupon
	add constraint FK_Cupon_Tipo foreign key (CUPON_TIPO) references BILARDISTAS.Tipo_Cupon (TIPO_CUPON)

alter table BILARDISTAS.Reclamo
	add constraint FK_Operador foreign key (RECLAMO_OPERADOR) references BILARDISTAS.Operador (OPERADOR_CODIGO)

alter table BILARDISTAS.Localidad
	add constraint FK_Localidad_Provincia foreign key (LOCALIDAD_PROVINCIA) references BILARDISTAS.Provincia (PROVINCIA)

alter table BILARDISTAS.Direccion_Usuario
	add constraint FK_Direccion_Usuario_Codigo_Usuario foreign key (DIRECCION_USUARIO_CODIGO_USUARIO) references BILARDISTAS.Usuario (USUARIO_CODIGO)

alter table BILARDISTAS.Direccion_Usuario
	add constraint FK_Direccion_Usuario_Localidad foreign key (DIRECCION_USUARIO_LOCALIDAD) references BILARDISTAS.Localidad (LOCALIDAD)

alter table BILARDISTAS.Pedido_Cupon
	add constraint FK_Pedido_Cupon_Numero_Cupon foreign key (PEDIDO_CUPON_NRO_CUPON) references BILARDISTAS.Cupon (CUPON_NRO)

alter table BILARDISTAS.Pedido_Cupon
	add constraint FK_Pedido_Cupon_Numero_Pedido foreign key (PEDIDO_CUPON_NRO_PEDIDO) references BILARDISTAS.Pedido (PEDIDO_NRO)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Usuario foreign key (ENVIO_MENSAJERIA_USUARIO) references BILARDISTAS.USUARIO (USUARIO_CODIGO)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Repartidor foreign key (ENVIO_MENSAJERIA_REPARTIDOR) references BILARDISTAS.REPARTIDOR (REPARTIDOR_CODIGO)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Paquete_Tipo foreign key (ENVIO_MENSAJERIA_PAQUETE_TIPO) references BILARDISTAS.Paquete_Tipo (PAQUETE_TIPO)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Medio_Pago foreign key (ENVIO_MENSAJERIA_MEDIO_PAGO) references BILARDISTAS.Medio_De_Pago (MEDIO_PAGO_CODIGO)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Estado foreign key (ENVIO_MENSAJERIA_ESTADO) references BILARDISTAS.Estado_Envio_Mensajeria (ESTADO_ENVIO_MENSAJERIA)

alter table BILARDISTAS.Envio_Mensajeria
	add constraint FK_Envio_Mensajeria_Localidad foreign key (ENVIO_MENSAJERIA_LOCALIDAD) references BILARDISTAS.Localidad (LOCALIDAD)

alter table BILARDISTAS.Repartidor
	add constraint FK_Repartidor_Tipo_Movilidad foreign key (REPARTIDOR_TIPO_MOVILIDAD) references BILARDISTAS.Tipo_Movilidad (TIPO_MOVILIDAD_REPARTIDOR)

alter table BILARDISTAS.Repartidor_Localidad
	add constraint FK_Repartidor_Localidad_Localidad foreign key (LOCALIDAD) references BILARDISTAS.Localidad (LOCALIDAD)

alter table BILARDISTAS.Repartidor_Localidad
	add constraint FK_Repartidor_Localidad_Repartidor foreign key (REPARTIDOR) references BILARDISTAS.Repartidor (REPARTIDOR_CODIGO)

alter table BILARDISTAS.Medio_De_Pago
	add constraint FK_Medio_De_Pago_Usuario foreign key (MEDIO_PAGO_USUARIO) references BILARDISTAS.Usuario (USUARIO_CODIGO)

alter table BILARDISTAS.Medio_De_Pago
	add constraint FK_Medio_De_Pago_Tipo foreign key (MEDIO_PAGO_TIPO) references BILARDISTAS.Medio_Pago_Tipo (MEDIO_PAGO_TIPO)

alter table BILARDISTAS.Medio_De_Pago
	add constraint FK_Medio_De_Pago_Marca_Tarjeta foreign key (MEDIO_PAGO_MARCA_TARJETA) references BILARDISTAS.Marca_Tarjeta (MARCA_TARJETA)

alter table BILARDISTAS.Producto_Local
	add constraint FK_Producto_Local_Codigo_Local foreign key (PRODUCTO_LOCAL_CODIGO_LOCAL) references BILARDISTAS.Local_Tienda (LOCAL_CODIGO)

alter table BILARDISTAS.Producto_Local
	add constraint FK_Producto_Local_Codigo_Producto foreign key (PRODUCTO_LOCAL_CODIGO_PRODUCTO) references BILARDISTAS.Producto (PRODUCTO_CODIGO)

alter table BILARDISTAS.Local_Tienda
	add constraint FK_Local_Tienda_Categoria foreign key (LOCAL_CATEGORIA) references BILARDISTAS.Categoria_Local (CATEGORIA_LOCAL)

alter table BILARDISTAS.Local_Tienda
	add constraint FK_Local_Tienda_Tipo foreign key (LOCAL_TIPO) references BILARDISTAS.Tipo_Local (TIPO_LOCAL)

alter table BILARDISTAS.Local_Tienda
	add constraint FK_Local_Localidad foreign key (LOCAL_LOCALIDAD) references BILARDISTAS.Localidad (LOCALIDAD)

alter table BILARDISTAS.Categoria_Local 
	add constraint FK_Categoria_Local_Tipo_Local foreign key (CATEGORIA_LOCAL_TIPO) references BILARDISTAS.Tipo_Local (TIPO_LOCAL)

alter table BILARDISTAS.Horario_Local 
	add constraint FK_Horario_Local_Dia foreign key (HORARIO_LOCAL_CODIGO_DIA) references BILARDISTAS.Dia (DIA_HORARIO_LOCAL)

alter table BILARDISTAS.Horario_Local 
	add constraint FK_Horario_Local_Codigo_Local foreign key (HORARIO_LOCAL_CODIGO_LOCAL) references BILARDISTAS.Local_Tienda (LOCAL_CODIGO)

alter table BILARDISTAS.Pedido 
	add constraint FK_Pedido_Usuario foreign key (PEDIDO_USUARIO) references BILARDISTAS.Usuario (USUARIO_CODIGO)

alter table BILARDISTAS.Pedido 
	add constraint FK_Pedido_Local foreign key (PEDIDO_LOCAL) references BILARDISTAS.Local_Tienda (LOCAL_CODIGO)

alter table BILARDISTAS.Pedido 
	add constraint FK_Pedido_Medio_Pago foreign key (PEDIDO_MEDIO_PAGO) references BILARDISTAS.Medio_De_Pago (MEDIO_PAGO_CODIGO)

alter table BILARDISTAS.Pedido 
	add constraint FK_Pedido_Estado foreign key (PEDIDO_ESTADO) references BILARDISTAS.Estado_Pedido (ESTADO_PEDIDO)

alter table BILARDISTAS.Pedido 
	add constraint FK_Pedido_Envio foreign key (PEDIDO_ENVIO) references BILARDISTAS.Envio_Pedido (ENVIO_PEDIDO_CODIGO)

alter table BILARDISTAS.Producto_Por_Pedido 
	add constraint FK_Producto_Pedido_Nro foreign key (PRODUCTO_PEDIDO_NRO) references BILARDISTAS.Pedido (PEDIDO_NRO)

alter table BILARDISTAS.Producto_Por_Pedido 
	add constraint FK_Producto_Pedido_Local_Codigo  foreign key (PRODUCTO_PEDIDO_LOCAL_CODIGO) references BILARDISTAS.Producto (PRODUCTO_CODIGO)

alter table BILARDISTAS.Envio_Pedido 
	add constraint FK_Envio_Repartidor foreign key (ENVIO_REPARTIDOR) references BILARDISTAS.Repartidor (REPARTIDOR_CODIGO)

alter table BILARDISTAS.Envio_Pedido 
	add constraint FK_Envio_Direccion foreign key (ENVIO_DIRECCION) references BILARDISTAS.Direccion_Usuario (DIRECCION_USUARIO_CODIGO_USUARIO)

	print ' Foreing Keys creadas con exito ';
end
go

create procedure BILARDISTAS.Crear_Vista_Repartidores_Localidad 
as
begin
exec ('CREATE VIEW BILARDISTAS.Vista_Repartidores_Localidad AS

(select R.REPARTIDOR_CODIGO, E.ENVIO_MENSAJERIA_FECHA, E.ENVIO_MENSAJERIA_LOCALIDAD from BILARDISTAS.Repartidor R
join BILARDISTAS.Envio_Mensajeria E on (E.ENVIO_MENSAJERIA_REPARTIDOR = R.REPARTIDOR_CODIGO)
where E.ENVIO_MENSAJERIA_NRO = (select top 1 M.ENVIO_MENSAJERIA_NRO from BILARDISTAS.Envio_Mensajeria M
where R.REPARTIDOR_CODIGO = M.ENVIO_MENSAJERIA_REPARTIDOR
group by M.ENVIO_MENSAJERIA_NRO, M.ENVIO_MENSAJERIA_FECHA
order by M.ENVIO_MENSAJERIA_FECHA DESC)
group by R.REPARTIDOR_CODIGO, E.ENVIO_MENSAJERIA_FECHA, E.ENVIO_MENSAJERIA_LOCALIDAD
-- LOCALIDAD PEDIDO
union (
select R.REPARTIDOR_CODIGO, P.PEDIDO_FECHA, L.LOCAL_LOCALIDAD from BILARDISTAS.Repartidor R
join BILARDISTAS.Envio_Pedido EP on (EP.ENVIO_REPARTIDOR = R.REPARTIDOR_CODIGO)
join BILARDISTAS.Pedido P on (P.PEDIDO_ENVIO = EP.ENVIO_PEDIDO_CODIGO)
join BILARDISTAS.Local_Tienda L on (L.LOCAL_CODIGO = P.PEDIDO_LOCAL)
where P.PEDIDO_NRO  = (select top 1 PED.PEDIDO_NRO from BILARDISTAS.Envio_Pedido EP
join BILARDISTAS.Pedido PED on (EP.ENVIO_PEDIDO_CODIGO = PED.PEDIDO_ENVIO)
where R.REPARTIDOR_CODIGO = EP.ENVIO_REPARTIDOR
group by PED.PEDIDO_NRO, PED.PEDIDO_FECHA
order by PED.PEDIDO_FECHA DESC)
group by R.REPARTIDOR_CODIGO, P.PEDIDO_FECHA, L.LOCAL_LOCALIDAD
))')
end
go



create procedure BILARDISTAS.Creacion_Indices
as
begin

create index idx_Locales on BILARDISTAS.Local_Tienda (LOCAL_NOMBRE)
create index idx_Envio_Pedido on BILARDISTAS.Envio_Pedido (ENVIO_DIRECCION)
create index idx_Direcciones_Usuarios on BILARDISTAS.Direccion_Usuario (DIRECCION_USUARIO_CODIGO_USUARIO)
create index idx_Estado_Pedidos on BILARDISTAS.Estado_Pedido (ESTADO_PEDIDO_DETALLE)
create index idx_Medios_De_Pago on BILARDISTAS.Medio_De_Pago (MEDIO_PAGO_NRO_TARJETA)
create index idx_Paquete_Tipos on BILARDISTAS.Paquete_Tipo (PAQUETE_TIPO)
create index idx_Estado_Envio_Mensajeria on BILARDISTAS.Estado_Envio_Mensajeria (ESTADO_ENVIO_MENSAJERIA_DETALLE)
create index idx_Provincia on BILARDISTAS.Provincia (PROVINCIA_DETALLE)
create index idx_Localidad on BILARDISTAS.Localidad (LOCALIDAD_DETALLE)
create index idx_Tipo_Reclamo on BILARDISTAS.Tipo_Reclamo (TIPO_RECLAMO_DETALLE)
create index idx_Estado_Reclamo on BILARDISTAS.Estado_Reclamo (ESTADO_RECLAMO_DETALLE)

print ' Indices creados con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Tipo_Movilidad
as
begin

insert into BILARDISTAS.Tipo_Movilidad (TIPO_MOVILIDAD_REPARTIDOR, TIPO_MOVILIDAD_DETALLE)
(Select left(REPARTIDOR_TIPO_MOVILIDAD,1), REPARTIDOR_TIPO_MOVILIDAD
From gd_esquema.Maestra
where REPARTIDOR_TIPO_MOVILIDAD is not null
group by REPARTIDOR_TIPO_MOVILIDAD)


print ' Tabla Tipo_Movilidad creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Estado_Envio_Mensajeria
as
begin


insert into BILARDISTAS.Estado_Envio_Mensajeria
select ROW_NUMBER() over (order by ENVIO_MENSAJERIA_ESTADO),ENVIO_MENSAJERIA_ESTADO
from gd_esquema.Maestra
where ENVIO_MENSAJERIA_ESTADO is not null
group by ENVIO_MENSAJERIA_ESTADO

print ' Tabla Estado_Envio_Mensajeria creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Paquete_Tipo
as
begin


insert into BILARDISTAS.Paquete_Tipo
select PAQUETE_TIPO, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PESO_MAX, PAQUETE_TIPO_PRECIO
from gd_esquema.Maestra
where PAQUETE_TIPO is not null
group by PAQUETE_TIPO, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PESO_MAX, PAQUETE_TIPO_PRECIO

print ' Tabla Paquete_Tipo creada con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Medio_Pago_Tipo
as
begin

insert into BILARDISTAS.Medio_Pago_Tipo
select ROW_NUMBER() over (order by MEDIO_PAGO_TIPO),MEDIO_PAGO_TIPO
from gd_esquema.Maestra
where MEDIO_PAGO_TIPO is not null
group by MEDIO_PAGO_TIPO

print ' Tabla Medio_Pago_Tipo creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Estado_Repartidor_Localidad
as
begin

insert into BILARDISTAS.Estado_Repartidor_Localidad
values ('A', 'Activa')
insert into BILARDISTAS.Estado_Repartidor_Localidad
values ('I','Inactiva')

print ' Tabla creada Estado_Repartidor_Localidad con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Marca_Tarjeta
as
begin

insert into BILARDISTAS.Marca_Tarjeta
select ROW_NUMBER() over (order by MARCA_TARJETA), MARCA_TARJETA
from gd_esquema.Maestra
where MARCA_TARJETA is not null
group by MARCA_TARJETA

print ' Tabla Marca_Tarjeta creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Dia
as
begin

insert into BILARDISTAS.Dia
select ROW_NUMBER() over (order by HORARIO_LOCAL_DIA), HORARIO_LOCAL_DIA
from gd_esquema.Maestra
where HORARIO_LOCAL_DIA is not null
group by HORARIO_LOCAL_DIA

print ' Tabla Dia creada con exito ';
end 
go


create procedure BILARDISTAS.Migracion_Tabla_Estado_Pedido
as
begin

insert into BILARDISTAS.Estado_Pedido
Select ROW_NUMBER() over (order by PEDIDO_ESTADO), PEDIDO_ESTADO
from gd_esquema.Maestra
where PEDIDO_ESTADO is not null
group by PEDIDO_ESTADO

print ' Tabla Estado_Pedido creada con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Tipo_Local
as
begin

insert into BILARDISTAS.TIPO_LOCAL
select LOCAL_TIPO
from gd_esquema.Maestra
where LOCAL_TIPO is not null
group by LOCAL_TIPO

print ' Tabla Tipo_Local creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Provincia
as
begin

insert into BILARDISTAS.Provincia
select ROW_NUMBER() over (order by DIRECCION_USUARIO_PROVINCIA), DIRECCION_USUARIO_PROVINCIA
from gd_esquema.Maestra
where DIRECCION_USUARIO_PROVINCIA is not null
group by DIRECCION_USUARIO_PROVINCIA

print ' Tabla Tabla_Provincia creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Tipo_Reclamo
as
begin

insert into BILARDISTAS.Tipo_Reclamo
select ROW_NUMBER() over (order by RECLAMO_TIPO), RECLAMO_TIPO
from gd_esquema.Maestra
where RECLAMO_TIPO is not null
group by RECLAMO_TIPO

print ' Tabla Tipo_Reclamo creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Estado_Reclamo
as
begin

insert into BILARDISTAS.Estado_Reclamo
select ROW_NUMBER() over (order by RECLAMO_ESTADO), RECLAMO_ESTADO
from gd_esquema.Maestra
where RECLAMO_ESTADO is not null
group by RECLAMO_ESTADO

print ' Tabla Estado_Reclamo creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Tipo_Cupon_Reclamo
as
begin

insert into BILARDISTAS.Tipo_Cupon_Reclamo
select ROW_NUMBER() over (order by CUPON_RECLAMO_TIPO), CUPON_RECLAMO_TIPO
from gd_esquema.Maestra
where CUPON_RECLAMO_TIPO is not null
group by CUPON_RECLAMO_TIPO

print ' Tabla Tipo_Cupon_Reclamo creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Tipo_Cupon
as
begin

insert into BILARDISTAS.Tipo_Cupon
select ROW_NUMBER() over (order by CUPON_TIPO), CUPON_TIPO
from gd_esquema.Maestra
where CUPON_TIPO is not null
group by CUPON_TIPO

print ' Tabla Tipo_Cupon creada con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Operadores
as
begin

insert into BILARDISTAS.Operador (OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC)
select OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
from gd_esquema.Maestra
where OPERADOR_RECLAMO_NOMBRE is not null
group by OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
order by OPERADOR_RECLAMO_NOMBRE

print ' Tabla Tabla_Operadores creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Usuarios
as
begin

insert into BILARDISTAS.Usuario (USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_DNI, USUARIO_FECHA_NAC, USUARIO_FECHA_REGISTRO, USUARIO_TELEFONO, USUARIO_MAIL)
select USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_DNI, USUARIO_FECHA_NAC, USUARIO_FECHA_REGISTRO, USUARIO_TELEFONO, USUARIO_MAIL
from gd_esquema.Maestra
group by USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_DNI, USUARIO_FECHA_NAC, USUARIO_FECHA_REGISTRO, USUARIO_TELEFONO, USUARIO_MAIL
order by USUARIO_NOMBRE

print ' Tabla Usuarios creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Productos
as
begin

insert into BILARDISTAS.Producto
select PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION, PRODUCTO_LOCAL_PRECIO
from gd_esquema.Maestra
where PRODUCTO_LOCAL_CODIGO is not null
group by PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION, PRODUCTO_LOCAL_PRECIO

print ' Tabla Tabla_Productos creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Localidades
as
begin

insert into BILARDISTAS.Localidad
select PROVINCIA, ENVIO_MENSAJERIA_LOCALIDAD
from gd_esquema.Maestra
join BILARDISTAS.Provincia on (ENVIO_MENSAJERIA_PROVINCIA = PROVINCIA_DETALLE)
where ENVIO_MENSAJERIA_LOCALIDAD is not null 
group by ENVIO_MENSAJERIA_LOCALIDAD, PROVINCIA

print ' Tabla Tabla_Localidades creada con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Cupones
as
begin

insert into BILARDISTAS.Cupon
select M.CUPON_NRO, U.USUARIO_CODIGO, TIPO_CUPON, M.CUPON_MONTO, M.CUPON_FECHA_ALTA, M.CUPON_FECHA_VENCIMIENTO
from gd_esquema.Maestra M
join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
join BILARDISTAS.Tipo_Cupon on (M.CUPON_TIPO = TIPO_CUPON_DETALLE)
where CUPON_NRO is not null

print ' Tabla Tabla_Cupones creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Direccion_Usuario
as
begin

insert into BILARDISTAS.Direccion_Usuario
select U.USUARIO_CODIGO, DIRECCION_USUARIO_NOMBRE, DIRECCION_USUARIO_DIRECCION, LOCALIDAD
from gd_esquema.Maestra M
	join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
	join BILARDISTAS.Localidad on (M.DIRECCION_USUARIO_LOCALIDAD = LOCALIDAD_DETALLE)
	join BILARDISTAS.Provincia on (M.DIRECCION_USUARIO_PROVINCIA = PROVINCIA_DETALLE)
where DIRECCION_USUARIO_NOMBRE is not null and LOCALIDAD_PROVINCIA = PROVINCIA
group by U.USUARIO_CODIGO, DIRECCION_USUARIO_NOMBRE, DIRECCION_USUARIO_DIRECCION, LOCALIDAD

print ' Tabla Tabla_Direccion_Usuario creada con exito ';
end
go




create procedure BILARDISTAS.Migracion_Tabla_Medio_de_Pago
as
begin

insert into BILARDISTAS.Medio_De_Pago
select U.USUARIO_CODIGO, MPT.MEDIO_PAGO_TIPO, MT.MARCA_TARJETA, MEDIO_PAGO_NRO_TARJETA from gd_esquema.Maestra M
join BILARDISTAS.Medio_Pago_Tipo MPT on (M.MEDIO_PAGO_TIPO = MPT.MEDIO_PAGO_DETALLE)
join BILARDISTAS.Marca_Tarjeta MT on (M.MARCA_TARJETA = MT.MARCA_TARJETA_DETALLE)
join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
group by U.USUARIO_CODIGO, MPT.MEDIO_PAGO_TIPO, MT.MARCA_TARJETA, MEDIO_PAGO_NRO_TARJETA

print ' Tabla Tabla_Medio_de_Pago creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Repartidores
as
begin

insert into BILARDISTAS.Repartidor
select TM.TIPO_MOVILIDAD_REPARTIDOR, REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC  from gd_esquema.Maestra M
join BILARDISTAS.Tipo_Movilidad TM on (M.REPARTIDOR_TIPO_MOVILIDAD = TM.TIPO_MOVILIDAD_DETALLE)
group by TM.TIPO_MOVILIDAD_REPARTIDOR, REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC

print ' Tabla Tabla_Repartidores creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Envio_Pedido
as
begin

insert into BILARDISTAS.Envio_Pedido
select RE.REPARTIDOR_CODIGO, DU.DIRECCION_USUARIO_CODIGO_USUARIO, PEDIDO_PRECIO_ENVIO PRECIO_ENVIO, PEDIDO_PROPINA from gd_esquema.Maestra M
join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
join BILARDISTAS.Direccion_Usuario DU on (DU.DIRECCION_USUARIO_CODIGO_USUARIO = U.USUARIO_CODIGO)
join BILARDISTAS.Repartidor RE on (RE.REPARTIDOR_NOMBRE = M.REPARTIDOR_NOMBRE and RE.REPARTIDOR_APELLIDO = M.REPARTIDOR_APELLIDO and RE.REPARTIDOR_DNI = M.REPARTIDOR_DNI and RE.REPARTIDOR_EMAIL = M.REPARTIDOR_EMAIL)
where M.PEDIDO_NRO is not null
group by RE.REPARTIDOR_CODIGO ,DU.DIRECCION_USUARIO_CODIGO_USUARIO, PEDIDO_PRECIO_ENVIO, PEDIDO_PROPINA

print ' Tabla Envio_Pedido creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Categoria_Local
as
begin

insert into BILARDISTAS.Categoria_Local
values ('1',1, 'Parrilla')
insert into BILARDISTAS.Categoria_Local
values ('2',1, 'Heladeria')
insert into BILARDISTAS.Categoria_Local
values ('3',1, 'Comidas rapidas')
insert into BILARDISTAS.Categoria_Local
values ('4',2, 'Minimercado')
insert into BILARDISTAS.Categoria_Local
values ('5',2, 'Kiosko')
insert into BILARDISTAS.Categoria_Local
values ('6',2, 'Supermercado')

print ' Tabla Categoria_Local creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Local_Tienda
as
begin

insert into BILARDISTAS.Local_Tienda (LOCAL_TIPO, LOCAL_NOMBRE,LOCAL_DESCRIPCION, LOCAL_DIRECCION, LOCAL_LOCALIDAD)
select LOC.TIPO_LOCAL, LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION, L.LOCALIDAD from gd_esquema.Maestra M
join BILARDISTAS.Localidad L on (M.LOCAL_LOCALIDAD = L.LOCALIDAD_DETALLE)
join BILARDISTAS.Provincia P on (M.LOCAL_PROVINCIA = P.PROVINCIA_DETALLE)
join BILARDISTAS.Tipo_Local LOC on (M.LOCAL_TIPO = LOC.TIPO_LOCAL_DETALLE)
where LOCAL_NOMBRE is not null and LOCALIDAD_PROVINCIA = PROVINCIA
group by LOC.TIPO_LOCAL, LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION, L.LOCALIDAD 

print ' Tabla Local_Tienda creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Horario_Local
as
begin

insert into BILARDISTAS.Horario_Local
select D.DIA_HORARIO_LOCAL, L.LOCAL_CODIGO, HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE from gd_esquema.Maestra M
join BILARDISTAS.Dia D on (M.HORARIO_LOCAL_DIA = D.DIA_HORARIO_LOCAL_DETALLE)
join BILARDISTAS.Local_Tienda L on (M.LOCAL_NOMBRE = L.LOCAL_NOMBRE)
group by L.LOCAL_CODIGO, D.DIA_HORARIO_LOCAL, HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE

print ' Tabla Horario_Local creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Pedidos
as
begin

insert into BILARDISTAS.Pedido
select distinct M.PEDIDO_NRO, U.USUARIO_CODIGO, L.LOCAL_CODIGO, MP.MEDIO_PAGO_CODIGO, EST.ESTADO_PEDIDO, EP.ENVIO_PEDIDO_CODIGO, M.PEDIDO_OBSERV, M.PEDIDO_FECHA, M.PEDIDO_FECHA_ENTREGA, M.PEDIDO_TIEMPO_ESTIMADO_ENTREGA, M.PEDIDO_CALIFICACION, M.PEDIDO_TOTAL_PRODUCTOS, M.PEDIDO_TARIFA_SERVICIO, M.PEDIDO_TOTAL_CUPONES, M.PEDIDO_TOTAL_SERVICIO from gd_esquema.Maestra M
join BILARDISTAS.Estado_Pedido EST on (M.PEDIDO_ESTADO = EST.ESTADO_PEDIDO_DETALLE)
join BILARDISTAS.Medio_De_Pago MP on (M.MEDIO_PAGO_NRO_TARJETA = MP.MEDIO_PAGO_NRO_TARJETA)
join BILARDISTAS.Usuario U on (M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
join BILARDISTAS.Local_Tienda L on (M.LOCAL_NOMBRE = L.LOCAL_NOMBRE)
join BILARDISTAS.Direccion_Usuario DU on (DU.DIRECCION_USUARIO_CODIGO_USUARIO = U.USUARIO_CODIGO)
join BILARDISTAS.Repartidor RE on (RE.REPARTIDOR_DNI = M.REPARTIDOR_DNI and RE.REPARTIDOR_EMAIL = M.REPARTIDOR_EMAIL)
join BILARDISTAS.Envio_Pedido EP on (EP.ENVIO_DIRECCION = DU.DIRECCION_USUARIO_CODIGO_USUARIO)
where EP.ENVIO_REPARTIDOR = RE.REPARTIDOR_CODIGO and EP.ENVIO_DIRECCION = DU.DIRECCION_USUARIO_CODIGO_USUARIO and EP.ENVIO_PROPINA = M.PEDIDO_PROPINA and EP.ENVIO_PRECIO = M.PEDIDO_PRECIO_ENVIO

print ' Tabla Tabla_Pedidos creada con exito ';
end
go

create procedure BILARDISTAS.Migracion_Tabla_Producto_Por_Pedido
as
begin

insert into BILARDISTAS.Producto_Por_Pedido
select PEDIDO_NRO, PRODUCTO_LOCAL_CODIGO, sum(PRODUCTO_CANTIDAD),PRODUCTO_LOCAL_PRECIO,sum(PRODUCTO_CANTIDAD) * PRODUCTO_LOCAL_PRECIO  from gd_esquema.Maestra
where PEDIDO_NRO is not null and PRODUCTO_LOCAL_CODIGO is not null
group by PEDIDO_NRO, PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_PRECIO
order by PEDIDO_NRO

print ' Tabla Producto_Por_Pedido creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Producto_Por_Local
as
begin

insert into BILARDISTAS.Producto_Local
select L.LOCAL_CODIGO, M.PRODUCTO_LOCAL_CODIGO from gd_esquema.Maestra M
join BILARDISTAS.Local_Tienda L on (M.LOCAL_NOMBRE = L.LOCAL_NOMBRE)
where M.PRODUCTO_LOCAL_CODIGO is not null
group by L.LOCAL_CODIGO, M.PRODUCTO_LOCAL_CODIGO

print ' Tabla Producto_Por_Local creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Envio_Mensajeria
as
begin

insert into BILARDISTAS.Envio_Mensajeria
select distinct M.ENVIO_MENSAJERIA_NRO, U.USUARIO_CODIGO, RE.REPARTIDOR_CODIGO, PT.PAQUETE_TIPO, MP.MEDIO_PAGO_CODIGO, EEM.ESTADO_ENVIO_MENSAJERIA, M.ENVIO_MENSAJERIA_DIR_ORIG, M.ENVIO_MENSAJERIA_DIR_DEST, L.LOCALIDAD, M.ENVIO_MENSAJERIA_KM, M.ENVIO_MENSAJERIA_PRECIO_ENVIO, M.ENVIO_MENSAJERIA_PRECIO_SEGURO, M.ENVIO_MENSAJERIA_PROPINA, M.ENVIO_MENSAJERIA_TOTAL, M.ENVIO_MENSAJERIA_OBSERV, M.ENVIO_MENSAJERIA_FECHA, M.ENVIO_MENSAJERIA_FECHA_ENTREGA, M.ENVIO_MENSAJERIA_TIEMPO_ESTIMADO, M.ENVIO_MENSAJERIA_CALIFICACION from gd_esquema.Maestra M
join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
join BILARDISTAS.Repartidor RE on (RE.REPARTIDOR_NOMBRE = M.REPARTIDOR_NOMBRE and RE.REPARTIDOR_APELLIDO = M.REPARTIDOR_APELLIDO and RE.REPARTIDOR_DNI = M.REPARTIDOR_DNI and RE.REPARTIDOR_EMAIL = M.REPARTIDOR_EMAIL)
join BILARDISTAS.Paquete_Tipo PT on (M.PAQUETE_TIPO = PT.PAQUETE_TIPO) 
join BILARDISTAS.Medio_De_Pago MP on (M.MEDIO_PAGO_NRO_TARJETA = MP.MEDIO_PAGO_NRO_TARJETA)
join BILARDISTAS.Estado_Envio_Mensajeria EEM on (M.ENVIO_MENSAJERIA_ESTADO = EEM.ESTADO_ENVIO_MENSAJERIA_DETALLE)
join BILARDISTAS.Localidad L on (M.ENVIO_MENSAJERIA_LOCALIDAD = L.LOCALIDAD_DETALLE)
join BILARDISTAS.Provincia P on (M.ENVIO_MENSAJERIA_PROVINCIA = P.PROVINCIA_DETALLE)
where LOCALIDAD_PROVINCIA = PROVINCIA

print ' Tabla Envio_Mensajeria creada con exito ';
end
go

create procedure BILARDISTAS.Migracion_Tabla_Repartidor_Localidad
as
begin

--REPARTIDOR_LOCALIDAD ACTIVOS
insert into BILARDISTAS.Repartidor_Localidad
select (select top 1 ENVIO_MENSAJERIA_LOCALIDAD from BILARDISTAS.Vista_Repartidores_Localidad
where REPARTIDOR_CODIGO = R.REPARTIDOR_CODIGO
order by ENVIO_MENSAJERIA_FECHA DESC), R.REPARTIDOR_CODIGO,  'A' from BILARDISTAS.Repartidor R


--REPARTIDOR_LOCALIDAD INACTIVOS
insert into BILARDISTAS.Repartidor_Localidad
select distinct  EM.ENVIO_MENSAJERIA_LOCALIDAD,  EM.ENVIO_MENSAJERIA_REPARTIDOR, 'I' from BILARDISTAS.Envio_Mensajeria EM
where EM.ENVIO_MENSAJERIA_LOCALIDAD not in (select RL.LOCALIDAD from BILARDISTAS.Repartidor_Localidad RL
where RL.REPARTIDOR = EM.ENVIO_MENSAJERIA_REPARTIDOR)
group by EM.ENVIO_MENSAJERIA_REPARTIDOR, EM.ENVIO_MENSAJERIA_LOCALIDAD

union
(select distinct L.LOCAL_LOCALIDAD, EP.ENVIO_REPARTIDOR, 'I' from BILARDISTAS.Envio_Pedido EP
join BILARDISTAS.Pedido P on (P.PEDIDO_ENVIO = EP.ENVIO_PEDIDO_CODIGO)
join BILARDISTAS.Local_Tienda L on (P.PEDIDO_LOCAL = L.LOCAL_CODIGO)
where L.LOCAL_LOCALIDAD not in (select RL.LOCALIDAD from BILARDISTAS.Repartidor_Localidad RL
where RL.REPARTIDOR = EP.ENVIO_REPARTIDOR)
group by EP.ENVIO_REPARTIDOR, L.LOCAL_LOCALIDAD
)
order by EM.ENVIO_MENSAJERIA_REPARTIDOR

print ' Tabla Repartidor_Localidad creada con exito ';
end
go



create procedure BILARDISTAS.Migracion_Tabla_Pedido_Por_Cupon
as
begin

insert into BILARDISTAS.Pedido_Cupon
select CUPON_NRO, PEDIDO_NRO
from gd_esquema.Maestra
where PEDIDO_NRO is not null and CUPON_NRO is not null

print ' Tabla Pedido_Por_Cupon creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Reclamos
as
begin

insert into BILARDISTAS.Reclamo
select RECLAMO_NRO, U.USUARIO_CODIGO, OP.OPERADOR_CODIGO, M.PEDIDO_NRO, TRec.TIPO_RECLAMO, ERec.ESTADO_RECLAMO, M.RECLAMO_FECHA, M.RECLAMO_DESCRIPCION, M.RECLAMO_FECHA_SOLUCION, M.RECLAMO_SOLUCION, M.RECLAMO_CALIFICACION  from gd_esquema.Maestra M
	join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
	join BILARDISTAS.Tipo_Reclamo TRec on (M.RECLAMO_TIPO = TRec.TIPO_RECLAMO_DETALLE)
	join BILARDISTAS.Estado_Reclamo ERec on (M.RECLAMO_ESTADO = ERec.ESTADO_RECLAMO_DETALLE)
	join BILARDISTAS.Operador OP on (OP.OPERADOR_RECLAMO_MAIL = M.OPERADOR_RECLAMO_MAIL and OP.OPERADOR_RECLAMO_DNI = M.OPERADOR_RECLAMO_DNI)

print ' Tabla Tabla_Reclamos creada con exito ';
end
go


create procedure BILARDISTAS.Migracion_Tabla_Cupon_Por_Reclamo
as
begin

insert into BILARDISTAS.Cupon
select M.CUPON_RECLAMO_NRO, U.USUARIO_CODIGO, TIPO_CUPON, M.CUPON_RECLAMO_MONTO, M.CUPON_RECLAMO_FECHA_ALTA, M.CUPON_RECLAMO_FECHA_VENCIMIENTO
from gd_esquema.Maestra M
    join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
    join BILARDISTAS.Tipo_Cupon on (M.CUPON_RECLAMO_TIPO = TIPO_CUPON_DETALLE)
where M.CUPON_RECLAMO_NRO not in (select CUPON_NRO from BILARDISTAS.Cupon)


insert into BILARDISTAS.Cupon_Reclamo
select M.CUPON_RECLAMO_NRO, M.RECLAMO_NRO, M.CUPON_RECLAMO_NRO, M.CUPON_RECLAMO_MONTO, M.CUPON_RECLAMO_FECHA_ALTA, M.CUPON_RECLAMO_FECHA_VENCIMIENTO, TIPO_CUPON_RECLAMO
from gd_esquema.Maestra M
    join BILARDISTAS.Usuario U on (M.USUARIO_NOMBRE = U.USUARIO_NOMBRE and M.USUARIO_APELLIDO = U.USUARIO_APELLIDO and M.USUARIO_DNI = U.USUARIO_DNI and M.USUARIO_MAIL = U.USUARIO_MAIL)
    join BILARDISTAS.Tipo_Cupon_Reclamo on (M.CUPON_RECLAMO_TIPO = TIPO_CUPON_RECLAMO_DETALLE)
where M.CUPON_RECLAMO_NRO is not null

print ' Tabla Cupon_Por_Reclamo creada con exito ';
end
go


create procedure BILARDISTAS.Eliminar_Constraints
as
begin
alter table BILARDISTAS.Reclamo
	drop constraint FK_Reclamo_Usuario
alter table BILARDISTAS.Reclamo
	drop constraint FK_Reclamo_Pedido
alter table BILARDISTAS.Reclamo
	drop constraint FK_Reclamo_Tipo
alter table BILARDISTAS.Reclamo
	drop constraint FK_Reclamo_Estado
alter table BILARDISTAS.Cupon_Reclamo
	drop constraint FK_Cupon_Reclamo_Cupon
alter table BILARDISTAS.Cupon_Reclamo
	drop constraint FK_Cupon_Reclamo_Codigo_Reclamo
alter table BILARDISTAS.Cupon
	drop constraint FK_Cupon_Usuario
alter table BILARDISTAS.Cupon
	drop constraint FK_Cupon_Tipo
alter table BILARDISTAS.Localidad
	drop constraint FK_Localidad_Provincia
alter table BILARDISTAS.Direccion_Usuario
	drop constraint FK_Direccion_Usuario_Codigo_Usuario
alter table BILARDISTAS.Direccion_Usuario
	drop constraint FK_Direccion_Usuario_Localidad
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
drop table BILARDISTAS.Estado_Pedido
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
drop table BILARDISTAS.Tipo_Cupon_Reclamo
drop table BILARDISTAS.Usuario
end
go


create procedure BILARDISTAS.Iniciar_Migracion 
as
begin

exec BILARDISTAS.Creacion_Indices
exec BILARDISTAS.Migracion_Tabla_Tipo_Movilidad
exec BILARDISTAS.Migracion_Tabla_Estado_Envio_Mensajeria
exec BILARDISTAS.Migracion_Tabla_Paquete_Tipo
exec BILARDISTAS.Migracion_Tabla_Medio_Pago_Tipo
exec BILARDISTAS.Migracion_Tabla_Estado_Repartidor_Localidad
exec BILARDISTAS.Migracion_Tabla_Marca_Tarjeta
exec BILARDISTAS.Migracion_Tabla_Dia
exec BILARDISTAS.Migracion_Tabla_Estado_Pedido
exec BILARDISTAS.Migracion_Tabla_Tipo_Local
exec BILARDISTAS.Migracion_Tabla_Provincia
exec BILARDISTAS.Migracion_Tabla_Tipo_Reclamo
exec BILARDISTAS.Migracion_Tabla_Estado_Reclamo
exec BILARDISTAS.Migracion_Tabla_Tipo_Cupon_Reclamo
exec BILARDISTAS.Migracion_Tabla_Tipo_Cupon
exec BILARDISTAS.Migracion_Tabla_Operadores
exec BILARDISTAS.Migracion_Tabla_Usuarios
exec BILARDISTAS.Migracion_Tabla_Productos
exec BILARDISTAS.Migracion_Tabla_Localidades
exec BILARDISTAS.Migracion_Tabla_Cupones
exec BILARDISTAS.Migracion_Tabla_Direccion_Usuario
exec BILARDISTAS.Migracion_Tabla_Medio_de_Pago
exec BILARDISTAS.Migracion_Tabla_Repartidores
exec BILARDISTAS.Migracion_Tabla_Envio_Pedido
exec BILARDISTAS.Migracion_Tabla_Categoria_Local
exec BILARDISTAS.Migracion_Tabla_Local_Tienda
exec BILARDISTAS.Migracion_Tabla_Horario_Local
exec BILARDISTAS.Migracion_Tabla_Pedidos
exec BILARDISTAS.Migracion_Tabla_Producto_Por_Pedido
exec BILARDISTAS.Migracion_Tabla_Producto_Por_Local
exec BILARDISTAS.Migracion_Tabla_Envio_Mensajeria
exec BILARDISTAS.Crear_Vista_Repartidores_Localidad 
exec BILARDISTAS.Migracion_Tabla_Repartidor_Localidad
exec BILARDISTAS.Migracion_Tabla_Pedido_Por_Cupon
exec BILARDISTAS.Migracion_Tabla_Reclamos
exec BILARDISTAS.Migracion_Tabla_Cupon_Por_Reclamo

print ' Tablas migradas con exito ';
end
go



---------------------------------------------------------------------------------------------------------
--------------------------------------- EJECUCION DE STORED PROCEDURES ----------------------------------
---------------------------------------------------------------------------------------------------------


exec BILARDISTAS.Creacion_Tablas
exec BILARDISTAS.Creacion_PKs
exec BILARDISTAS.Creacion_Fks
exec BILARDISTAS.Iniciar_Migracion
