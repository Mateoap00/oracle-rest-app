-- Conectado como base2.

-- Habilitar ORDS.
BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'base2',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'base2',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;