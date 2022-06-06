--@Autor: Zuriel Zárate García y Luis Axel Núñez Quintana
--@Fecha creación:	04/06/2022
--@Descripción:	Trigger para evitar la creación de más de 5 links por empleado

connect zn_proy_admin/axzu

create or replace trigger trg_link_empleado
for insert or update of num_link, empleado_id, link on link_empleado
compound trigger

v_cuenta number;
v_empleado_id number := :new.empleado_id;

before statement is
begin
  select count(*)
  into v_cuenta
  from link_empleado
  where empleado_id = v_empleado_id;
  case 
    when inserting then
    if v_cuenta > 4 then
      raise_application_error(-20006,'Error: Un empleado no puede registrar más de 5 links');
    end if;
  end case;
end before statement;

before each row is

begin
  case 
    when inserting then
      if(:new.num_link != v_cuenta + 1) then
        raise_application_error(-20007,'Error: Número de links incorrecto, esperado: ' || v_cuenta + 1);
      end if;
      
    when updating then
      if (:new.empleado_id != :old.empleado_id) or (:new.num_link != :old.num_link) then
        raise_application_error(-20008,'Error: No se pueden actualizar los parámetros de la llave primaria.');
      end if;
  end case;
end before each row;

end trg_link_empleado;
/
show errors