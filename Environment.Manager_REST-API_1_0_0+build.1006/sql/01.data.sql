TRUNCATE public.infrastructure_provider_type CASCADE;

--
-- Insert Infrastructure Provider Types
--
INSERT INTO public.infrastructure_provider_type(id, name) VALUES(1, 'AWS');
INSERT INTO public.infrastructure_provider_type(id, name) VALUES(2, 'Azure');
INSERT INTO public.infrastructure_provider_type(id, name) VALUES(3, 'Google Cloud');
INSERT INTO public.infrastructure_provider_type(id, name) VALUES(4, 'Generic');


--
-- Insert Infrastructure Provider Types Details for type AWS
--
INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(1, 1, 'access_key', 'Access Key', 1, 0, 'true');


INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(2, 1, 'secret_key', 'Secret Key', 1, 1, 'true');



--
-- Insert Infrastructure Provider Types Details for type Azure Portal
--
INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(6, 2, 'subscription_id', 'Subscription ID', 0, 0, 'false');

INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(7, 2, 'tenant_id', 'Tenant ID', 0, 1, 'false');

INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(8, 2, 'client_id', 'Client ID', 0, 2, 'false');

INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(9, 2, 'client_secret', 'Client Secret', 1, 3, 'true');



--
-- Insert Infrastructure Provider Types Details for type Google Cloud
--
INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(10, 3, 'credentials', 'Credentials', 2, 0, 'true');



--
-- Insert Infrastructure Provider Types Details for type Generic
--
INSERT INTO public.infrastructure_provider_type_detail(id, infrastructure_provider_type_id, property, property_name, property_type, property_order, property_mandatory)
        VALUES(11, 4, 'key-value', 'Key Value', 1, 0, 'true');