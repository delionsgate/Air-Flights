--@Autor: Zuriel Zárate García y Luis Axel Núñez Quintana
--@Fecha creación:	03/06/2022
--@Descripción:	Archivo de carga inicial

connect zn_proy_admin/axzu

prompt Carga aeropuerto...
@s-09-carga_aeropuerto.sql

prompt Carga empleado...
@s-09-carga_empleado.sql

prompt Carga pasajero...
@s-09-carga_pasajero.sql

prompt Carga pasajero email...
@s-09-carga_pasajero_email.sql

prompt Carga avion...
@s-09-carga_avion.sql

prompt Carga status_vuelo...
@s-09-carga_status_vuelo.sql

prompt Carga tipo_paquete...
@s-09-carga_tipo_paquete.sql